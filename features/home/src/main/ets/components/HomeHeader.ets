// 扩展 文字通用样式
@Extend(Text)
function selectedStyle() {
  .fontSize(18)
  .fontColor("#007DFF")
  .fontWeight("bold")
  .decoration({ type: TextDecorationType.Underline, color: "#0077DFF" })
}

@Extend(Text)
function defaultStyle() {
  .fontSize(16)
  .fontColor('#000000')
  .fontWeight('normal')
}

// 添加这个接口定义
interface TabItem {
  name: string;
  view?: string;
  path?: string;
}

@Component
export struct HomeHeader {
  @Consume('pathStack') pathStack: NavPathStack;
  @State selected: string = "MainView";

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
        ForEach([
          { name: "首页", view: "MainView", path: "HomeView" },
          { name: "动漫追更", view: "CateView", path: "CateView" },
          { name: "原盘番剧" },
          { name: "国产剧集" },
          { name: "播放列表" },
          { name: "日韩剧集" },
          { name: "欧美剧集" },
          { name: "演唱会" },
          { name: "电影" },
          { name: "综艺节目" }
        ], (item: TabItem) => {
          ListItem() {
            if (item.view && this.selected == item.view) {
              Text(item.name)
                .selectedStyle()
            } else {
              Text(item.name)
                .defaultStyle()
            }
          }
          .onClick(() => {
            if (item.view) {
              this.selected = item.view
              this.pathStack.clear()
              this.pathStack.pushPath({ name: item.path })
            }
          })
        })
      }
      .scrollBarWidth(0)
      .listDirection(Axis.Horizontal)
      .width('100%')
      .height(45)
      .padding({top: 4,left: 8, right: 8 })
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