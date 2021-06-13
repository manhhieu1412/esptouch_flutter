import 'package:esptouch/ui/widgets/password.dart';
import 'package:flutter/material.dart';

class AddDeviceView2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyState();
  }
}

const helperSSID =
    "SSID là thuật ngữ kỹ thuật cho tên mạng. Khi bạn thiết lập mạng gia đình không dây, bạn đặt tên cho mạng đó để phân biệt với các mạng khác trong khu vực lân cận của bạn";
const helperBSSID =
    "BSSID is the MAC address of the wireless access point (router).";
const helperPassword = "Mật khẩu của mạng Wi-Fi";

class _MyState extends State<AddDeviceView2> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _ssid = TextEditingController();
  final TextEditingController _bssid = TextEditingController();
  final TextEditingController _password = TextEditingController();
  String? _passwordStr;
  final _passwordFieldKey = GlobalKey<FormFieldState<String>>();

  @override
  void initState() {
    super.initState();
    _ssid.text = 'abc';
    _password.text = 'abc';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '',
          style: TextStyle(
            // fontFamily: 'serif-monospace',
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      // Using builder to get context without creating new widgets
      //  https://docs.flutter.io/flutter/material/Scaffold/of.html
      body: Builder(builder: (BuildContext context) {
        return Center(
          child: render(context),
        );
      }),
    );
  }

  Widget render(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
      child: SingleChildScrollView(
          child: Column(
        children: [
          Text('Nhập thông tin kết nối wifi nhà bạn'),
          Text('Chọn thông tin wifi kết nối'),
          Image.asset(
            'assets/wifi_info.png',
            width: 280,
            height: 220,
            fit: BoxFit.cover,
          ),
          DecoratedBox(
            decoration: BoxDecoration(color: Colors.blue[100]!),
            child: Padding(
              child: const Text(
                'Only supports 2.4GHz WiFi  >',
                style: TextStyle(color: Colors.blue),
              ),
              padding: EdgeInsets.symmetric(vertical: 4, horizontal: 3),
            ),
          ),
          TextFormField(
            controller: _ssid,
            decoration: InputDecoration(
              labelText: 'SSID',
              hintText: 'Tên wifi',
              helperText: helperSSID,
              suffixIcon: new GestureDetector(
                onTap: () {},
                child: new Icon(Icons.home),
              ),
            ),
          ),
          // TextFormField(
          //   controller: _bssid,
          //   decoration: const InputDecoration(
          //     labelText: 'BSSID',
          //     hintText: '00:a0:c9:14:c8:29',
          //     helperText: helperBSSID,
          //   ),
          // ),
          // TextFormField(
          //   controller: _password,
          //   decoration: const InputDecoration(
          //     labelText: 'Mật khẩu',
          //     hintText: r'V3Ry.S4F3-P@$$w0rD',
          //     helperText: helperPassword,
          //   ),
          // ),
          PasswordField(
            fieldKey: _passwordFieldKey,
            controller: _password,
            helperText: 'Nhập thông tin kết nối',
            labelText: 'Mật khẩu',
            hintText: r'V3Ry.S4F3-P@$$w0rD',
            onFieldSubmitted: (String value) {
              setState(() {
                this._passwordStr = value;
              });
            },
          ),
          CheckboxListTile(
            title: Text("Lưu thông tin"),
            value: false,
            onChanged: (newValue) {},
            controlAffinity: ListTileControlAffinity.leading,
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text('Tiếp theo'),
            style: ElevatedButton.styleFrom(
                shape: StadiumBorder(), minimumSize: Size(240, 44)),
          ),
          Text(
              "Vui lòng nhấn giữ nút trên công tắc cho đến khi đèn nhấp nháy như đã hướng dẫn"),
        ],
      )),
    );
  }
}
