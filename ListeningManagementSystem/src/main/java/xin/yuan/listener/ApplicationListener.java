package xin.yuan.listener;




import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

/**
 * @authorknightx
 * @create2019/3/11
 * @since 1.0.0
 */
public class ApplicationListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {

        Map<Object, HttpSession> userMap = new HashMap<Object, HttpSession>();
        sce.getServletContext().setAttribute("userMap",userMap);
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {

    }
}
