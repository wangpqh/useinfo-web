package userdba;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "IdServlet")
public class IdServlet extends HttpServlet {
    UserDaoImpl m = new UserDaoImpl();
    SearchAllServlet search = new SearchAllServlet();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("userid"));
        m.deleteInfo(id);
        search.doGet(request, response);
        response.sendRedirect("show.jsp");
        m.closeConn();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        m.createConn();
        int id = Integer.parseInt(request.getParameter("userid"));

        m.searchInfo(id);

        request.getSession().setAttribute("userid", m.searchInfo(id).getId());
        request.getSession().setAttribute("username", m.searchInfo(id).getName());
        request.getSession().setAttribute("password", m.searchInfo(id).getPassword());
        request.getSession().setAttribute("mailbox", m.searchInfo(id).getMail());

        response.sendRedirect("showone.jsp");

//        m.closeConn();
    }
}
