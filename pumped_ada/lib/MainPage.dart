import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

//import './BLEPage.dart';
import './MyAda.dart';
import './Home.dart';
import './helpers/widgets.dart';
import './Connect.dart';
import 'package:flutter_blue/flutter_blue.dart';

//import './LineChart.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPage createState() => new _MainPage();
}

class _MainPage extends State<MainPage> {
  int _currentIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Widget tabPage() {
    switch(_currentIndex) {
      case 0:
        return HomeScreen(goToMyAda, goToConnect);
        break;
      case 1:
        return MyAda();
        break;
      case 2:
        return ConnectScreen();
        break;
    }
  }


  void goToMyAda() {
    setState(() {
      _currentIndex = 1;
    });
  }

  void goToConnect() {
    setState(() {
      _currentIndex = 2;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        title: const Text('Ada'),
//      ),
      body: StreamBuilder<BluetoothState>(
          stream: FlutterBlue.instance.state,
          initialData: BluetoothState.unknown,
          builder: (c, snapshot) {
            final state = snapshot.data;
            //if (state == BluetoothState.on) {
              return tabPage();
           // }
            //return BluetoothOffScreen(state: state);
          }),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex, // this will be set when a new tab is tapped
//        currentIndex: 0,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('HOME'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.panorama_fish_eye),
            title: new Text('MY ADA'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            title: Text('CONNECT'),
          )
        ],
      ),
    );
  }

}