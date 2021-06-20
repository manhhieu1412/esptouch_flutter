import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class AddDeviceWaitView extends StatefulWidget {
  AddDeviceWaitView({Key? key}) : super(key: key);

  @override
  _AddDeviceWaitViewState createState() => _AddDeviceWaitViewState();
}

class _AddDeviceWaitViewState extends State<AddDeviceWaitView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Thêm thiết bị',
            style: TextStyle(
              // fontFamily: 'serif-monospace',
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        // Using builder to get context without creating new widgets
        //  https://docs.flutter.io/flutter/material/Scaffold/of.html
        body: Builder(
          builder: (BuildContext context) {
            return render(context);
          },
        ));
  }

  Widget render(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text('Đang kết nối',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23.0)),
          Text(
              'Vui lòng đợi trong giây lát đang kết nối với module Wifi nhà bạn'),
          CircularPercentIndicator(
            radius: 160.0,
            lineWidth: 11.0,
            animation: true,
            animationDuration: 3000,
            percent: 0.7,
            animateFromLastPercent: true,
            center: Text(
              "162s",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23.0),
            ),
            // footer: Text(
            //   "Sales this week",
            //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
            // ),
            circularStrokeCap: CircularStrokeCap.round,
            progressColor: Colors.blue,
            // widgetIndicator: RotatedBox(
            //   quarterTurns: 1,
            //   child: Icon(Icons.airplanemode_active, size: 30),
            // ),
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(8),
                child: SizedBox(
                    height: 18,
                    width: 18,
                    child: CircularProgressIndicator(
                        // value: controller.value,
                        strokeWidth: 3)),
              ),
              Text(
                'Đang tìm thiết bị',
                style: TextStyle(color: Colors.blue),
              ),
            ],
          ),
          Text('Đang tìm thiết bị'),
          Text('Đã tìm thấy thiết bị'),
          Text('Kết nối thành công'),
        ],
      ),
    );
  }
}
