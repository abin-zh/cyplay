import { embyItems, Movie } from '@ohos/common'
import { MovieGrid } from '../components/MovieGrid'
import { TabItem } from '../viewmodel/TableItem'

@Builder
export function CateViewBuilder() {
  CateView()
}

@Component
export struct CateView {
  pathStack: NavPathStack = new NavPathStack()
  @StorageProp("userId") userId: string = ''
  @Provide('movies') movies: Array<Movie> = new Array<Movie>()
  @Provide('loading') loading: boolean = false
  //tab列表
  @Consume('tabList') tabList: Array<TabItem>
  //当前tab索引
  @Consume('currentIndex') currentIndex: number

  build() {
    NavDestination() {
      MovieGrid().padding({ top: 4, left: 16, right: 16 })
    }
    .hideTitleBar(true)
    .mode(NavDestinationMode.STANDARD)
    .onReady((context: NavDestinationContext) => {
      this.pathStack = context.pathStack
    })
    .onAppear(() => {
      this.loading = true
      embyItems(this.userId, this.tabList[this.currentIndex].Id, 50).then(res => {
        this.loading = false
        this.movies = res.data.Items
        this.movies = [...this.movies]
      })
    })
  }
}