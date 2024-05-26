export class LoginSourceData {
  title: Resource | string;
  img: Resource;
  others?: Resource | string;

  constructor(title: Resource | string, img: Resource, others?: Resource | string) {
    this.title = title;
    this.img = img;
    this.others = others;
  }
}


class HomeModel {
  static readonly petImgs: Resource[] = [
    $r('app.media.cat1'),
    $r('app.media.cat2'),
    $r('app.media.cat3'),
  ];
  static readonly PetAbilityData: LoginSourceData[] = [
    new LoginSourceData($r('app.string.pet_Info'), $r('app.media.pet')),
    new LoginSourceData($r('app.string.pet_medical'), $r('app.media.medical')),
    new LoginSourceData($r('app.string.pet_face'), $r('app.media.petface')),
    new LoginSourceData($r('app.string.pet_food'), $r('app.media.petfood')),
  ];
  static readonly PetCardData: LoginSourceData[] = [
    new LoginSourceData('凶宠排行', $r('app.media.gridCat1'), '排行最凶的10种宠物'),
    new LoginSourceData('科学喂养', $r('app.media.gridCat2'), '如何将猫主子喂养的更健康'),
    new LoginSourceData('猫咪为什么发呆', $r('app.media.gridCat3'), '猫咪发呆可能代表...'),
    new LoginSourceData('猫咪为什么站立', $r('app.media.gridCat4'), '注意, 猫咪站立可能是为了...'),
  ];
  static readonly MineSettingsListData: LoginSourceData[] = [
    new LoginSourceData($r('app.string.setting_list_news'), $r('app.media.send'), $r("app.string.setting_toggle")),
    new LoginSourceData($r('app.string.setting_list_data'), $r('app.media.data')),
    new LoginSourceData($r('app.string.setting_list_menu'), $r('app.media.menu')),
    new LoginSourceData($r('app.string.setting_list_storage'), $r('app.media.storage')),
    new LoginSourceData($r('app.string.setting_list_privacy'), $r('app.media.privacy')),
    new LoginSourceData($r('app.string.setting_list_about'), $r('app.media.about'))
  ];
}

export default HomeModel;