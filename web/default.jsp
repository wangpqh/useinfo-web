<%--
  Created by IntelliJ IDEA.
  User: xw12
  Date: 2018/5/3
  Time: 14:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登陆失败</title>
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
<div class="container" style="margin-top: 100px">
    <div class="row ">
        <div class="col-md-4 column">
        </div>
        <div class="col-md-4 column">
            <div class="card text-center " style="width: 18rem">
                <div class="alert alert-danger" role="alert">
                    没有这个用户结果，请先注册<br>
                    There is no result!<br>Please register first!<br>
                    <%
                        response.setHeader("refresh", "6;URL=login.jsp");
                    %>
                    6秒后自动返回登陆页面

                </div>

            </div>

        </div>
        <div class="col-md-4 column">
        </div>
    </div>
</div>

</body>
</html>
<%--<% Calendar calendar = new GregorianCalendar();--%>
<%--//                        GregorianCalendar 是 Calendar 的一个具体子类，提供了世界上大多数国家/地区使用的标准日历系统。--%>
<%--String am_pm;--%>
<%--int hour = calendar.get(Calendar.HOUR);--%>
<%--int minute = calendar.get(Calendar.MINUTE);--%>
<%--int second = calendar.get(Calendar.SECOND);--%>
<%--if(calendar.get(Calendar.AM_PM) == 0)--%>
<%--am_pm = "AM";--%>
<%--else--%>
<%--am_pm = "PM";--%>

<%--String CT = hour+":"+ minute +":"+ second +" "+ am_pm;--%>
<%--%>--%>
<%--<p>当前时间是：<%=CT%> "</p>--%>