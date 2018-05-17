package userdba;

import java.util.List;

public interface UserDao {

    void createConn();//创建连接

    void closeConn();//关闭连接

    int searchIdNum();//查询信息数量

    List<Users> queryAll();//查询所有信息

    Users searchInfo(int userId);//按编号查询

    boolean searchInfo(String uname, String psw);//按用户名和密码查询

    int insertInfo(int userId, String userName, String password, String mail);//增添

    boolean insertInfo(String uname, String psw);//增添


    boolean deleteInfo(int userId);//按编号删除

    boolean updateInfo(int userId, String userName, String password, String mail);//修改更新


}

