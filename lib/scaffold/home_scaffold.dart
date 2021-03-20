import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

//Pages
import 'package:home_mate/pages/dashboard.dart';
import 'package:home_mate/pages/settings.dart';
import 'package:home_mate/pages/profiles.dart';
import 'package:home_mate/pages/notifications.dart';
import 'package:home_mate/pages/search.dart';



class HomeScaffold extends StatefulWidget {
  @override
  _HomeScaffoldState createState() => _HomeScaffoldState();
}

class _HomeScaffoldState extends State<HomeScaffold> {

  //Settings
  PersistentTabController _controller;
  bool _hideNavBar;


  //States
  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
    _hideNavBar = false;
  }

  //NavBar Item Colors
  Color itemActiveColor = Colors.blueAccent;
  Color itemInActiveColor = Colors.white;

  //NavigationBar Buttons List
  List<PersistentBottomNavBarItem> _navBarItems() {
    return[
      PersistentBottomNavBarItem(
        icon: Icon(Icons.dashboard_rounded),
        title: 'Dashboard',
        activeColor: itemActiveColor,
        inactiveColor: itemInActiveColor,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.search_rounded),
        title: 'Search',
        activeColor: itemActiveColor,
        inactiveColor: itemInActiveColor,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.people_alt_rounded),
        title: 'Profiles',
        activeColor: itemActiveColor,
        inactiveColor: itemInActiveColor,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.notifications_rounded),
        title: 'Notifications',
        activeColor: itemActiveColor,
        inactiveColor: itemInActiveColor,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.settings_rounded),
        title: 'Settings',
        activeColor: itemActiveColor,
        inactiveColor: itemInActiveColor,
      )
    ];
  }

  //Corresponding Pages List
  List<Widget> _navPages() {
    return [
      DashboardPage(),
      SearchPage(),
      ProfilesPage(),
      NotificationPage(),
      SettingsPage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      //ApplicationBar
        appBar:AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          title:Text('Home Mate', style:TextStyle(color: Colors.grey)),
        ),

        //Body
        body: PersistentTabView(

          //Settings
          context,
          controller: _controller,
          confineInSafeArea: true,
          handleAndroidBackButtonPress: true,
          resizeToAvoidBottomInset: true,
          stateManagement: true,
          hideNavigationBarWhenKeyboardShows: true,
          popAllScreensOnTapOfSelectedTab: true,

          //Hide NavigationBar
          hideNavigationBar: _hideNavBar,

          //Navigation bar Items
          items: _navBarItems(),
          screens: _navPages(),

          //Visuals
          decoration: NavBarDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  ColorTween(
                    begin: Colors.blueAccent,
                    end: Colors.blueGrey[400].withRed(100),
                  ).lerp(1),
                  ColorTween(
                    begin: Colors.green,
                    end: Colors.blueGrey[800].withGreen(80),
                  ).lerp(1),
                ]
            )
          ),
          navBarStyle: NavBarStyle.style13,

          //Margins
          margin: EdgeInsets.fromLTRB(0,0,0,4),
          bottomScreenMargin: 0,

          //Animations
          itemAnimationProperties: ItemAnimationProperties(
              duration: Duration(milliseconds: 400),
              curve: Curves.ease
          ),
          screenTransitionAnimation: ScreenTransitionAnimation(
              animateTabTransition: true,
              duration: Duration(milliseconds: 200),
              curve: Curves.ease
          ),


        )
    );
  }
}


