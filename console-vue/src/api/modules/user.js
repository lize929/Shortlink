import http from '../axios'
export default {
  loginJwt(username,password){
    return http({
      url: '/auth/login',
      method: 'post',
      username: username,
      password: password
    })
  },
  hello1(){
    return http({
      url: '/test/hello',
      method: 'get',

    })
  },
  // 注册
  addUser(data) {
    return http({
      url: '/user/register',
      method: 'post',
      data
    })
  },
  // 编辑信息
  editUser(data) {
    return http({
      url: '/user',
      method: 'put',
      data
    })
  },
  // 登录
  login(data) {
    return http({
      url: '/auth/login',
      method: 'post',
      data
    })
  },
  // 退出登录
  logout(data) {
    return http({
      url: '/user/logout?token=' + data.token + '&username=' + data.username,
      method: 'delete'
    })
  },
  // 检查用户名是否可用
  hasUsername(data) {
    return http({
      url: '/user/has-username',
      method: 'get',
      params: data
    })
  },
  // 根据用户名查找用户信息
  queryUserInfo(data) {
    return http({
      url: '/actual/user/' + data,
      method: 'get'
    })
  }
}
