package userdba;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class UserDaoImpl implements UserDao {
    static Connection conn = null;
    static Statement stmt = null;
    static ResultSet re = null;
    PreparedStatement pre = null;

    @Override
    public void createConn() {
        //连接数据库
        String JDBC_DRIVER = "com.mysql.jdbc.Driver";
        String url = "jdbc:mysql://172.16.0.191:3306/test";//此ip地址为数据库服务器ip非本机ip
        String username = "root";
        String password = "xianwei";
        try {
            Class.forName(JDBC_DRIVER);//加载驱动

            System.out.println("驱动加载成功");
            conn = DriverManager.getConnection(url, username, password);
            stmt = conn.createStatement();

            System.out.println("连接成功");

        } catch (ClassNotFoundException e) {
            System.out.println("无法找到连接！");
            e.printStackTrace();
        } catch (SQLException e) {
            System.out.println("无法找到连接！");
            e.printStackTrace();
        }
    }

    @Override
    public void closeConn() {
        try {
            if (conn != null)
                conn.close();
            if (stmt != null)
                stmt.close();
            if (re != null)
                re.close();
            if (pre != null)
                pre.close();
            System.out.println("关闭成功");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Users> queryAll() {
        List<Users> arr = new ArrayList<Users>();

        try {
            String sql = "select * from userInfo ";
            //查询输出所有学生信息
            stmt = conn.createStatement();
            re = stmt.executeQuery(sql);
            while (re.next()) {
                Users user0 = new Users();
                user0.setId(re.getInt("Id"));
                user0.setName(re.getString("userName"));
                user0.setPassword(re.getString("password"));
                user0.setMail(re.getString("mailBox"));

                arr.add(user0);
            }
            return arr;

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public int searchIdNum() {
        // 查询所有信息条数
        int a = 0;
        try {
            String sql = "select Id from userInfo ";
            //查询输出学生信息
            stmt = conn.createStatement();
            re = stmt.executeQuery(sql);
            while (re.next()) {
                a++;
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return a;
    }

    @Override
    public Users searchInfo(int userId) {
        try {

            String sql1 = "select Id,userName,password,mailBox from userInfo where Id=" + userId + "";
            //查询输出学生信息
            stmt = conn.createStatement();
            re = stmt.executeQuery(sql1);
            if (re.next()) {//如果有数据，rs.next()返回true
                //System.out.println(Id);
                String name = re.getString("userName");
                String password = re.getString("password");
                String mailbox = re.getString("mailBox");

                Users user1 = new Users();
                user1.setId(userId);
                user1.setName(name);
                user1.setPassword(password);
                user1.setMail(mailbox);
                //System.out.println(user1.toString());
                return user1;//返回实体类user的对象user1的获得的值，相当于上一行
                //没有重写toString方法只会返回它的地址xianwei.second.Users@5ce65a89
            } else {
                System.out.println("你输入的用户id不存在");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    @Override
    public boolean searchInfo(String uname, String psw) {
        List<Users> arr = new ArrayList<Users>();
        try {

            String sql1X = "select userName,password from userInfo where userName='" + uname + "'and password='" + psw + "' ";
//            String sql1X = "select * from userInfo where userName='+uname+ 'and password='+psw+' ";
            //查询输出学生信息
            stmt = conn.createStatement();
            re = stmt.executeQuery(sql1X);
            while (re.next()) {//如果有数据，rs.next()返回true
                String name = re.getString("userName");
                String pass = re.getString("password");

//                Users user1 = new Users();
//
//                user1.setName(name);
//                user1.setPassword(pass);
//                arr.add(user1);
//                System.out.println(arr);

//            while((re.getString("userName")==uname)&&(re.getString("password")==psw)){
                return true;
            }
//            else
//                    return false;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;

    }

    @Override
    public int insertInfo(int userId, String userName, String password, String mail) {
        try {
            //增加信息
            String sql2 = "insert into userInfo(Id,userName,password,mailBox)" + " values (?,?,?,?)";
            pre = conn.prepareStatement(sql2);
            pre.setInt(1, userId);
            pre.setString(2, userName);
            pre.setString(3, password);
            pre.setString(4, mail);
            pre.executeUpdate();
            //如果信息不存在Id！=查询的值
            if (userId != re.findColumn("Id")) {

                Users user2 = new Users();
                user2.setId(userId);
                user2.setName(userName);
                user2.setPassword(password);
                user2.setMail(mail);
                System.out.println(user2.toString());
                return user2.getId();
            }
            //如果信息存在Id==查看到的值
            else {
                System.out.println("你所添加的信息号已存在");
                return 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    public boolean insertInfo(String uname, String psw) {//按姓名和密码查询
        try {
            //增加信息
            String sql2X = "insert into userInfo(userName,password)" + " values (?,?)";
            pre = conn.prepareStatement(sql2X);
            pre.setString(1, uname);
            pre.setString(2, psw);

            pre.executeUpdate();
            return true;


        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean deleteInfo(int userId) {
        try {
            //删除信息
            String sql3 = "delete from userInfo where Id=?";
            pre = conn.prepareStatement(sql3);
            pre.setInt(1, userId);
            pre.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    /**
     * @param userId
     * @param userName
     * @param password
     * @return
     */
    @Override
    public boolean updateInfo(int userId, String userName, String password, String mail) {
        try {
            //修改更新信息
            String sql3 = "update userInfo set userName=?, password=? ,mailBox=? where Id=?";
            pre = conn.prepareStatement(sql3);
            pre.setString(1, userName);
            pre.setString(2, password);
            pre.setString(3, mail);
            pre.setInt(4, userId);
            pre.executeUpdate();
            Users user = new Users();
            user.setId(userId);
            user.setName(userName);
            user.setPassword(password);
            user.setMail(mail);
            System.out.println(user.toString());
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
