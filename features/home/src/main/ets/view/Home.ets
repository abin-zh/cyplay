import { MainPage } from '../components/MainPage'
import { MovieTab } from '../view/MovieTab'
import { Banner } from './Banner'
import { HomeHeader } from './HomeHeader'



@Component
export struct Home {
  @Builder
  PagesMap(name: String){
    if(name === 'HomeView'){
      HomeView()
    } else {
      CateView()
    }
  }


  pathStack: NavPathStack = new NavPathStack()

  aboutToAppear(): void {
    this.pathStack.pushPathByName("HomeView", '')
  }

  build() {
    Column() {
      HomeHeader().padding({ left: 16, right: 16 })
      Navigation(this.pathStack) {
      }
      .mode(NavigationMode.Stack)
      .hideTitleBar(true)
      .hideNavBar(true)
      .navDestination(this.PagesMap)
    }
  }
}

@Component
export struct HomeView {
  build() {
    NavDestination() {
      Banner().padding({ left: 16, right: 16 })
      MovieTab().padding(16)
    }
    .mode(NavDestinationMode.STANDARD)
  }
}

@Component
export struct CateView {
  build() {
    NavDestination() {
      MovieTab().padding(16)
    }
    .mode(NavDestinationMode.STANDARD)
  }
}