package electric.dbs;

import java.io.*;

public class NewsNotFoundException
    extends Exception {

  private Throwable nestedThrowable = null;

  public NewsNotFoundException() {
    super();
  }

  public NewsNotFoundException(String msg) {
    super(msg);
  }

  public NewsNotFoundException(Throwable nestedThrowable) {
    this.nestedThrowable = nestedThrowable;
  }

  public NewsNotFoundException(String msg, Throwable nestedThrowable) {
    super(msg);
    this.nestedThrowable = nestedThrowable;
  }

  public void printStackTrace() {
    super.printStackTrace();
    if (nestedThrowable != null) {
      nestedThrowable.printStackTrace();
    }
  }

  public void printStackTrace(PrintStream ps) {
    super.printStackTrace(ps);
    if (nestedThrowable != null) {
      nestedThrowable.printStackTrace(ps);
    }
  }

  public void printStackTrace(PrintWriter pw) {
    super.printStackTrace(pw);
    if (nestedThrowable != null) {
      nestedThrowable.printStackTrace(pw);
    }
  }

}
