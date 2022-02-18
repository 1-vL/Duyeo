package duyeo;

import javax.servlet.http.Cookie;

//useCookie 코드를 method 화 해서 공용으로 활용
public class Util {
	public static String getCookie(Cookie[] cookies, String name) {
		String result="";
		if(cookies != null) {
			for(int i=0; i<cookies.length; i++) {
				if(cookies[i].getName().equals(name)) {
					result=cookies[i].getValue();
					break;
				}
			}
		}		
		return result;
	}
}
