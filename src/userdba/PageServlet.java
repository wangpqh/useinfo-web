//package userdba;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import java.io.IOException;
//
//@WebServlet(name = "PageServlet")
//public class PageServlet extends HttpServlet {
//    int pageNow = 1;
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//    super.doGet(request,response);
//    }
//
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//
//
//// 这个参数是下文中<a>链接中的href传递过来的，形如：/UserManager/ManageUsers?pageNow=xx
//        String temp_pageNow = request.getParameter("pagenow");
//        if (temp_pageNow != null) {
//           pageNow = Integer.parseInt(temp_pageNow)-1;
//            request.setAttribute("pagenow", pageNow);
//           pageNow = Integer.parseInt(temp_pageNow)+1;
//        }
////
//        request.getRequestDispatcher("show.jsp").forward(request, response);
//
//    }
//}
