import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'dart:ui';

//Pages
import 'package:home_mate/pages/dashboard.dart';
import 'package:home_mate/drawer/navigation_drawer.dart';
import 'package:home_mate/widgets/widgets_menu.dart';
import 'package:home_mate/pages/settings.dart';
import 'package:home_mate/pages/profiles.dart';
import 'package:home_mate/pages/notifications.dart';
import 'package:home_mate/pages/search.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  PersistentTabController _controller;
  bool _hideNavBar;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
    _hideNavBar = false;
  }

  //NavigationBar Buttons
  List<PersistentBottomNavBarItem> _navBarItems() {
    return[
      PersistentBottomNavBarItem(
        icon: Icon(Icons.dashboard_rounded),
        title: 'Dashboard',
        activeColor: Colors.blueAccent,
        inactiveColor: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.search_rounded),
        title: 'Search',
        activeColor: Colors.blueAccent,
        inactiveColor: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.person_rounded),
        title: 'Profiles',
        activeColor: Colors.blueAccent,
        inactiveColor: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.notifications_rounded),
        title: 'Notifications',
        activeColor: Colors.blueAccent,
        inactiveColor: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.settings_rounded),
        title: 'Settings',
        activeColor: Colors.blueAccent,
        inactiveColor: Colors.grey,
      )
    ];
  }

  //Corresponding Pages
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
        title:Text('Home Mate'),
      ),

      //Drawer
      drawer: Drawer(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('Drawer')
            ],
          ),
        ),
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
        backgroundColor: Colors.white,
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
