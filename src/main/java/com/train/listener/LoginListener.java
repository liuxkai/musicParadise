package com.train.listener;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;

import com.train.entity.User;

/**
 * 	实现单一登录
 * @author junki
 * @date 2019年10月15日
 */
@WebListener
public class LoginListener implements HttpSessionAttributeListener {

	private static Map<String, HttpSession> sessionMap = new HashMap<>();
	
    public void attributeAdded(HttpSessionBindingEvent se)  { 
    	if ("onlineUser".equals(se.getName())) {
			User onlineUser = (User)se.getValue();
			// 如果已经有登录记录，销毁上一次登录的session
			if (sessionMap.containsKey(onlineUser.getUserName())) {
				if (!sessionMap.get(onlineUser.getUserName()).getId().equals(se.getSession().getId())) {
					sessionMap.get(onlineUser.getUserName()).invalidate();
				}
			}
			// 将本次登录的session存放到map中
			sessionMap.put(onlineUser.getUserName(), se.getSession());
		}
    }

    public void attributeRemoved(HttpSessionBindingEvent se)  { 
    	if ("onlineUser".equals(se.getName())) {
			User onlineUser = (User)se.getValue();
			sessionMap.remove(onlineUser.getUserName());
		}
    }

    public void attributeReplaced(HttpSessionBindingEvent se)  { 
         
    }
	
}
