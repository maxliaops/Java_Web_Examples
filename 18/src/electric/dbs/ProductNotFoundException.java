package electric.dbs;

import java.io.*;

public class ProductNotFoundException
    extends Exception {

  private Throwable nestedThrowable = null;

  public ProductNotFoundException() {
    super();
  }

  public ProductNotFoundException(String msg) {
    super(msg);
  }

  public ProductNotFoundException(Throwable nestedThrowable) {
    this.nestedThrowable = nestedThrowable;
  }

  public ProductNotFoundException(String msg, Throwable nestedThrowable) {
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
