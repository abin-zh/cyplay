import { LatestMovieList } from '../components/LatestMovieList'
import { Banner } from '../components/Banner'

@Builder
export function HomeViewBuilder() {
  HomeView()
}

@Component
export struct HomeView {
  pathStack: NavPathStack = new NavPathStack()

  build() {
    NavDestination() {
      List(){
        ListItem(){
          Banner().padding({top: 16,left: 16, right: 16 })
        }
        ListItem(){
          LatestMovieList().padding({top: 16, left: 16, right: 16 })
        }
      }
    }
    .hideTitleBar(true)
    .mode(NavDestinationMode.STANDARD)
    .onReady((context: NavDestinationContext) => {
      this.pathStack = context.pathStack
    })
  }
}