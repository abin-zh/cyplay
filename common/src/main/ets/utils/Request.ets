//导入请求
import http from '@ohos.net.http';
//响应格式
import Response from '../model/Response'

const baseInfo = '?X-Emby-Client=Emby%20Web&X-Emby-Device-Name=Google%20Chrome%20Windows&X-Emby-Device-Id=e801a66d-b73e-4004-a26a-2506a8a142ce&X-Emby-Client-Version=4.8.0.10'

//导出去一个请求函数 使用axios风格请求数据、参数可自行增加
export function request(url: string, method: http.RequestMethod, data?: object): Promise<Response> {
  const BASE_URL = "https://emby2.misakaf.org"
  let httpRequest = http.createHttp();
  const accessToken: string | undefined = AppStorage.get("accessToken")
  let xEmbyToken = (accessToken != undefined ? '&X-Emby-Token=' + accessToken : '')
  let responseResult = httpRequest.request(BASE_URL + url + baseInfo + xEmbyToken, {
    method: method,
    //请求头设置
    header: {
      'Content-Type': 'application/json'
    },

    //携带额外参数
    extraData: JSON.stringify(data),
  });

  let response = new Response();
  // 处理数据，并返回
  return responseResult.then((result: http.HttpResponse) => {
    if (result.responseCode === 200) {
      let res: Response = JSON.parse(`${result.result}`);
      response.data = res;
    } else {
      response.message = '请求错误';
      response.code = 400;
    }
    return response;
  }).catch(() => {
    response.message = '请求错误';
    response.code = 400;
    return response;
  });
}