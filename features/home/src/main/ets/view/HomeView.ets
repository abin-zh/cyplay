import { MovieTab } from '../components/MovieGrid'
import { Banner } from '../components/Banner'

@Component
export struct HomeView {
  build() {
    NavDestination() {
      List(){
        ListItem(){
          Banner().padding({top: 16,left: 16, right: 16 })
        }
        ListItem(){
          MovieTab().padding({left: 16, right: 16 })
        }
      }
    }
    .mode(NavDestinationMode.STANDARD)
  }
}