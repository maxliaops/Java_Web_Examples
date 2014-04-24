package com.core;

import javax.servlet.http.HttpSession;

import com.model.User;

/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2008</p>
 * <p>Company: MR</p>
 * @author BWM
 * @version 2.0
 */

public class Crazyadept {
    public Crazyadept() {
    }

    public static boolean UserIsOK(HttpSession session, int status) {
        User u = (User) session.getAttribute("user");
        if (u == null || u.getUid() == null || "".equals(u.getUid()) ||
            u.getStatus() != status || u.getState() == FinalConstants.STATE_FREEZE) {
            return false;
        } else {
            return true;
        }
    }

    public static boolean UserIsOK(HttpSession session) {
        User u = (User) session.getAttribute("user");
        if (u == null || u.getUid() == null || "".equals(u.getUid()) ||
            u.getState() == FinalConstants.STATE_FREEZE) {
            return false;
        } else {
            return true;
        }
    }
  }
