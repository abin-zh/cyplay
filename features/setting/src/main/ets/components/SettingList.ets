import { Setting } from '../viewmodel/Setting';
import { SettingItem } from './SettingItem';

@Component
export struct SettingList {
  @State settingList: Array<Setting> = [
    new Setting("新增文件来源", $r("app.media.plus"), "AddResourceView"),
    new Setting("联系我们", $r("app.media.contact"), "ContactUsView"),
    new Setting("帮助中心", $r("app.media.help"), "HelpCenterView"),
  ]

  build() {
    List() {
      ForEach(this.settingList, (setting: Setting) => {
        ListItem() {
          SettingItem({ setting: setting })
        }
      })
    }
  }
}



