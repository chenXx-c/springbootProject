package com.boot.sys.service;

import com.boot.sys.entity.User;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.Map;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author admin
 * @since 2023-02-13
 */
public interface IUserService extends IService<User> {

	Map<String, Object> login(User user);

	Map<String, Object> getUserInfo(String token);

	void logout(String token);
}
