package Dao.cookie;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by online on 15-7-26.
 */
public class Coolie {
    //加入cookie
    public void addCookie(HttpServletResponse resp,String key,String value) throws UnsupportedEncodingException {
//因为tomcat7以上对中文cookie的限制，所以要编码
        Cookie cookie = new Cookie(key, URLEncoder.encode(value, "utf-8"));
        cookie.setPath("/");
        cookie.setMaxAge(30*24*3600);
        resp.addCookie(cookie);
    }
    //删除cookie
    public void deleteCookie(HttpServletResponse resp,String key){
        Cookie cookie =new Cookie(key,null);
        cookie.setPath("/");
        cookie.setMaxAge(0);
        resp.addCookie(cookie);
    }
    //查找cookie
    public static String selectCookie(HttpServletRequest request, String key) throws UnsupportedEncodingException {
        Map<String, Cookie> mapcookie = readCookie(request);
        if (mapcookie.containsKey(key)){
            Cookie cookie=mapcookie.get(key);
            //这里是解码
            String str = URLDecoder.decode(cookie.getValue(), "utf-8");
            return str;
        }else return null;
    }
    //读取cookie
    public static Map<String, Cookie> readCookie(HttpServletRequest request) throws UnsupportedEncodingException {
        Cookie[] cookies = request.getCookies();
        Map<String, Cookie> mapcookie=new HashMap<String, Cookie>();
        if (cookies!=null){
            for (Cookie cookie:cookies){
                mapcookie.put(cookie.getName(),cookie);
            }
        }
        return mapcookie;
    }
}
