import 'package:flutter/foundation.dart';
import 'package:esptouch/viewmodels/homedatamodel.dart';
import 'package:esptouch/icons/my_flutter_app_icons.dart';

class HomePageData extends ChangeNotifier {
  List<UserInfoModel> userInfo = [
    UserInfoModel(
        userImage:
            'https://cdt.org/wp-content/uploads/2015/10/2015-10-06-FB-person-640x403.png',
        notificationCount: 1)
  ];

  List<RoomInfoModel> roomInfoData = [
    RoomInfoModel(
        title: 'Temperature',
        subTitle: 'Bedroom,Kitchen',
        isActive: true,
        iconData: CustomIcons.temperatire),
    RoomInfoModel(
        title: 'Lights',
        subTitle: 'Bedroom,Kitchen',
        isActive: true,
        iconData: CustomIcons.lightbulb_outline),
    RoomInfoModel(
        title: 'Music',
        subTitle: 'Johg Robinson - N',
        isActive: true,
        iconData: CustomIcons.music),
    RoomInfoModel(
        title: 'Smart TV',
        subTitle: 'Playing HBO',
        isActive: false,
        iconData: CustomIcons.television),
    RoomInfoModel(
        title: 'Router',
        subTitle: '128.67/Mbit/s',
        isActive: true,
        iconData: CustomIcons.router)
  ];

  void switchOffAll(RoomInfoModel roomInfoModel) {
    roomInfoModel.switchToggle();
    notifyListeners();
  }
}
