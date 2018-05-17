<%--
  Created by IntelliJ IDEA.
  User: xw12
  Date: 2018/5/2
  Time: 12:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Welcome</title>
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

<div class="container " style="margin-top: 100px">
    <div class="row ">
        <div class="col-md-4 column">
        </div>
        <div class="col-md-4 column">
            <div class="card text-center " style="width: 18rem">

                <div class="card-header">
                    <nav class="navbar navbar-expand-lg bg-info " style="text-align: center">
                        <div class="container-fluid  ">
                            <p class="text-white">Welcome to this system!<br>请登陆。。。</p>
                        </div>
                    </nav>
                </div>
                <div class="card-body ">
                    <form action="login.do" class="form-control" method="get">
                        <label>用户名 &nbsp;</label><input type="text" name="username"><br>
                        <label>密码 &nbsp;&nbsp;&nbsp;</label><input type="text" name="password"><br>
                        <label>如果你还没有账号，请先进行注册，如果有，直接登陆！</label><br>
                        <input class="btn" type="submit" name="register" value="注册">
                        <input class="btn" type="submit" name="login" value="登陆">
                    </form>
                </div>
            </div>

        </div>
        <div class="col-md-4 column">
        </div>
    </div>
</div>
</body>
</html>