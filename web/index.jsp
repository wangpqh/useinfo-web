<%--
  Created by IntelliJ IDEA.
  User: xw12
  Date: 2018/4/16
  Time: 13:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-cn">
<head>
    <meta charset="gb2312">
    <title>操作首页</title>
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
</head>
<body>
<%--<%--%>
<%--Object message = session.getAttribute("sucess");--%>
<%--if(message!=null && !"".equals(message)){--%>

<%--%>--%>
<%--<script type="text/javascript">--%>
<%--alert("<%=message%>");--%>
<%--</script>--%>
<%--<%} %>--%>

<div class="container">
    <div>
        <nav class="navbar navbar-expand-lg bg-info">
            <div class="container-fluid">
                <p class="text-white">可以再修改的导航栏</p>
                <form class="navbar-form navbar-right" action="id.do" method="get">
                    <input class="form-control" type="text" placeholder="按编号查找" name="userid">
                </form>
            </div>
        </nav>
    </div>
    <hr>
    <div>
        <p>你可以进行如下操作：</p>
        <hr>
        <%--<div class="row justify-content-between">--%>
        <%--<div class="row ">--%>
        <div class="col-2 ">
            <form action="index.do" method="get">
                1 <input type="submit" value="显示所有信息">
            </form>
        </div>
        <hr>
        <div class="col-6 ">
            <form action="id.do" method="get">
                2 按编号查询<br>
                <%--<label>输入编号</label>--%>
                <input type="text" placeholder="输入编号" name="userid">
                <%--<%=request.getParameter("userid")%>--%>
                <input type="submit" value="提交并搜索">
            </form>
        </div>
        <hr>
        <div class="col-6 ">
            <form action="id.do" method="post">
                3 如果你想删除：<br>
                <input type="text" placeholder="输入编号" name="userid">
                <input type="submit" value="删除">
            </form>
        </div>
        <hr>
        <div class="col-6 ">
            <form action="index.do" method="post">
                4 如果你想增添：<br>
                <input type="text" placeholder="输入编号" name="userid">
                <input type="text" placeholder="输入名字" name="username">
                <input type="text" placeholder="输入密码" name="password">
                <input type="text" placeholder="输入邮箱" name="mailbox">
                <input type="submit" value="增添">
            </form>
        </div>
        <%--</div>--%>
    </div>
</div>

</body>
<html>

