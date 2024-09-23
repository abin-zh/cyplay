import { FileGrid } from '../components/FileGrid'

@Component
export struct FileView{
  build() {
    NavDestination() {
      FileGrid()
        .padding({left: 16, right: 16})
    } 
    .mode(NavDestinationMode.STANDARD)
    .title("文件")
  }
}