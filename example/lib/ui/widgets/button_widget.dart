import 'package:flutter/material.dart';
import 'package:esptouch/ui/shared/globals.dart';

class RoundedButtonWidget extends ButtonWidget {
  RoundedButtonWidget(
      {required String title,
      bool hasBorder = false,
      GestureTapCallback? onTab})
      : super(title: title, hasBorder: hasBorder, onTab: onTab, height: 48.0);
}

class ButtonWidget extends StatelessWidget {
  final String title;
  final bool hasBorder;
  final GestureTapCallback? onTab;
  final double height;

  ButtonWidget(
      {required this.title,
      this.hasBorder = false,
      this.onTab,
      this.height = 54.0});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Ink(
        decoration: BoxDecoration(
          color: hasBorder ? Global.white : Global.mediumBlue,
          borderRadius: BorderRadius.circular(10),
          border: hasBorder
              ? Border.all(
                  color: Global.mediumBlue,
                  width: 1.0,
                )
              : Border.fromBorderSide(BorderSide.none),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: this.onTab,
          child: Container(
            height: height,
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                  color: hasBorder ? Global.mediumBlue : Global.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
