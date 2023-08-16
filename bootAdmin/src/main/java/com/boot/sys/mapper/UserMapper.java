package com.boot.sys.mapper;

import com.boot.sys.entity.User;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author admin
 * @since 2023-02-13
 */
public interface UserMapper extends BaseMapper<User> {

	public List<String> getRoleNameByUserId(Integer userId);
}
