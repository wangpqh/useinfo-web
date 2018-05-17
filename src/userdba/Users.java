package userdba;

public class Users {
    int id;
    String Name;
    String password;
    String Mail;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return Name;
    }

    public void setName(String name) {
        Name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getMail() {
        return Mail;
    }

    public void setMail(String mail) {
        Mail = mail;
    }

    @Override
    public String toString() {
        return "{" +
                "id=" + id +
                ", Name='" + Name + '\'' +
                ", password='" + password + '\'' +
                ", Mail='" + Mail + '\'' +
                '}';
    }
}

