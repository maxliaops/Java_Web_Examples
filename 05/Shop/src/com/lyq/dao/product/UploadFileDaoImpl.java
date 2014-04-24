package com.lyq.dao.product;

import org.springframework.stereotype.Repository;

import com.lyq.dao.DaoSupport;
import com.lyq.model.product.UploadFile;
@Repository("uploadFileDao")
public class UploadFileDaoImpl extends DaoSupport<UploadFile> implements UploadFileDao {

}
