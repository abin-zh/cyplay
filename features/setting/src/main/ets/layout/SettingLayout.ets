import { display } from '@kit.ArkUI'
import { SettingView } from '../views/SettingView'

@Component
export struct Setting {
  @StorageProp("currentBreakpoint") currentBreakpoint: String = "sm"
  @StorageProp("bottomRectHeight") bottomRectHeight: number = 0
  @StorageProp("topRectHeight") topRectHeight: number = 0
  @Provide('pathStack') pathStack: NavPathStack = new NavPathStack()

  @Builder
  PagesMap(name: String){
    if(name === 'SettingView'){
      SettingView()
    } else {
    }
  }

  aboutToAppear(): void {
    this.pathStack.pushPathByName("SettingView", '')
  }

  build() {
    Column() {
      Navigation(this.pathStack) {
      }
      .mode(NavigationMode.Stack)
      .hideTitleBar(true)
      .hideNavBar(true)
      .height(px2vp(display.getDefaultDisplaySync().height - this.topRectHeight - this.bottomRectHeight))
      .navDestination(this.PagesMap)
    }
  }
}