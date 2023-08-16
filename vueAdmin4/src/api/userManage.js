import request from '@/utils/request'
import {nextDate} from "element-ui";

export default {
  getUserList(searchModel) {
    return request({
      url: '/user/list',
      method: 'get',
      params: {
        pageNo: searchModel.pageNo,
        pageSize: searchModel.pageSize,
        username: searchModel.username,
        phone: searchModel.phone
      }
    })
  },
  addUser(user) {
    return request({
      url: '/user/addUser',
      method: 'post',
      data: user
    })
  },
  getUserById(id) {
    return request({
      url: `/user/getUserById/${id}`,
      method: 'get'
    })
  },
  updUser(user) {
    return request({
      url: '/user/updUser',
      method: 'put',
      data: user
    })
  },
  chooseSaveOrUpdate(user) {
    if (user.id == null && user.id == undefined) {
      return this.addUser(user)
    }
    return this.updUser(user)
  },
  delById(id) {
    return request({
      url: `/user/delById/${id}`,
      method: 'delete'
    })
  }
}
