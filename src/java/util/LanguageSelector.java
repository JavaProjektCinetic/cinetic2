/*
 * Author:      Laura Rössl
 * Date:        16.05.2015
 * Projectname: Cinetic
 */
package util;

import java.util.Arrays;
import java.util.List;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class LanguageSelector {

    public static List<String> langs = Arrays.asList(new String[]{"de", "en"});

    public static String selectLang(HttpServletRequest request, HttpServletResponse response) {

        //Parameter --> beim ändern der sprache
        String lang = (String)request.getParameter("lang");
        System.out.println("### LanguageSelector selectLang lang:"+lang);
        if (lang != null && langs.contains(lang)) {
            Cookie c = new Cookie("lang", lang);
            c.setMaxAge(25000000);
            response.addCookie(c);
            request.getSession().setAttribute("lang", lang);
            return lang;
        }

        //Session --> bei Seite aktualisieren
        lang = (String) request.getSession().getAttribute("lang");
        if (lang != null && lang.contains(lang)) {
            return lang;
        }

        //Cookie --> bei Programmstart
        Cookie[] ck = request.getCookies();
        if (ck != null) {
//            for (int i = 0; i < ck.length; i++) 
//            {
//                System.out.println(">>>>>>>>>>request.getCookies: " + ck[i]);
//            }
            Cookie langCookie = ck[0];

            for (Cookie c : ck) {
                if ("lang".equals(c.getName())) {
                    lang = c.getValue();
                    if (lang != null && langs.contains(lang)) {
                        return lang;
                    }
                    break;
                }
            }
        }

        //Default
        return "en";
    }
    
    
    
    
    
}
