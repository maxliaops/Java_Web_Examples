package electric.electricUtils;
import javax.servlet.http.*;

public class ParamUtils {

  public static String getParameter(HttpServletRequest request,
                                    String paramName) {
    return getParameter(request, paramName, false);
  }

  public static String getParameter(HttpServletRequest request,
                                    String paramName, String defaultStr) {
    String temp = request.getParameter(paramName);

    if (temp != null) {
      if (temp.equals("")) {
        return defaultStr;
      }
      else {
        return nullToString(temp);
      }
    }
    else {
      return defaultStr;
    }

  }

  public static String getEscapeHTMLParameter(HttpServletRequest request,
                                              String paramName) {
    return nullToString(StringUtils.escapeHTMLTags(ParamUtils.getParameter(
        request, paramName, true)));
  }

  public static String getEscapeHTMLParameter(HttpServletRequest request,
                                              String paramName,
                                              String defaultValue) {
    String temp = StringUtils.escapeHTMLTags(ParamUtils.getParameter(request,
        paramName, true));
    if ( (temp == null) || (temp.equals(""))) {
      temp = defaultValue;
    }
    return nullToString(temp);
  }

  public static String getParameter(HttpServletRequest request,
                                    String paramName, boolean emptyStringsOK) {
    String temp = request.getParameter(paramName);
    if (temp != null) {
      if (temp.equals("") && !emptyStringsOK) {
        return "";
      }
      else {
        return temp;
      }
    }
    else {
      return "";
    }
  }


  public static int getIntParameter(HttpServletRequest request,
                                    String paramName, int defaultNum) {
    String temp = request.getParameter(paramName);
    if (temp != null && !temp.equals("")) {
      int num = defaultNum;
      try {
        num = Integer.parseInt(temp);
      }
      catch (Exception ignored) {}
      return num;
    }
    else {
      return defaultNum;
    }
  }

  public static int getIntParameter(HttpServletRequest request,
                                    String paramName) {
    return getIntParameter(request, paramName, 0);
  }

  public static String nullToString(String oldString) {
    if (oldString == null) {
      return "";
    }
    return oldString;
  }

}
