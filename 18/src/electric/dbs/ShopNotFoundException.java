package electric.dbs;

import java.io.*;

public class ShopNotFoundException
    extends Exception {

  private Throwable nestedThrowable = null;

  public ShopNotFoundException() {
    super();
  }

  public ShopNotFoundException(String msg) {
    super(msg);
  }

  public ShopNotFoundException(Throwable nestedThrowable) {
    this.nestedThrowable = nestedThrowable;
  }

  public ShopNotFoundException(String msg, Throwable nestedThrowable) {
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
