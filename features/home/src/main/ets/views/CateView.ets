import { MovieGrid } from '../components/MovieGrid'

@Builder
export function CateViewBuilder() {
  CateView()
}

@Component
export struct CateView {
  pathStack: NavPathStack = new NavPathStack()

  build() {
    NavDestination() {
      MovieGrid().padding({top: 4,left: 16, right: 16})
    }
    .hideTitleBar(true)
    .mode(NavDestinationMode.STANDARD)
    .onReady((context: NavDestinationContext) => {
      this.pathStack = context.pathStack
    })
  }
}