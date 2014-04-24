package com.core;

public final class FinalConstants {

    public static int STATUS_USER = 0; //普通用户
    public static int STATUS_ADMIN = 1; //管理员

    public static int STATE_FREE = 0; //人员正常
    public static int STATE_FREEZE = 1; //人员冻结

    public static int STATE_NOREGULAR = 0; //试用版
    public static int STATE_REGULAR = 1; //正式版

    public static int STATE_HEAD = 0; //头像
    public static int STATE_SOFT = 1; //软件
    public static int STATE_RESOLVENT = 2; //解决方案

    public static int STATE_TOOL = 0; //工具
    public static int STATE_MEND = 1; //补丁


    //parameter
    public static int STEP = 8; //翻页步长

    //user
    public static final String INSERT_USER = "INSERT INTO user (uid,password,name,regqu,reganswer,iid,sex,age,tel,email,qq,regtime,address,http,status,state,resume) VALUES(?,?,?,?,?,?,?,?,?,?,?,now(),?,?,?,?,?)";
    public static final String UPDATE_USER = "UPDATE (user) SET password=?,name=?,iid=?,sex=?,age=?,tel=?,email=?,qq=?,address=?,http=?,status=?,state=?,resume=? where uid=?";
    public static final String UPDATE_USER_M = "UPDATE (user) SET status=?,state=? where uid=?";
    public static final String SELECT_USER = "SELECT * FROM (user) ";

    //head
    public static final String INSERT_HEAD =
        "INSERT INTO ico (iid,path,atime,state) VALUES(?,?,now(),?)";
    public static final String SELECT_HEAD = "SELECT * FROM (ico) ";
    public static final String DELETE_HEAD = "DELETE FROM ico ";

    //affiche
    public static final String INSERT_AFFICHE =
        "INSERT INTO affiche (uid,title,atime,content) VALUES(?,?,now(),?)";
    public static final String UPDATE_AFFICHE =
        "UPDATE (affiche) SET title=?,content=? where aid=?";
    public static final String SELECT_AFFICHE = "SELECT * FROM (affiche) ";
    public static final String DELETE_AFFICHE = "DELETE FROM affiche ";

    //new
    public static final String INSERT_NEW =
        "INSERT INTO new (uid,title,ntime,fromto,content) VALUES(?,?,now(),?,?)";
    public static final String SELECT_NEW = "SELECT * FROM (new) ";
    public static final String DELETE_NEW = "DELETE FROM new ";

    //link
    public static final String INSERT_LINK =
        "INSERT INTO link (name,ltime,url) VALUES(?,now(),?)";
    public static final String UPDATE_LINK = "UPDATE (link) SET name=?,url=? where lid=?";
    public static final String SELECT_LINK = "SELECT * FROM (link) ";
    public static final String DELETE_LINK = "DELETE FROM link ";

    //ssort
    public static final String INSERT_SSORT =
        "INSERT INTO ssort (name,resume) VALUES(?,?)";
    public static final String UPDATE_SSORT =
        "UPDATE (ssort) SET name=?,resume=? where sid=?";
    public static final String SELECT_SSORT = "SELECT * FROM (ssort) ";
    public static final String DELETE_SSORT = "DELETE FROM ssort ";

    //soft
    public static final String INSERT_SOFT = "INSERT INTO soft (name,edition,price,uptime,uid,iid,sid,environment,filesize,commend,loadnum,regular,introduce,path,resume) VALUES(?,?,?,now(),?,?,?,?,?,?,?,?,?,?,?)";
    public static final String UPDATE_SOFT = "UPDATE (soft) SET name=?,edition=?,price=?,iid=?,sid=?,environment=?,filesize=?,commend=?,loadnum=?,regular=?,introduce=?,path=?,resume=? where sfid=?";
    public static final String UPDATE_SOFT_LOAD = "UPDATE (soft) SET loadnum=? where sfid=?";
    public static final String SELECT_SOFT = "SELECT * FROM (soft) ";
    public static final String DELETE_SOFT = "DELETE FROM soft ";

    //resolvent
    public static final String INSERT_RESOLVENT =
        "INSERT INTO resolvent (sid,uid,sfid,name,uptime,iid,content) VALUES(?,?,?,?,now(),?,?)";
    public static final String UPDATE_RESOLVENT =
        "UPDATE (resolvent) SET sid=?,sfid=?,name=?,content=? where rid=?";
    public static final String SELECT_RESOLVENT = "SELECT * FROM (resolvent) ";
    public static final String DELETE_RESOLVENT = "DELETE FROM resolvent ";

    //question
    public static final String INSERT_QUESTION =
        "INSERT INTO question (question,answer) VALUES(?,?)";
    public static final String UPDATE_QUESTION =
        "UPDATE (question) SET answer=?,question=? where qid=?";
    public static final String SELECT_QUESTION = "SELECT * FROM (question) ";
    public static final String DELETE_QUESTION = "DELETE FROM question ";

    //guestboard
    public static final String INSERT_GUESTBOARD =
        "INSERT INTO guestboard (title,guest,gtime,content) VALUES(?,?,now(),?)";
    public static final String UPDATE_GUESTBOARD =
        "UPDATE (guestboard) SET gflag=1,recontent=?,rtime=now() where gid=?";
    public static final String SELECT_GUESTBOARD = "SELECT * FROM (guestboard) ";
    public static final String DELETE_GUESTBOARD = "DELETE FROM guestboard ";

    //mend
    public static final String INSERT_MEND = "INSERT INTO mend (sid,name,path,state,uptime,commend,loadnum,filesize,resume) VALUES(?,?,?,?,now(),?,?,?,?)";
    public static final String UPDATE_MEND = "UPDATE (mend) SET sid=?,name=?,state=?,commend=?,loadnum=?,filesize=?,resume=? where mid=?";
    public static final String UPDATE_MEND_LOAD = "UPDATE (mend) SET loadnum=? where mid=?";
    public static final String SELECT_MEND = "SELECT * FROM (mend) ";
    public static final String DELETE_MEND = "DELETE FROM mend ";
}
