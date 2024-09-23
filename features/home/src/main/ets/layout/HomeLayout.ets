import { HomeHeader } from '../components/HomeHeader'
import { TabItem } from '../viewmodel/TableItem'
import { display } from '@kit.ArkUI'
import hilog from '@ohos.hilog'
import { HomeView } from '../views/HomeView'
import { embyLogin, embyViews, LoginParams } from '@ohos/common'

@Component
export struct Home {
  //屏幕宽高参数参数
  @StorageProp("currentBreakpoint") currentBreakpoint: String = "sm"
  @StorageProp("bottomRectHeight") bottomRectHeight: number = 0
  @StorageProp("topRectHeight") topRectHeight: number = 0
  //页面栈
  @Provide('pathStack') pathStack: NavPathStack = new NavPathStack()
  //tab列表
  @Provide('tabList') tabList: Array<TabItem> = []
  //当前tab索引
  @Provide('currentIndex') currentIndex: number = 0

  aboutToAppear() {
    let accessToken: string | undefined = AppStorage.get("accessToken")
    if (accessToken == undefined) {
      embyLogin(new LoginParams("abin9996", "863030357")).then(res => {
        if (res?.data) {
          AppStorage.SetOrCreate("accessToken", res.data.AccessToken)
          AppStorage.SetOrCreate("userId", res.data.User.Id)
          embyViews(res.data.User.Id).then(res => {
            if (res?.data) {
              this.tabList.push(new TabItem("0001", "首页", null, true))
              res.data.Items.forEach((item: TabItem) => {
                this.tabList.push(item)
              })
            }
          })
        }
      })
    }
  }

  build() {
    Column() {
      HomeHeader().padding({ left: 16, right: 16 })
      Navigation(this.pathStack) {
      }
      .mode(NavigationMode.Stack)
      .hideTitleBar(true)
      .hideNavBar(true)
      .height(px2vp(display.getDefaultDisplaySync().height - this.topRectHeight - this.bottomRectHeight) -
      this.getHeight())
      .onAppear(() => {
        this.pathStack.pushPathByName("HomeView", null, false)
      })
      .gesture(
        // 绑定拖动手势
        PanGesture({ direction: PanDirection.Horizontal, distance: 100 })
          .onActionEnd((event: GestureEvent | undefined) => {
            if (event) {
              let index = this.currentIndex
              if (event.offsetX > 0) {
                if (--index >= 0) {
                  const item = this.tabList[index];
                  //左滑返回
                  this.pathStack.popToName(
                    item.isHome != null ? "HomeView" : "CateView", item.Id, true
                  )
                  this.currentIndex = index
                }
              } else {
                if (++index < this.tabList.length) {
                  const item = this.tabList[index];
                  //右滑前进
                  this.pathStack.pushPathByName("CateView", item.Id, true)
                  this.currentIndex = index
                }
              }
            }
          })
      )
    }
  }

  getHeight(): number {
    let commonHeight = 45
    switch (this.currentBreakpoint) {
      case 'sm':
        commonHeight = commonHeight * 3
        break
      case 'md':
        commonHeight = commonHeight * 2
        break;
    }
    return commonHeight + 32
  }
}

