import { display } from '@kit.ArkUI'
import { FileCateView } from '../views/FileCateView'
import { FileView } from '../views/FileView'

@Component
export struct File {
  @StorageProp("currentBreakpoint") currentBreakpoint: String = "sm"
  @StorageProp("bottomRectHeight") bottomRectHeight: number = 0
  @StorageProp("topRectHeight") topRectHeight: number = 0
  @Provide('pathStack') pathStack: NavPathStack = new NavPathStack()

  @Builder
  PagesMap(name: String){
    if(name === 'FileView'){
      FileView()
    } else {
      FileCateView()
    }
  }

  aboutToAppear(): void {
    this.pathStack.pushPathByName("FileView", '')
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