import { SettingList } from '../components/SettingList'

@Component
export struct SettingView{
  build() {
    NavDestination(){
      List(){
        ListItem(){
          Flex({alignItems: ItemAlign.Center ,justifyContent: FlexAlign.Center, direction: FlexDirection.Column}){
            Row(){
              Text("CYPLAY PRO")
                .fontWeight(FontWeight.Bold)
                .fontSize(28)
                .fontColor(Color.White)
            }
            Row(){
              Text("查看订阅")
              .fontColor(Color.White)
              Image($r("app.media.right_white"))
                .width(20)
                .height(20)
            }
          }
          .width('100%')
          .height(80)
          .backgroundImage($r("app.media.pro_bg"))
          .backgroundImageSize({width: '100%', height: '100%'})
        }
        ListItem(){
          SettingList()
        }
      }
      .padding({left: 16, right: 16})
    }
    .mode(NavDestinationMode.STANDARD)
    .title("设置")
  }
}