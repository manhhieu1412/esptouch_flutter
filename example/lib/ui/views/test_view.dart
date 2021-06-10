import 'package:esptouch/mqtt_client/mqtt_client.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:esptouch/viewmodels/login_model.dart';
import 'package:esptouch/ui/shared/globals.dart';
import 'package:esptouch/ui/widgets/button_widget.dart';
import 'package:esptouch/ui/widgets/textfield_widget.dart';
import 'package:esptouch/ui/widgets/wave_widget.dart';

import 'package:provider/provider.dart';

class TestView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => LoginModel(), child: TestViewContainer());
  }
}

class TestViewContainer extends StatefulWidget {
  @override
  _TestViewContainerState createState() => _TestViewContainerState();
}

class _TestViewContainerState extends State<TestViewContainer> {
  final AppMqttClient client = AppMqttClient();

  void startService() async {
    int result = await client.startService();
    print(result);
  }

  void publishMessage() {
    client.publishMessage();
  }

  void subscribe() {
    client.subscribe();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool keyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;
    final model = Provider.of<LoginModel>(context);

    return Scaffold(
      backgroundColor: Global.white,
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height - 200,
            color: Global.mediumBlue,
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeOutQuad,
            top: keyboardOpen ? -size.height / 3.7 : 0.0,
            child: WaveWidget(
              size: size,
              yOffset: size.height / 3.0,
              color: Global.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Login',
                  style: TextStyle(
                    color: Global.white,
                    fontSize: 40.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextFieldWidget(
                  hintText: 'Email',
                  obscureText: false,
                  prefixIconData: Icons.mail_outline,
                  suffixIconData: model.isValid ? Icons.check : null,
                  onChanged: (value) {
                    model.isValidEmail(value);
                  },
                ),
                SizedBox(
                  height: 10.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    TextFieldWidget(
                      hintText: 'Password',
                      obscureText: model.isVisible ? false : true,
                      prefixIconData: Icons.lock_outline,
                      suffixIconData: model.isVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'Forgot password?',
                      style: TextStyle(
                        color: Global.mediumBlue,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                ButtonWidget(
                  title: 'Start Service',
                  hasBorder: false,
                  onTab: () {
                    startService();
                  },
                ),
                SizedBox(
                  height: 10.0,
                ),
                ButtonWidget(
                  title: 'Publish Message',
                  hasBorder: true,
                  onTab: () {
                    publishMessage();
                  },
                ),
                ButtonWidget(
                  title: 'Subscribe',
                  hasBorder: true,
                  onTab: () {
                    subscribe();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
