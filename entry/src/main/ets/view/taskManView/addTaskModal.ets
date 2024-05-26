// @Entry
@Component @CustomDialog
export default
struct AddTaskModal {
  @State taskName: string = '' //任务名
  ctrl?: CustomDialogController
  onConfirm? : (value: string) => void

  build() {
    Column({space: 10}) {
      Text('添加任务')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .width('100%')

      TextInput({placeholder: '输入任务名'})
        .onChange((value) => this.taskName = value)

      Row(){
        Button('取消')
          .onClick(() =>{
            this.ctrl?.close()
          }).width('30%')
        Button('确定')
          .width('30%')
          .onClick(() => {
            if (this.onConfirm) {
              this.onConfirm(this.taskName)
            }
          })
      }
      .width('100%')
      .height('10%')
      .justifyContent(FlexAlign.SpaceBetween)
    }
    .padding(20)
    .width('90%')
    .backgroundColor(Color.White)
    .borderRadius(15)
  }
}