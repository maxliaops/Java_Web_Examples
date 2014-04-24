package electric.dbs;

import java.io.*;

public class WareNotFoundException
    extends Exception {

  private Throwable nestedThrowable = null;

  public WareNotFoundException() {
    super();
  }

  public WareNotFoundException(String msg) {
    super(msg);
  }

  public WareNotFoundException(Throwable nestedThrowable) {
    this.nestedThrowable = nestedThrowable;
  }

  public WareNotFoundException(String msg, Throwable nestedThrowable) {
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
