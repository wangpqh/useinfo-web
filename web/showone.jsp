<%--
  Created by IntelliJ IDEA.
  User: xw12
  Date: 2018/4/19
  Time: 16:19
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-cn">
<head>
    <meta charset="gb2312">
    <title>一条信息</title>
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
    <style>
        #footer {
            text-align: center;
            /*bottom: auto;*/
            margin-top: auto;
            margin-bottom: auto;
        }
    </style>
</head>

<body>
<div class="container">
    <div>
        <nav class="navbar navbar-expand-lg bg-info">
            <div class="container-fluid">
                <p class="text-white">可以再修改的导航栏</p>
                <form class="navbar-form navbar-right" action="index.jsp">
                    <input class="form-control" type="text" placeholder="返回首页">
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
                int id = (int) session.getAttribute("userid");
                String name = (String) session.getAttribute("username");
                String pass = (String) session.getAttribute("password");
                String mail = (String) session.getAttribute("mailbox");

            %>
            <table class="table">
                <thead class="thead-light">
                <tr class="text-center">
                    <th scope="col">编号</th>
                    <th>用户名</th>
                    <th>密码</th>
                    <th>邮箱</th>
                </tr>
                </thead>
                <tbody>
                <tr class="text-center">

                    <td><%= id%>
                    </td>
                    <td><%= name%>
                    </td>
                    <td><%= pass%>
                    </td>
                    <td><%= mail%>
                    </td>
                </tr>

                </tbody>
            </table>
        </div>
        <hr/>

        <div><!--分页-->

            <ul class="pagination justify-content-end pagination-sm">
                <li class="page-item disabled"><a class="page-link" href="#" tabindex="-1"> &laquo;上一页</a></li>
                <li class="page-item"><a class="page-link" href="#pap">1</a></li>
                <li class="page-item"><a class="page-link" href="#">下一页&raquo;</a></li>
            </ul>
        </div>
    </div>
    <form action="id.do" method="post">
        是否删除？<br>
        <input type="text" placeholder="输入上述编号" name="userid">
        <input type="submit" value="删除">
    </form>
    <div id="footer" style="background-color:#05aece">
        <hr/>
        <%--<div class="card-footer">footer是什么</div>--%>
        <p style="color: white">Disigned by:&nbsp;wtt.<br/><em>Still can further improve</em></p>
    </div>

</div>


</body>
<html>


