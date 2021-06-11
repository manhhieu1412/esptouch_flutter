import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:esptouch/viewmodels/homepagedata.dart';
import 'package:esptouch/icons/my_flutter_app_icons.dart';
import 'package:esptouch/ui/shared/globals.dart';
import '../widgets/homepagewidget/homeappbar.dart';
import '../widgets/homepagewidget/homelandscapelayout.dart';
import '../widgets/homepagewidget/homeportraitlayout.dart';

class UserHome extends StatefulWidget {
  @override
  _UserHomeState createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Global.mediumBlue,
      ),
      title: 'AKASHIC',
      initialRoute: '/',
      routes: {"/": (context) => HomeView()},
    );
  }
}

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: HomePage(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(CustomIcons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(CustomIcons.group),
            label: 'Members',
          ),
          BottomNavigationBarItem(
            icon: Icon(CustomIcons.sliders),
            label: 'Setting',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        return ChangeNotifierProvider(
          create: (context) => HomePageData(),
          child: Padding(
            padding: const EdgeInsets.only(right: 20, left: 20),
            child: Consumer<HomePageData>(
              builder: (context, data, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    orientation == Orientation.portrait
                        ? HomeAppBar()
                        : SizedBox(
                            height: 20,
                          ),
                    Expanded(
                      flex: 9,
                      child: Container(
                        width: orientation == Orientation.portrait
                            ? MediaQuery.of(context).size.width
                            : MediaQuery.of(context).size.width - 80,
                        child: ScrollView(),
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}

class ScrollView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: orientation == Orientation.portrait
              ? HomePortraitLayout()
              : HomeLandScapeLayout(),
        );
      },
    );
  }
}
