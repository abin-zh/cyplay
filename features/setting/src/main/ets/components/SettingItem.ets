import { Setting } from '../viewmodel/Setting';

@Component
export struct SettingItem {

  @Prop setting: Setting;

   
  build() {
    Flex({alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceBetween}){
      Row(){
        Image(this.setting.icon)
          .width(30)
          .height(30)
        Text(this.setting.title)
          .fontWeight(FontWeight.Bold)
          .fontSize(18)
          .margin({left: 16})
      }
      Row(){
        Image($r("app.media.right"))
          .width(30)
          .height(30)
      }
    }
    .width('100%')
    .height(60)
    .padding({top: 8, bottom: 8})
    .border({
      width: { bottom: 1 },
      color: "#EBEDEF",
      style: BorderStyle.Solid
    })
  }
}


