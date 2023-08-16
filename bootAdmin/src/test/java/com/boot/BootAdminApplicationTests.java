package com.boot;

import com.boot.sys.entity.User;
import com.boot.sys.service.IUserService;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import javax.annotation.Resource;
import java.util.List;

@SpringBootTest
class BootAdminApplicationTests {

	@Resource
	private IUserService userService;

	@Test
	void contextLoads() {
		List<User> list = userService.list();
		list.forEach(System.out::println);
	}

}
