package electric.electricUtils;
import java.sql.*;
import java.util.*;

public class DbSequenceManager {

  private static final String LOAD_ID =
      "SELECT SEQUENCEID FROM SEQUENCETABLE WHERE TABLENAME=?";
  private static final String UPDATE_ID =
      "UPDATE SEQUENCETABLE SET SEQUENCEID=? WHERE TABLENAME=? AND SEQUENCEID=?";

  private static final String INSERT_ID =
      "INSERT INTO SEQUENCETABLE (SEQUENCEID,TABLENAME) VALUES(?,?)";

  private static final int INCREMENT = 1;


  private static DbSequenceManager[] managers;

  static {
    managers = new DbSequenceManager[FinalConstants.TABLENUM];
    for (int i = 0; i < managers.length; i++) {
      managers[i] = new DbSequenceManager(i);
    }
  }

  public static int nextID(int type) {
    return managers[type].nextUniqueID();
  }

  private int type;
  private int currentID;

  public DbSequenceManager(int type) {
    this.type = type;
    currentID = 0;
  }

  public synchronized int nextUniqueID() {

    getNextBlock();
    int id=currentID+INCREMENT;
    return id;
  }
 private void getNextBlock() {
    boolean success = false;
    Connection con = null;
    PreparedStatement pstmt = null;
    try {
      con = DbConnectionManager.getConnection();
      pstmt = con.prepareStatement(LOAD_ID);
      pstmt.setInt(1, type);
      ResultSet rs = pstmt.executeQuery();
      if (!rs.next()) {
        pstmt = con.prepareStatement(INSERT_ID);
        pstmt.setInt(1, currentID);
        pstmt.setInt(2, type);
        pstmt.executeUpdate();
      }
      else {
        currentID = rs.getInt(1);
      }
      pstmt.close();
      int newID = currentID + INCREMENT;
      pstmt = con.prepareStatement(UPDATE_ID);
      pstmt.setInt(1, newID);
      pstmt.setInt(2, type);
      pstmt.setInt(3, currentID);
      success = pstmt.executeUpdate() == 1;
      if (success) {
        this.currentID = currentID;
      }
    }
    catch (Exception sqle) {
      sqle.printStackTrace();
    }
    finally {
      try {
        pstmt.close();
      }
      catch (Exception e) {
        e.printStackTrace();
      }
      try {
        con.close();
      }
      catch (Exception e) {
        e.printStackTrace();
      }
    }
    if (!success) {
      System.err.println("WARNING: failed to obtain next ID block due to " +
                         "thread contention. Trying again...");
       getNextBlock();
    }
  }
}
