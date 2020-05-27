package citi.dao;

public interface UserMapper {

    final String insertUser = "INSERT INTO user (userID, password, citiCardID, phoneNum, availablePoints) " +
            "VALUES (#{userID}, #{password}, #{citiCardID}, #{phoneNum}, #{availablePoints})";



    void deleteUser(int id);






}
