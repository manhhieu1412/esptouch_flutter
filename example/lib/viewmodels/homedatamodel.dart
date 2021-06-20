import 'package:flutter/material.dart';

class HomeDataModel {
  UserInfoModel userInfoModel;
  RoomInfoModel roomInfoModel;

  HomeDataModel(this.userInfoModel, this.roomInfoModel);
}

class UserInfoModel {
  final String userImage;
  final int notificationCount;

  UserInfoModel({this.userImage = '', this.notificationCount = 0});
}

class RoomInfoModel {
  bool isActive;
  String title;
  String subTitle;
  IconData iconData;
  RoomInfoModel({
    this.isActive = false,
    required this.title,
    required this.subTitle,
    required this.iconData,
  });

  void switchToggle() {
    isActive = !isActive;
  }
}
