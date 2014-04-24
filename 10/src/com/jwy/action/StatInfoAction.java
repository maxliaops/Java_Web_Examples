package com.jwy.action;

import java.awt.Color;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRichTextString;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.CellRangeAddress;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.jwy.dao.ICourseDao;
import com.jwy.dao.ISpecialtyDao;
import com.jwy.dto.Course;
import com.jwy.dto.Specialty;
import com.jwy.dto.StuUser;
import com.lowagie.text.Document;
import com.lowagie.text.Element;
import com.lowagie.text.Font;
import com.lowagie.text.PageSize;
import com.lowagie.text.Paragraph;
import com.lowagie.text.pdf.BaseFont;
import com.lowagie.text.pdf.PdfPCell;
import com.lowagie.text.pdf.PdfPTable;
import com.lowagie.text.pdf.PdfWriter;

public class StatInfoAction extends DispatchAction {

	private ISpecialtyDao specialtyDao;
	private ICourseDao courseDao;

	/**
	 * @param specialtyDao
	 *            the specialtyDao to set
	 */
	public void setSpecialtyDao(ISpecialtyDao specialtyDao) {
		this.specialtyDao = specialtyDao;
	}

	/**
	 * @param courseDao
	 *            the courseDao to set
	 */
	public void setCourseDao(ICourseDao courseDao) {
		this.courseDao = courseDao;
	}

	/**
	 * 按照专业编号，课程名称，授课教师姓名进行搜索
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 */
	public ActionForward findBySearch(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {

		List<Specialty> sList = specialtyDao.findByAll();
		Map<String, String> map = new HashMap<String, String>();
		if (request.getParameter("specialtyId") != null
				&& !request.getParameter("specialtyId").equals("-1")) {
			map.put("specialtyId", request.getParameter("specialtyId"));
		}
		if (request.getParameter("name") != null
				&& !request.getParameter("name").equals("")) {
			map.put("name", request.getParameter("name"));
		}
		if (request.getParameter("teacherName") != null
				&& !request.getParameter("teacherName").equals("")) {
			map.put("teacherName", request.getParameter("teacherName"));
		}
		List<Object[]> clist = courseDao.findByStat(map);
		request.setAttribute("sList", sList);
		request.setAttribute("cList", clist);
		return mapping.findForward("showStat");
	}

	/**
	 * 跟据课程编号查询选择该门课程的学生
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 */
	public ActionForward stuList(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		Integer specialtyId = Integer.valueOf(request
				.getParameter("specialtyId"));
		Specialty specialty = specialtyDao.findById(specialtyId);// 专业信息
		Integer courseId = Integer.valueOf(request.getParameter("courseId"));
		List<Object[]> list = courseDao.findSelectStu(courseId);
		Course course = courseDao.findByID(courseId);
		System.out.println(courseId);
		request.setAttribute("specialty", specialty);
		request.setAttribute("stuList", list);
		request.setAttribute("course", course);
		return mapping.findForward("stuList");
	}

	/**
	 * 将上课学生名单导出PDF文档
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward exPDF(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		Integer specialtyId = Integer.valueOf(request.getParameter("specialtyId"));
		Specialty specialty = specialtyDao.findById(specialtyId);// 专业信息
		Integer courseId = Integer.valueOf(request.getParameter("courseId"));
		List<Object[]> list = courseDao.findSelectStu(courseId);
		Course course = courseDao.findByID(courseId);

		response.setContentType("text/html;charset=GBK");
		response.setContentType("application/xml");
		response.setHeader("Content-Disposition", "attachment;filename="
				+ new String(course.getName().getBytes(), "iso-8859-1")+".pdf");

		OutputStream outs = response.getOutputStream(); // 获取输出流

		Document document = new Document(PageSize.A4);

		PdfWriter.getInstance(document, outs);
		document.open();
		// 设置中文字体
		BaseFont bfChinese = BaseFont.createFont("STSong-Light",
				"UniGB-UCS2-H", BaseFont.NOT_EMBEDDED);

		Font t1 = new Font(bfChinese, 20, Font.BOLD); // 设置一级标题字体
		Font t2 = new Font(bfChinese, 15, Font.BOLD); // 设置二级标题字体
		Font f1 = new Font(bfChinese, 12, Font.NORMAL); // 设置正文字体

		Paragraph pragraph = new Paragraph(
				specialty.getEnterYear() + "届" + specialty.getLangthYear()
						+ "年制" + specialty.getName() + "专业", t1);
		pragraph.setAlignment(Paragraph.ALIGN_CENTER);
		document.add(pragraph);

		pragraph = new Paragraph(course.getName() + "课程听课人员名单"+"   听课总人数："+list.size()+" 人", t2);
		pragraph.setAlignment(Paragraph.ALIGN_CENTER);
		document.add(pragraph);
		pragraph = new Paragraph("授课教师" + course.getTeacherName(), t2);
		pragraph.setAlignment(Paragraph.ALIGN_CENTER);
		document.add(pragraph);

		// 建立一个表格
		PdfPTable table = new PdfPTable(4);
		table.setSpacingBefore(40f);// 设置表格上面空白宽度

		// 生成表头
		String[] bt = new String[] { "学生姓名", "学号", "性别", "联系电话" };
		for (int i = 0; i < bt.length; i++) {
			PdfPCell cell = new PdfPCell(new Paragraph(bt[i], f1)); // 建立一个单元格
			cell.setBackgroundColor(Color.GRAY);
			cell.setHorizontalAlignment(Element.ALIGN_CENTER); // 设置内容水平居中显示
			cell.setVerticalAlignment(Element.ALIGN_MIDDLE); // 设置垂直居中
			table.addCell(cell);
		}

		for (int i = 0; i < list.size(); i++) {
			Object[] o = list.get(i);
			StuUser stuUser = (StuUser) o[0];
			PdfPCell nameCell = new PdfPCell(new Paragraph(stuUser.getStuName(), f1)); // 建立一个单元格
			nameCell.setHorizontalAlignment(Element.ALIGN_CENTER); // 设置内容水平居中显示
			nameCell.setVerticalAlignment(Element.ALIGN_MIDDLE); // 设置垂直居中
			PdfPCell stuNoCell = new PdfPCell(new Paragraph(stuUser.getStuNo(),f1)); // 建立一个单元格
			stuNoCell.setHorizontalAlignment(Element.ALIGN_CENTER); // 设置内容水平居中显示
			stuNoCell.setVerticalAlignment(Element.ALIGN_MIDDLE); // 设置垂直居中
			PdfPCell stuSexCell = new PdfPCell(new Paragraph(stuUser.getStuSex(), f1)); // 建立一个单元格
			stuSexCell.setHorizontalAlignment(Element.ALIGN_CENTER); // 设置内容水平居中显示
			stuSexCell.setVerticalAlignment(Element.ALIGN_MIDDLE); // 设置垂直居中
			PdfPCell telCell = new PdfPCell(new Paragraph(stuUser.getTel(), f1)); // 建立一个单元格
			telCell.setHorizontalAlignment(Element.ALIGN_CENTER); // 设置内容水平居中显示
			telCell.setVerticalAlignment(Element.ALIGN_MIDDLE); // 设置垂直居中
			table.addCell(nameCell);
			table.addCell(stuNoCell);
			table.addCell(stuSexCell);
			table.addCell(telCell);
		}
		document.add(table);
		document.close();
		outs.close();

		return null;
	}

	/**
	 * 将上课学生信息导出为Excel文档
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward exExcel(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)throws Exception {
		 
		Integer specialtyId = Integer.valueOf(request.getParameter("specialtyId"));
		Specialty specialty = specialtyDao.findById(specialtyId);// 专业信息
		Integer courseId = Integer.valueOf(request.getParameter("courseId"));
		List<Object[]> list = courseDao.findSelectStu(courseId);
		Course course = courseDao.findByID(courseId);
		
		response.setContentType("text/html;charset=GBK");
		response.setContentType("application/xml");
		response.setHeader("Content-Disposition", "attachment;filename="
				+ new String(course.getName().getBytes(), "iso-8859-1")+ ".xls");
		
		HSSFWorkbook workBook = new HSSFWorkbook(); // 创建 一个excel文档对象
		HSSFSheet sheet = workBook.createSheet(); 	// 创建一个工作薄对象
		HSSFCell cell = null;						//声明单元格对象
		
		sheet.setColumnWidth(0,3000);
		sheet.setColumnWidth(1,3000);
		sheet.setColumnWidth(2,2000);
		sheet.setColumnWidth(3,4000);
		
		HSSFCellStyle style = workBook.createCellStyle();	//创建样式对象
		style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		
		// 合并单元格操作
		sheet.addMergedRegion(new CellRangeAddress(0, 0, 0, 3));
		sheet.addMergedRegion(new CellRangeAddress(1, 1, 0, 3));
		sheet.addMergedRegion(new CellRangeAddress(2, 2, 0, 3));
		cell = sheet.createRow(0).createCell(0);
		cell.setCellStyle(style);
		cell.setCellValue(new HSSFRichTextString(specialty.getEnterYear() + "届" + specialty.getLangthYear()
				+ "年制" + specialty.getName() + "专业"));
		cell = sheet.createRow(1).createCell(0);
		cell.setCellStyle(style);
		cell.setCellValue(new HSSFRichTextString(course.getName() + "课程听课人员名单"+"   听课总人数："+list.size()+" 人"));
		cell = sheet.createRow(2).createCell(0);
		cell.setCellStyle(style);
		cell.setCellValue(new HSSFRichTextString("授课教师" + course.getTeacherName()));
		
		//设置边框样式 
		HSSFCellStyle tableStyle = workBook.createCellStyle();
		tableStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		tableStyle.setBorderTop((short)1);
		tableStyle.setBorderBottom((short)1);
		tableStyle.setBorderLeft((short)1);
		tableStyle.setBorderRight((short)1);
		
		// 生成表头
		String[] bt = new String[] { "学生姓名", "学号", "性别", "联系电话" };
		HSSFRow row = sheet.createRow(3);  // 创建一个行对象
		for (int i = 0; i < bt.length; i++) {
			cell = row.createCell(i);
			cell.setCellStyle(tableStyle);
			cell.setCellValue(new HSSFRichTextString(bt[i]));
		}
		//写入表格内容
		for (int i = 0; i < list.size(); i++) {
			row = sheet.createRow(i+4);   // 创建一个行对象
			Object[] o = list.get(i);
			StuUser stuUser = (StuUser) o[0];
			cell = row.createCell(0); 
			cell.setCellStyle(tableStyle);
			cell.setCellValue(new HSSFRichTextString(stuUser.getStuName()));
			cell = row.createCell(1);
			cell.setCellStyle(tableStyle);
			cell.setCellValue(new HSSFRichTextString(stuUser.getStuNo()));
			cell = row.createCell(2);
			cell.setCellStyle(tableStyle);
			cell.setCellValue(new HSSFRichTextString(stuUser.getStuSex()));
			cell = row.createCell(3);
			cell.setCellStyle(tableStyle);
			cell.setCellValue(new HSSFRichTextString(stuUser.getTel()));
		}	
		workBook.write(response.getOutputStream());								//将文档对象写入文件输出流
		return null;
	}
}