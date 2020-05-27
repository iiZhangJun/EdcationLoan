package citi.controller;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import citi.entity.User;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.web.bind.annotation.*;
import citi.entity.JsonResult;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/citi/user")
@Api(value = "使用用户")
public class UserController {

    private final static Logger logger = LoggerFactory.getLogger(UserController.class);
    @RequestMapping(method = RequestMethod.POST, value = "/register")
    @ApiOperation(value = "用户注册")
    public JsonResult<User>  addUser(@RequestBody @ApiParam(value = "用户注册信息") User user) {
        //处理添加逻辑
        return new JsonResult<>(user,"注册成功！");
    }

    @RequestMapping(method = RequestMethod.GET, value = "/login/{phoneNum}")
    @ApiOperation(value = "根据用户唯一标识获取用户信息")
    public JsonResult<User> getUser(@PathVariable @ApiParam(value = "用户账号")  String phoneNum){
        User user = new User("zzz", "123456", phoneNum);
        return new JsonResult(user);
    }

    @RequestMapping(method = RequestMethod.GET, value = "/getUserList")
    @ApiOperation(value = "获取用户信息列表")
    public JsonResult<List> getUserList() {
        List<User> userList = new ArrayList<>();
        User user1 = new User("倪升武", "123456",null);
        User user2 = new User( "达人课", "123456",null);
        userList.add(user1);
        userList.add(user2);
        return new JsonResult(userList, "获取用户列表成功");
    }

    @RequestMapping(method = RequestMethod.GET, value = "/getUserAddress")
    @ApiOperation(value = "获取用户通信信息列表")
    public Map<String, Object> getMap() {
        Map<String, Object> map = new HashMap<>(3);
        User user = new User("倪升武", "123456",null);
        map.put("作者信息", user);
        map.put("博客地址", "http://blog.itcodai.com");
        map.put("CSDN地址", "http://blog.csdn.net/eson_15");
        map.put("粉丝数量", 4153);
        logger.debug("=====测试日志 Debug 级别打印====");
        logger.info("======测试日志 Info 级别打印=====");
        logger.error("=====测试日志 Error 级别打印====");
        logger.warn("======测试日志 Warn 级别打印=====");
        return map;
    }






}
