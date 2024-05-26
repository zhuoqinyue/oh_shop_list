import HomeModel, { LoginSourceData } from '../model/homeModel'
import { router } from '@kit.ArkUI';


@Component
struct Home {
  private swiperController: SwiperController = new SwiperController();

  build() {

    Scroll() {
      Column({ space: 12 }) {
        Column() {
          Text('首页')
            .fontWeight(FontWeight.Medium)
            .fontSize(24)
            .margin({ top: 12 })
            .padding({ left: 12 })
        }
        .width('100%')
        .alignItems(HorizontalAlign.Start)

        Swiper(this.swiperController) {
          ForEach(HomeModel.petImgs, (img: Resource) => {
            Image(img).borderRadius(16).height(240)
          }, (img: Resource) => JSON.stringify(img.id))
        }
        .margin({ top: 16 })
        .autoPlay(true)

        Grid() {
          ForEach(HomeModel.PetAbilityData, (item: LoginSourceData) => {
            GridItem() {
              Column() {
                Image(item.img)
                  .width(30)
                  .height(30)

                Text(item.title)
                  .fontSize(14)
                  .margin({ top: 12 })
              }
            }
          }, (item: LoginSourceData) => JSON.stringify(item))
        }
        .columnsTemplate('1fr 1fr 1fr 1fr')
        .rowsTemplate('1fr 1fr')
        .gridGap()
        .padding({ top: 12, bottom: 12 })
        .height(88)
        .backgroundColor(Color.White)
        .borderRadius(24)
        .onClick(() => {

            router.replaceUrl({ url: 'pages/TaskMan' });

        })

        Text('热点')
          .fontSize(16)
          .fontWeight(FontWeight.Medium)
          .width('100%')
          .margin({ top: 12 })

        Grid() {
          ForEach(HomeModel.PetCardData, (item: LoginSourceData) => {
            GridItem() {
              Column() {
                Text(item.title)
                  .fontSize(16)
                  .fontWeight(FontWeight.Medium)
                  .fontColor(Color.White)
                Text(item.others)
                  .margin({ top: 4 })
                  .fontSize(12)
                  .fontColor(Color.White)
              }.opacity(0.4)
              .alignItems(HorizontalAlign.Start)
            }
            .padding({ top: 8, left: 8 })
            .borderRadius(12)
            .align(Alignment.TopStart)
            .backgroundImage(item.img)
            .backgroundImageSize(ImageSize.Cover)
            .width('100%')
            .height('100%')
          }, (secondItem: LoginSourceData) => JSON.stringify(secondItem))
        }
        .width('100%')
        .height(300)
        .columnsTemplate('1fr 1fr')
        .rowsTemplate('1fr 1fr')
        .gridGap()
        .margin({ bottom: 55 })
      }
    }
    .scrollBar(BarState.Off)
    .height('100%')

  }
}

@Extend(Grid)
function gridGap() {
  .columnsGap(8)
  .rowsGap(12)
}

export default Home;

