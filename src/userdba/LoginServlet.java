package userdba;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
//import javax.servlet.http.HttpSession;

@WebServlet(name = "LoginServlet")
public class LoginServlet extends HttpServlet {
    UserDaoImpl udi = new UserDaoImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        super.doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //连接数据库
        udi.createConn();
        String name = request.getParameter("username");
        String pass = request.getParameter("password");
        //  信息查询
        //  如果查询到信息，不用注册，跳出提示，请直接登陆(?) 并跳转到index.jsp
        if (udi.searchInfo(name, pass)) {
            System.out.println("yes");
            response.sendRedirect(request.getContextPath() + "/index.jsp");

        }
        // 如果信息不存在，跳出提示框，用户信息不存在，请注册。
        else {
            // 注册部分，将获取的信息插入数据库
//            request.setCharacterEncoding("UTF-8");
//            response.setContentType("text/html;charset=UTF-8");
//            PrintWriter out = response.getWriter();
//            out.println("<!DOCTYPE html>");
//            out.println("<html lang=\"zh-cn\">");
//            out.println("<head>");
//            out.println("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">");
//            out.println("</head>");
//            out.println("<body>");
//            out.println("没有这个用户结果，请先注册\n");
//            out.println("There is no result!Please register first!");
//            out.println("</body>");
//            out.println("</html>");
            // 注册完成直接登陆
//            response.setHeader("refresh", "3;URL=login.jsp");
//            if(udi.insertInfo(name,pass)){
//                System.out.println("没有数据已经添加");
            //跳转到index.jsp
            response.sendRedirect("default.jsp");
//            }
        }
        udi.closeConn();
    }
}
