import { File } from '@ohos/file';
import { Home } from '@ohos/home'
import { Setting } from '@ohos/mine';

AppStorage.setOrCreate("currentBreakpoint", "sm");


@Entry
@Component
struct Index {
  @StorageLink("currentBreakpoint") currentBreakpoint: String = "sm"
  @StorageProp("bottomRectHeight") bottomRectHeight: number = 0
  @StorageProp("topRectHeight") topRectHeight: number = 0
  @State private currentIndex: Number = 0

  build() {

    // 修改断点的取值范围同时启用更多断点，注意，修改的断点值后面必须加上vp单位。
    GridRow() {
      GridCol({
        span: {
          xs: 12,
          sm: 12,
          md: 12,
          lg: 12,
          xl: 12,
          xxl: 12
        }
      }) {
        Tabs({ barPosition: this.currentBreakpoint === "lg" ? BarPosition.Start : BarPosition.End }) {
          TabContent() {
            Home()
          }
          .tabBar(this.tabBuilder('首页', 0, $r('app.media.home'), $r("app.media.home_active")))

          TabContent() {
            File()
          }
          .tabBar(this.tabBuilder('文件', 1, $r('app.media.document'), $r("app.media.document_active")))

          TabContent() {
            Setting()
          }
          .tabBar(this.tabBuilder('设置', 2, $r('app.media.setting'), $r("app.media.setting_active")))
        }
        .barWidth(this.currentBreakpoint === "lg" ? 100 : '100%')
        .barHeight(this.currentBreakpoint === "lg" ? '100%' : 45)
        // 设置不同断点下页签的布局模式
        .barMode(this.currentBreakpoint === "lg" ? BarMode.Scrollable : BarMode.Fixed,
          { nonScrollableLayoutStyle: LayoutStyle.ALWAYS_CENTER })
        // lg断点时为纵向Tabs，sm、md断点时为横向Tabs
        .vertical(this.currentBreakpoint === "lg" ? true : false)
        .scrollable(false)
        .onChange((index: number) => {
          this.currentIndex = index
        })
      }
    }
    .padding({ top: px2vp(this.topRectHeight + 18), bottom: px2vp(this.bottomRectHeight) })
    .onBreakpointChange((currentBreakpoint: string) => {
      this.currentBreakpoint = currentBreakpoint
    })
  }

  @Builder
  tabBuilder(title: string, targetIndex: number, normalImg: Resource, selectedImg: Resource) {
    Column() {
      Image(this.currentIndex === targetIndex ? selectedImg : normalImg)
        .size({ width: 25, height: 25 })
      Text(title)
        .fontColor(this.currentIndex === targetIndex ? '#007DFF' : '#515151')
    }
    .width('100%')
    .height(50)
    .justifyContent(FlexAlign.Center)
  }
}