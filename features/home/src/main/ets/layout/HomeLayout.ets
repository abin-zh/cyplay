import { HomeHeader } from '../components/HomeHeader'
import { HomeView } from '../view/HomeView'
import { CateView } from '../view/CateView'

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

  @Provide('pathStack') pathStack: NavPathStack = new NavPathStack()

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

