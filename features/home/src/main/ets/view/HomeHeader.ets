
@Component
export struct HomeHeader{
  // features/home/src/main/ets/view/HomeHeader.ets
  // 顶部页签及搜索框
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
    }
  }

  // 顶部页签
  @Builder
  TopTabBar() {
    Row() {
      List({space: 16 }) {
        ListItem(){
          Text("首页").fontSize(18).fontColor("#007DFF").fontWeight("bold")
        }
        ListItem(){
          Text("动漫追更")
        }
        ListItem(){
          Text("原盘番剧")
        }
        ListItem(){
          Text("国产剧集")
        }
        ListItem(){
          Text("播放列表")
        }
        ListItem(){
          Text("日韩剧集")
        }
        ListItem(){
          Text("欧美剧集")
        }
        ListItem(){
          Text("演唱会")
        }
        ListItem(){
          Text("电影")
        }
        ListItem(){
          Text("综艺节目")
        }
      }
      .scrollBarWidth(0)
      .listDirection(Axis.Horizontal)
      .width('100%')
      .height(45)
      .alignListItem(ListItemAlign.End)
      .padding({left: 8, right: 8})
    }
  }

  // 搜索框
  @Builder
  searchBar() {
    Row() {
      Stack({ alignContent: Alignment.Start }) {
        Search({placeholder: "搜索你想看的内容"})
          .searchButton("搜索")
          .height(45)
      }
      .alignSelf(ItemAlign.Center)
      // 增加的空间全部分配给搜索框
      .layoutWeight(1)
    }.padding({top: 8, bottom: 8})
  }
}

