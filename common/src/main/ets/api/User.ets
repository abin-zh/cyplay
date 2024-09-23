import http from '@ohos.net.http';
import { request } from '../utils/Request'


/**
 *
 */
export function embyLogin(data: object) {
  return request(`/emby/Users/AuthenticateByName`, http.RequestMethod.POST, data)
}


export function embyViews(id: string) {

  return request(`/emby/Users/${id}/Views`, http.RequestMethod.GET)
}