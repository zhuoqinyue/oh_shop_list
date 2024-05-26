import MineModel, { LoginSourceData } from '../model/homeModel'
import { promptAction, router } from '@kit.ArkUI';

@Entry
@Component
export default struct Setting {
  private logOut = () => router.replaceUrl({ url: 'pages/LoginPage' })

  @Builder
  settingCell(item: LoginSourceData) {
    Row() {
      Row({ space: 12 }) {
        Image(item.img)
          .width(20)
          .height(20)
        Text(item.title)
          .fontSize(16)
      }

      if (item.others === undefined) {
        Image($r('app.media.rightArrow'))
          .width(12)
          .height(20)
      } else {
        Toggle({ type: ToggleType.Switch, isOn: false })
      }
    }
    .justifyContent(FlexAlign.SpaceBetween)
    .width('100%')
    .padding({
      left: 8,
      right: 22
    })
  }

  build() {
    Scroll() {
      Column({ space: 12 }) {
        Column() {
          Text('我的')
            .fontWeight(FontWeight.Medium)
            .fontSize(24)
            .margin({ top: 12 })
            .padding({ left: 12 })
        }
        .width('100%')
        .alignItems(HorizontalAlign.Start)

        Row() {
          Image($r('app.media.avatar'))
            .width(48)
            .height(48)
          Column() {
            Text('Stark Zhuo')
              .fontSize(20)
            Text('1403450829@qq.com')
              .fontSize(12)
              .margin({ top: 4 })
          }
          .alignItems(HorizontalAlign.Start)
          .margin({ left: 24 })
        }
        .margin({ top: 16, bottom: 12 })
        .alignItems(VerticalAlign.Center)
        .width('100%')
        .height(96)
        .backgroundColor(Color.White)
        .padding({ left: 24 })
        .borderRadius(16)

        List() {
          ForEach(MineModel.MineSettingsListData, (item: LoginSourceData) => {
            ListItem() {
              this.settingCell(item)
            }
            .height(48)
          }, (item: LoginSourceData) => JSON.stringify(item))
        }
        .scrollBar(BarState.Off)
        .backgroundColor(Color.White)
        .width('100%')
        .height('42%')
        .divider({
          strokeWidth: 0.4,
          color: Color.Grey,
          startMargin: 10,
          endMargin: 24
        })
        .borderRadius(16)
        .padding({ top: 4, bottom: 4 })

        Blank()

        Button('退出', { type: ButtonType.Capsule })
          .width('90%')
          .height(40)
          .fontSize(16)
          .fontColor('#FA2A2D')
          .fontWeight(FontWeight.Medium)
          .backgroundColor('#E5E8EA')
          .margin({ bottom: 55 })
          .onClick(() => this.logOut())
      }
      .height('100%')
    }
  }
}