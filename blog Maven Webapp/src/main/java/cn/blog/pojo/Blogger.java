package cn.blog.pojo;

import java.io.Serializable;

public class Blogger implements Serializable{
    
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
    //主键
	private Integer id;
    //用户名
    private String username;
    //密码
    private String password;
    //昵称
    private String nickname;
    //签名
    private String sign;
    //头像
    private String imagName;
    //盐
    private String salt;
    //个人信息
    private String personalInformation;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getSign() {
        return sign;
    }

    public void setSign(String sign) {
        this.sign = sign;
    }

    public String getImagName() {
        return imagName;
    }

    public void setImagName(String imagName) {
        this.imagName = imagName;
    }

    public String getSalt() {
        return salt;
    }

    public void setSalt(String salt) {
        this.salt = salt;
    }

    public String getPersonalInformation() {
        return personalInformation;
    }

    public void setPersonalInformation(String personalInformation) {
        this.personalInformation = personalInformation;
    }
}