import axios from '@ohos/axios'
import { AxiosError, InternalAxiosRequestConfig, AxiosResponse, AxiosRequestConfig } from '@ohos/axios'
import Url from '@ohos.url'

export const request = axios.create({
  baseURL: 'https://emby2.misakaf.org/emby/', // 基地址
  timeout: 5000,
})

//请求拦截器
request.interceptors.request.use((config: InternalAxiosRequestConfig) => {
  let params:Url.URLParams = new Url.URLParams()
  params.append("X-Emby-Client", "Android")
  params.append("X-Emby-Device-Name", "Samsung Galaxy SIII")
  params.append("X-Emby-Device-Id", "994076f6-10ba-4832-b40b-4fe0e0687d72")
  params.append("X-Emby-Client-Version", "3.4.20")

  // 获取storage中的AccessToken
  let accessToken:string | undefined = undefined;
  accessToken = AppStorage.get("accessToken")
  if(accessToken != undefined){
    params.append("X-Emby-Token",accessToken)
  }
  
  config.params = params.toString();

  return config;
}, (error: AxiosError) => {
  return Promise.reject(error);
});

//响应拦截器
request.interceptors.response.use((response: AxiosResponse) => {
  // 对响应数据做点什么
  // response.data.code 存在且不为 200 时，返回错误结果
  return response.data?.data;
}, (error: AxiosError) => {
  // 对响应错误做点什么
  return Promise.reject(error);
});

