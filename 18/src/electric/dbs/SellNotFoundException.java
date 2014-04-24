package electric.dbs;

import java.io.*;

public class SellNotFoundException
    extends Exception {

  private Throwable nestedThrowable = null;

  public SellNotFoundException() {
    super();
  }

  public SellNotFoundException(String msg) {
    super(msg);
  }

  public SellNotFoundException(Throwable nestedThrowable) {
    this.nestedThrowable = nestedThrowable;
  }

  public SellNotFoundException(String msg, Throwable nestedThrowable) {
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
