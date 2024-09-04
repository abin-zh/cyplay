import { MovieTab } from '../view/MovieTab'
import { Banner } from './Banner'
import { HomeHeader } from './HomeHeader'

@Component
export struct Home {
  pathStack: NavPathStack = new NavPathStack()

  build() {
    Navigation(this.pathStack) {
      HomeHeader().padding({ left: 16, right: 16 })
      Banner().padding({ left: 16, right: 16 })
      MovieTab().padding(16)
    }
    .mode(NavigationMode.Stack)
    .hideTitleBar(true)
  }
}