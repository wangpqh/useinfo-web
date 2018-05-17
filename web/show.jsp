<%--
  Created by IntelliJ IDEA.
  User: xw12
  Date: 2018/4/17
  Time: 9:14
  To change this template use File | Settings | File Templates.
--%>

<%@ page import="userdba.Users" %>
<%@ page import="java.util.List" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-cn">
<head>
    <meta charset="gb2312">
    <title>信息展示</title>
    <!--引入bootstrap-->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"
          integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4"
          crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"
            integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm"
            crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
            integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"
            integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ"
            crossorigin="anonymous"></script>
    <!--<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">-->
    <!--<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>-->
    <!--<script src="https://cdn.bootcss.com/popper.js/1.12.5/umd/popper.min.js"></script>-->
    <!--<script src="https://cdn.bootcss.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>-->
    <style>
        #footer {
            text-align: center;
            /*bottom: auto;*/
            margin-top: auto;
            margin-bottom: auto;
        }

    </style>
    <%--<script type="text/javascript">--%>
    <%--var table=document.getElementById("tb")--%>
    <%--//    通过id 查找 HTML 元素--%>
    <%--var num=table.rows.length;--%>
    <%--</script>--%>

</head>
<body>
<div class="container">
    <div>
        <nav class="navbar navbar-expand-lg bg-info">
            <div class="container-fluid">
                <p class="text-white">可以再修改的导航栏</p>
                <form class="navbar-form navbar-right" action="id.do" method="get">
                    <input class="form-control" type="text" placeholder="按编号查找" name="userid">
                </form>
            </div>
            <!--<input class="form-control" type="text" placeholder="Search" aria-label="Search">-->
        </nav>
    </div>
    <hr>
    <div class="container">
        <div class="row">
            <div class="col-md-6 "></div>
            <div class="col-md-6 col-md-offset-6">
                <form action="id.do" method="get">
                    <label>编号</label>
                    <input type="text" placeholder="userid" name="userid">
                    <label>用户名</label>
                    <input type="text" placeholder="username" name="username">
                    <input type="submit" value="搜索">
                </form>
            </div>
        </div>
        <hr/>

        <div>
            <caption><p class="text-center">用户信息</p></caption>
            <%
                List<Users> userList = (List<Users>) session.getAttribute("userlist");
                int paper = (int) session.getAttribute("paper");//获取到页数
//                int pagenow = (int) session.getAttribute("pagenow");//获取到页数
                Users user;

//                int pagesize = userList.size() / paper;//总数除页数就是每页记录数
                int pagesize = 3;//总数除页数就是每页记录数
                int pagenow = 1;//当前页
                int pagenowCopy = 0;
                int i = 0;
                if (userList.size() % pagesize > 0) {
                    paper = userList.size() / pagesize + 1;
                } else if (userList.size() % pagesize == 0) {
                    paper = userList.size() / pagesize;
                } else {
                    paper = 1;
                }
                String str_pagenow = request.getParameter("pagenow");//获取到pagenow

                if (str_pagenow != null) {
                    pagenow = Integer.parseInt(str_pagenow);
                    pagenowCopy = pagenow;

                }

            %>
            <table class="table" id="page">

                <thead class="thead-light">
                <tr class="text-center">
                    <th scope="col">编号</th>
                    <th>用户名</th>
                    <th>密码</th>
                    <th>邮箱</th>
                </tr>
                </thead>
                <tbody>

                <%--第一页--%>
                <%
                    if (pagesize * pagenow > userList.size()) {
                        for (i = pagesize * (pagenow - 1); i < userList.size(); i++) {
                            user = (Users) userList.get(i); %>
                <tr class="text-center">
                    <td><%= user.getId()%>
                    </td>
                    <td><%=user.getName()%>
                    </td>
                    <td><%= user.getPassword()%>
                    </td>
                    <td><%= user.getMail()%>
                    </td>
                </tr>
                <%
                    }
                } else {
                    for (i = pagesize * (pagenow - 1); i <= pagesize * pagenow - 1; i++) {
                        user = (Users) userList.get(i); %>
                <tr class="text-center">
                    <td id="userid"><%= user.getId()%>
                    </td>
                    <td id="username"><%=user.getName()%>
                    </td>
                    <td id="password"><%= user.getPassword()%>
                    </td>
                    <td id="mailbox"><%= user.getMail()%>
                    </td>
                </tr>
                <%
                        }
                    }

                %>

                </tbody>
            </table>
        </div>
        <hr/>

        <div><!--分页-->

            <ul class="pagination justify-content-end pagination-sm">
                <li>总共有<%=userList.size()%>条信息，总有<%=paper%>页&nbsp;</li>

                <%--<form action="getpage" method="get">--%>
                <% if (pagenow == 1) {%>
                <li class="page-item disabled"><a class="page-link" href="#" tabindex="-1">首页</a></li>
                <li class="page-item disabled"><a class="page-link" href="#" tabindex="-1"> &laquo;上一页</a></li>
                <%}%>
                <% if (pagenow != 1) {%>
                <li class="page-item "><a class="page-link" href="show.jsp?pagenow=1" tabindex="-1">首页</a></li>
                <li class="page-item "><a class="page-link" href="show.jsp?pagenow=<%=pagenowCopy-1%>" tabindex="-1">
                    &laquo;上一页</a></li>
                <%}%>
                <%--<li class="page-item "><a class="page-link" href="PageServlet?pagenow=<%=pagenow-1%> " tabindex="-1"> &laquo;上一页</a></li><%}%>--%>
                <%--<li class="page-item "><a class="page-link" href="PageServlet?pagenow=previous" tabindex="-1"> &laquo;上一页</a></li><%}%>--%>
                <!--获取到页面数量遍历出来-->
                <%
                    for (pagenow = 1; pagenow <= paper; pagenow++) {
                %>
                <li class="page-item "><a class="page-link" href="show.jsp?pagenow=<%=pagenow%> "><%=pagenow%>
                </a></li>
                <%
                    }
                %>
                <%--<li class="page-item"><a class="page-link" href="PageServlet?pagenow=<%=pagenow+1%>">下一页&raquo;</a></li>--%>
                <%--<li class="page-item"><a class="page-link" href="PageServlet?pagenow=next">下一页&raquo;</a></li>--%>
                <%--如果pagenow==2--%>
                <li class="page-item"><a class="page-link" href="show.jsp?pagenow=<%=pagenowCopy+1%>">下一页&raquo;</a>
                </li>
                <li class="page-item"><a class="page-link" href="show.jsp?pagenow=<%=paper%>">尾页</a></li>
                <%--<%--%>
                <%--} %>--%>
                <%--<li class="page-item disabled"><a class="page-link" href="#">下一页&raquo;</a></li>--%>
                <%--</form>--%>
            </ul>
        </div>
        <br>
        <div class="col-6 ">
            <form action="id.do" method="post">
                1 在这里你可以进行删除：<br>
                <input type="text" placeholder="输入编号" name="userid">
                <input type="submit" value="删除">
            </form>
        </div>
        <br>
        <div class="col-6 ">
            <form action="index.do" method="post">
                2 如果你想增添：<br>
                <input type="text" placeholder="输入编号" name="userid">
                <input type="text" placeholder="输入名字" name="username">
                <input type="text" placeholder="输入密码" name="password">
                <input type="text" placeholder="输入邮箱" name="mailbox">
                <input type="submit" value="增添">
            </form>
        </div>
    </div>

    <div id="footer" style="background-color:#05aece">
        <hr/>
        <%--<div class="card-footer">footer是什么</div>--%>
        <p style="color: white">Disigned by:&nbsp;wtt.<br/><em>Still can further improve</em></p>
    </div>

</div>


</body>
<html>

<%--获取到点击的页面值
1、上一页previous
    (1)pagenow==1,上一页不工作(disable)
    if(pagenow==1)
    (2)pagenow>1,上一页工作(去掉disable)，pagenow-1
    if(pagenow>1)

2、下一页next   if((pagenow>1)&&(pagenow<paper))
    (1)pagenow==paper下一页不工作(disable_
    (2)pagenow<paper,下一页工作(去掉disable)，pagenow+1
        if (pagenow < paper)
3、任意页anypage
    pagenow==anypage
--%>
<%--获取到页面值后操作方式
1、进行跳转  新page.jsp??
2、表格改变？ changetable

第1页id：1-pagesize                       i:  0-pagesize-1
第2页id： pagesize+1-pagesize*2           i:  pagesize-pagesize*2-1
第3页id：pagesize*2+1-pagesize*3          i:  pagesize*2-pagesize*3-1
。。。
第n页id：pagesize*(n-1)+1-pagesize*n      i:  pagesize*(n-1)-pagesize*n-1

                                        for(i=pagesize*(pagenow-1);i<= pagesize*pagenow-1;i++)
--%>