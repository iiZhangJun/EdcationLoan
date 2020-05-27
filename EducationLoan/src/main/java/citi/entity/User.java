package citi.entity;
import java.util.UUID;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

@ApiModel(value = "用户实体类")
public class User {

    @ApiModelProperty(value = "用户唯一标识")
    private String userID;

    @ApiModelProperty(value = "用户名")
    private String username;

    @ApiModelProperty(value = "电话")
    private String phoneNum;

    @ApiModelProperty(value = "用户密码")
    private String password;

    @ApiModelProperty(value = "用户密码")
    private String citiCardID;

    @ApiModelProperty(value = "用户平台积分")
    private int availablePoints;

    public User(String username, String password, String phoneNum){
        this.userID = UUID.randomUUID().toString().toLowerCase();
        this.username = username;
        this.password = password;
        this.phoneNum = phoneNum;
        this.citiCardID = "";
    }

    public User() {
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

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getPhoneNum() {
        return phoneNum;
    }

    public void setPhoneNum(String phoneNum) {
        this.phoneNum = phoneNum;
    }

    public int getAvailablePoints() {
        return availablePoints;
    }

    public void setAvailablePoints(int availablePoints) {
        this.availablePoints = availablePoints;
    }


    public String getCitiCardID() {
        return citiCardID;
    }

    public void setCitiCardID(String citiCardID) {
        this.citiCardID = citiCardID;
    }
}
