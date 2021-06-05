import 'package:flutter/material.dart';
import 'ui/views/login_view.dart';
import 'package:provider/provider.dart';
import 'core/viewmodels/login_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginView(),
      ),
    );
  }
}
