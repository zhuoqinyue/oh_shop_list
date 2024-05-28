import TaskMan from '../model/taskManModel'
import AddTaskModal from '../view/taskManView/addTaskModal'

@Entry
@Component
export default struct TaskManPage {
  @State tasks: TaskMan[] = [];
  @State lastUpdateTime: string = '';
  @State total: number = 0 //任务数
  @State finish: number = 0 //完成数
  dialogController = new CustomDialogController({
    builder: AddTaskModal({
      onConfirm: (value): void => console.log(value)
    }),
    alignment: DialogAlignment.Bottom,
    offset: {
      //x,y轴的相对偏移
      dx: 0,
      dy: -20
    },
    customStyle: true,
    autoCancel: false
  })

  @Builder
  titleBar() {
    Text('任务管理')
      .width('88%')
      .height('32vp')
      .fontSize('24fp')
      .fontWeight(700)
      .margin({
        top: '12vp',
        bottom: '12vp'
      })
  }

  @Builder
  allProgressBar() {
    Row() {
      Column() {
        Text('总进度')
          .fontSize($r('sys.float.ohos_id_text_size_sub_title1'))
          .fontWeight(FontWeight.Bold)
        Row() {
          Text('最近更新：')
          // .subTextStyle()
          Text(this.lastUpdateTime)
          // .subTextStyle()
        }
      }

      Blank()

      Stack() {
        Row() {
          Text(this.finish.toString())
            .fontSize($r('sys.float.ohos_id_text_size_sub_title3'))
          Text("/" + this.total.toString())
            .fontSize($r('sys.float.ohos_id_text_size_sub_title3'))
        }

        Progress({
          value: this.finish,
          total: this.total,
          type: ProgressType.Ring
        }).width(50)
      }
    }
  }

  @Builder
  overViewCard() {
    Row() {
      Image($r("app.media.loginCat"))
        .width(96).height(96)
        .objectFit(ImageFit.Fill)
      Column() {
        Text('2024开发任务')
          .fontSize($r('sys.float.ohos_id_text_size_dialog_tittle'))
          .fontWeight(FontWeight.Bolder)
        Text('高质量完成交付')
          .fontColor($r('sys.color.ohos_id_color_text_secondary'))
          .fontSize($r('sys.float.ohos_id_text_size_sub_title1'))
      }
      .margin({ left: 20 })
      .alignItems(HorizontalAlign.Start)
    }.backgroundColor('#fff')
    .width('100%').borderRadius(24).padding(20)
  }

  build() {
    Column() {
      this.titleBar()
      this.overViewCard()
      this.allProgressBar()

      Blank()

      Button('+')
        .bottomButtonStyle('#007dff')
        .onClick(() => this.dialogController.open())

    }
    .height('100%')
    .width('100%')
    .backgroundColor('#f1f3f5')
  }
}

@Extend(Button)
function bottomButtonStyle(color: Resource | string) {
  .fontSize('16fp')
  .fontColor(color)
  .fontWeight(500)
  .width('156vp')
  .height('40vp')
  .backgroundColor('#0D182431')
}