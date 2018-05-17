package userdba;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


public class SearchAllServlet extends HttpServlet {
    UserDaoImpl m = new UserDaoImpl();
    final int pagesize = 3;//一页的记录数

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //连接数据库
        m.createConn();
//如何忽略删除信息执行查询？
        List<Users> userList = m.queryAll();
        int page = 0;//页数
        int num = m.searchIdNum();
//        int pagenow = Integer.parseInt(req.getParameter("pagenow"));//当前页

        if (num % pagesize > 0) {
            //计算分页数，传至到jsp页面再判断
            page = num / pagesize + 1;
        } else if (num % pagesize == 0) {
            page = num / pagesize;
        } else {
            page = 1;
        }

        req.getSession().setAttribute("paper", page);
        req.getSession().setAttribute("userlist", userList);
        req.getRequestDispatcher("show.jsp").forward(req, resp);

//        m.closeConn();

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        m.createConn();
        int id = Integer.parseInt(req.getParameter("userid"));
        String name = req.getParameter("username");
        String pass = req.getParameter("password");
        String mail = req.getParameter("mailbox");
        m.insertInfo(id, name, pass, mail);//增添然后去查询
        System.out.println("chenggong");
        doGet(req, resp);


    }

}
