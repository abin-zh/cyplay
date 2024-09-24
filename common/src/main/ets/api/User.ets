import http from '@ohos.net.http';
import { request } from '../utils/Request'


/**
 * emby登录
 * @param data 登录信息
 * @returns
 */
export function embyLogin(data: object) {
  return request(`/Users/AuthenticateByName`, http.RequestMethod.POST, data)
}

/**
 * emby获取分类列表
 * @param userId 用户id
 * @returns
 */
export function embyViews(userId: string) {
  return request(`/Users/${userId}/Views`, http.RequestMethod.GET)
}

/**
 * 获取分类最新资源列表
 * @param userId
 * @param parentId
 * @returns
 */
export function embyLatest(userId: string, parentId: string) {
  let params = `Limit=16&Fields=BasicSyncInfo%2CCanDelete%2CContainer%2CPrimaryImageAspectRatio%2CProductionYear%2CStatus%2CEndDate&ImageTypeLimit=1&EnableImageTypes=Primary%2CBackdrop%2CThumb&ParentId=${parentId}`
  return request(`/Users/${userId}/Items/Latest`, http.RequestMethod.GET, undefined, params)
}

export function embyItems(userId: string, parentId: string, size: number) {
  let params = `SortBy=SortName&SortOrder=Ascending&IncludeItemTypes=Series%2CMovie&Recursive=true&Fields=BasicSyncInfo%2CCanDelete%2CContainer%2CPrimaryImageAspectRatio%2CPrefix&StartIndex=0&ParentId=${parentId}&EnableImageTypes=Primary%2CBackdrop%2CThumb&ImageTypeLimit=1&Limit=${size}`
  return request(`/Users/${userId}/Items`, http.RequestMethod.GET, undefined, params)
}

export function embyResume(userId: string){
  let params = `?Recursive=true&Fields=BasicSyncInfo%2CCanDelete%2CContainer%2CPrimaryImageAspectRatio%2CProductionYear&ImageTypeLimit=1&EnableImageTypes=Primary%2CBackdrop%2CThumb&MediaTypes=Video&Limit=12`
  return request(`/Users/${userId}/Items/Resume`, http.RequestMethod.GET, undefined, params)
}