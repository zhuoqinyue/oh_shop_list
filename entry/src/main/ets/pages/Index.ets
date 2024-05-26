import { TabCls, firstPageTabs } from '../model/firstPage'
import Home from './Home'
import Mine from './Mine'

@Entry
@Component
struct Index {
  @State currentIndex: number = 0;
  private tabsController: TabsController = new TabsController();

  @Builder
  TabBuilder(TabData: TabCls) {
    Column() {
      Image(this.currentIndex === TabData.index ? TabData.selectedIcon : TabData.commonIcon)
        .width(25)
        .height(25)
      Text(TabData.title).margin({ top: 4 })
        .fontSize(10)
        .fontColor(this.currentIndex === TabData.index ? '#1698CE' : '#6B6B6B')
    }.height(56)
    .width('100%')
    .justifyContent(FlexAlign.Center)
    .onClick(() => {
      this.currentIndex = TabData.index;
      this.tabsController.changeIndex(this.currentIndex);
    })
  }

  build() {

    Tabs({
      barPosition: BarPosition.End,
      controller: this.tabsController
    }) {
      ForEach(firstPageTabs, (item: TabCls) => {
        TabContent() {
          if (item.index === 0) {
            Home()
          } else {
            Mine()
          }
        }.tabStyles().tabBar(this.TabBuilder(item))
      })
    }.onChange((index: number) => this.currentIndex = index)
  }
}

@Extend(TabContent)
function tabStyles() {
  .padding({ left: 12, right: 12 })
  .backgroundColor('#F1F3F5')
}