import axios from "axios"
import {ElMessage} from "element-plus";

const authItemName = "access_token"

const defaultFailure = (message,code,url) => {
    console.warn(`请求地址:${url},状态码:${code},错误信息: ${message}`)
    ElMessage.warning(message)
}

const defaultError = (error) => {
    console.error(error)
    ElMessage.error('发生了一些错误，请联系管理员')
}

function internalPost(url,data,header,success,failure,error = defaultError){
    axios.post(url,data,{headers:header}).then(({data}) => {
        // console.log(data.code)
        if (data.code === '0'){
            success(data)
        }
        else {
            failure(data.message,data.code,url)
        }
    }).catch(err => error(err))
}

function internalGet(url,header,success,failure,error = defaultError){
    axios.get(url,{headers:header}).then(({data}) => {
        if (data.code === '0'){
            success(data)
        }
        else {
            failure(data.message,data.code,url)
        }
    }).catch(err => error(err))
}

function get(url,success,failure = defaultFailure){
    internalGet(url,accessHeader(),success,failure)
}

function post(url,data,success,failure = defaultFailure){
    internalPost(url,data,accessHeader(),success,failure)
}

// 存储token
function storeAccessToken(token,remember,expire){
    const authObj = {token:token, expire:expire}
    const str = JSON.stringify(authObj)
    if (remember)
        localStorage.setItem(authItemName,str)
    else
        sessionStorage.setItem(authItemName,str)
}

// 删除token
function deleteAccessToken(){
    localStorage.removeItem(authItemName)
    sessionStorage.removeItem(authItemName)
}

// 获取token
function takeAccessToken(){
    const str = localStorage.getItem(authItemName) || sessionStorage.getItem(authItemName)
    if (!str) return null;
    const authObj = JSON.parse(str);
    if (authObj.expire <= new Date()){
        deleteAccessToken()
        ElMessage.warning('登录状态已过期，请重新登录')
        return null
    }
    return authObj.token
}

// 用于拼接Bearer和token，方便用户退出登录
function accessHeader(){
    const token = takeAccessToken()
    return token ? {
        'Authorization': `Bearer ${takeAccessToken()}`
    } : {}
}

// 登录
function login1(username,password,remember,success,failure = defaultFailure){
    internalPost('http://localhost:8002/api/short-link/admin/v1/auth/login',{
        username: username,
        password: password
    },{
        'Content-Type': 'application/x-www-form-urlencoded'
    },(data) => {
        storeAccessToken(data.data.token,remember,data.data.expire)
        ElMessage.success(`登录成功，欢迎${data.data.username}来到我们的系统`)
        success(data)
    },failure)
}
// 退出登录
function logout(success,failure=defaultFailure){
    get('/api/short-link/admin/v1/auth/logout',() => {
        deleteAccessToken()
        ElMessage.success('退出登录成功')
        success()
    },failure)
}

// 判断用户是否未登录
function unauthorized(){
    return !takeAccessToken()
}

export {login1,logout,get,post,unauthorized,accessHeader}