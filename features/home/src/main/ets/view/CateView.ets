import { MovieTab } from '../components/MovieGrid'

@Component
export struct CateView {
  build() {
    NavDestination() {
      MovieTab().padding(16)
    }
    .hideTitleBar(true)
    .mode(NavDestinationMode.STANDARD)
  }
}