package electric.electricUtils;

public class StringUtils {

  public static String toChinese(String strvalue) {
    try {
      if (strvalue == null) {
        return "";
      }
      else {

        strvalue = new String(strvalue.getBytes("ISO8859_1"), "GB2312");
        return strvalue;
      }
    }
    catch (Exception e) {
      return "";
    }
  }

  public static final String escapeHTMLTags(String input) {
    if (input == null || input.length() == 0) {
      return input;
    }
    StringBuffer buf = new StringBuffer(input.length());
    char ch = ' ';
    for (int i = 0; i < input.length(); i++) {
      ch = input.charAt(i);
      if (ch == '<') {
        buf.append("&lt;");
      }
      else if (ch == '>') {
        buf.append("&gt;");
      }
      else {
        buf.append(ch);
      }
    }
    return buf.toString();
  }

}
