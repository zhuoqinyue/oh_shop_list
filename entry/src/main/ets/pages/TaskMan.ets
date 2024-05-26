import AddTaskModal from '../view/taskManView/addTaskModal'

@Entry
@Component
export default struct TaskMan {
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

  build() {
    Column() {
      this.titleBar()

      Blank()

      Button('+')
        .bottomButtonStyle('#007dff')
        .onClick(() => this.dialogController.open())

    }.height('100%')
    .width('100%').backgroundColor('#f1f3f5')
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