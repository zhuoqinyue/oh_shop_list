export class TabCls {
  title: string;
  index: number;
  selectedIcon: Resource | string;
  commonIcon: Resource | string;

  constructor(title: string, index: number, selectedIcon: Resource | string, commonIcon: Resource | string) {
    this.title = title;
    this.index = index;
    this.selectedIcon = selectedIcon;
    this.commonIcon = commonIcon;
  }
}

export const firstPageTabs: TabCls[] = [
  new TabCls('首页', 0, $r('app.media.selectHome'), $r('app.media.commonHome')),
  new TabCls('我的', 1, $r('app.media.selectMine'), $r('app.media.commonMine')),
]