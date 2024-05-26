import { promptAction, router } from '@kit.ArkUI';

@Entry
@Component
struct LoginPage {
  @State account: string = '';
  @State password: string = '';
  @State isShowProgress: boolean = false;
  private timeOutId: number = -1;

  login(): void {
    if (this.account === '' || this.password === '') {
      promptAction.showToast({
        message: '请输入不能为空'
      })
    } else {
      this.isShowProgress = true;
      console.log(`this.timeOutId: ${this.timeOutId}`)
      if (this.timeOutId === -1) {
        this.timeOutId = setTimeout(() => {
          this.isShowProgress = false;
          this.timeOutId = -1;
          router.replaceUrl({ url: 'pages/Index' });
        }, 2000);
      }
    }
  }

  aboutToDisappear() {
    clearTimeout(this.timeOutId);
    this.timeOutId = -1;
  }

  @Builder
  imageButton(src: Resource) {
    Button({ type: ButtonType.Circle, stateEffect: true }) {
      Image(src)
    }
    .height(35)
    .width(35)
    .backgroundColor('#F1F3F5')
  }

  @Builder
  MyLine() {
    Line()
      .MyLineStyle()
  }

  @Builder
  LoginInput(placeholder: string, changeCallback: (value: string) => void, type: InputType, maxLength?: number) {
    TextInput({ placeholder })
      .maxLength(maxLength && maxLength > 0 ? maxLength : 10)
      .type(type ? type : InputType.Normal)
      .inputStyle()
      .onChange(changeCallback)
    this.MyLine()
  }

  build() {
    Column() {

      Image($r('app.media.loginCat'))
        .width(78)
        .height(78)
        .margin({ top: 100, bottom: 8 })
        .borderRadius(20)
      Text('登录界面')
        .fontSize(24)
        .fontWeight(FontWeight.Medium)
        .fontColor('#182431')
      Text('登录帐号以使用更多服务')
        .fontSize(16)
        .fontColor('#99182431')
        .margin({ bottom: 30, top: 8 })

      this.LoginInput('帐号', (value: string) => this.account = value, InputType.Number)
      this.LoginInput('密码', (value: string) => this.password = value, InputType.Password, 8)


      Row() {
        Text('短信验证码登录').helpLoginStyle(12)
        Text('忘记密码').helpLoginStyle(12)
      }
      .justifyContent(FlexAlign.SpaceBetween)
      .width('100%')
      .margin({ top: 8 })

      Button('登录', { type: ButtonType.Capsule })
        .width('80%')
        .height(40)
        .fontSize(16)
        .fontWeight(FontWeight.Medium)
        .backgroundColor('#ffff7700')
        .margin({ top: 87, bottom: 12 })
        .onClick(() => this.login())

      Text('注册帐号')
        .helpLoginStyle(16)

      if (this.isShowProgress) {
        LoadingProgress()
          .color('#182431')
          .width(30)
          .height(30)
          .margin({ top: 20 })
      }

      Blank()
      Text('其他登录方式')
        .fontColor('#838D97')
        .fontSize(12)
        .fontWeight(FontWeight.Medium)
        .margin({ top: 50, bottom: 20 })
      Row({ space: 45 }) {
        this.imageButton($r('app.media.huawei'))
        this.imageButton($r('app.media.wx'))
        this.imageButton($r('app.media.lark'))
        this.imageButton($r('app.media.mayipay'))
      }

    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F1F3F5')
    .padding({ left: 12, right: 12, bottom: 24 })
  }
}

@Extend(TextInput)
function inputStyle() {
  .placeholderColor('#99182431')
  .height(45)
  .fontSize(18)
  .backgroundColor('#F1F3F5')
  .width('100%')
  .padding({ left: 0 })
  .margin({ top: 12 })
}

@Extend(Line)
function MyLineStyle() {
  .width('100%')
  .height(1)
  .backgroundColor('#33182431')
}


@Extend(Text)
function helpLoginStyle(Size: number) {
  .fontColor('#ffff7700')
  .fontSize(Size)
  .fontWeight(FontWeight.Medium)
}
