import { TabItem } from '../viewmodel/TableItem'

@Component
export struct HomeHeader {
  @Consume('pathStack') pathStack: NavPathStack
  @Consume('tabList') tabList: Array<TabItem>
  @Consume('currentIndex') currentIndex: number

  build() {
    GridRow({
      columns: {
        // 栅格数4、12、12列
        sm: 4,
        md: 12,
        lg: 12,
      }
    }) {
      GridCol({
        span: {
          // 顶部页签占用4、7、7列
          sm: 4,
          md: 7,
          lg: 7,
        }
      }) {
        this.TopTabBar()
      }

      GridCol({
        span: {
          // 搜索框占用4、5、5列
          sm: 4,
          md: 5,
          lg: 5,
        }
      }) {
        this.searchBar()
      }
    }.alignItems(ItemAlign.Center)
  }

  // 顶部页签
  @Builder
  TopTabBar() {
    Row() {
      List({ space: 16 }) {
        ForEach(this.tabList, (item: TabItem, index: number) => {
          ListItem() {
            if (index == this.currentIndex) {
              Text(item.Name)
                .selectedStyle()
            } else {
              Text(item.Name)
                .defaultStyle()
            }
          }
          .onClick(() => {
            //索引相同无切换
            if(index == this.currentIndex) return;
            this.currentIndex = index
            if (item.isHome == null) {
              this.pathStack.pushPathByName("CateView", "123", true)
            } else {
              this.pathStack.pushPathByName("HomeView", null, true)
            }
          })
        })
      }
      .scrollBarWidth(0)
      .listDirection(Axis.Horizontal)
      .width('100%')
      .height(45)
      .padding({ top: 4, left: 8, right: 8 })
      .alignListItem(ListItemAlign.Center)
    }
  }

  // 搜索框
  @Builder
  searchBar() {
    Row() {
      Stack({ alignContent: Alignment.Start }) {
        Search({ placeholder: "搜索你想看的内容" })
          .searchButton("搜索")
          .height(45)
      }
      // 增加的空间全部分配给搜索框
      .layoutWeight(1)
    }
  }
}

// 扩展 文字通用样式
@Extend(Text)
function selectedStyle() {
  .fontSize(18)
  .fontColor("#007DFF")
  .fontWeight("bold")
}

@Extend(Text)
function defaultStyle() {
  .fontSize(16)
  .fontColor('#000000')
  .fontWeight('normal')
}