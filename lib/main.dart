import 'package:flutter/material.dart';

//pages
import 'package:home_mate/home.dart';
import 'package:home_mate/pages/dashboard.dart';
import 'package:home_mate/drawer/navigation_drawer.dart';
import 'package:home_mate/widgets/widgets_menu.dart';
import 'package:home_mate/pages/settings.dart';
import 'package:home_mate/pages/profiles.dart';
import 'package:home_mate/pages/notifications.dart';
import 'package:home_mate/pages/search.dart';



void main() => runApp(MaterialApp(

  initialRoute: '/',

  routes: {
    '/':                (context) => Home(),
    '/dashboard':       (context) => DashboardPage(),
    '/navigation_menu': (context) => NavDrawer(),
    '/widgets_menu':    (context) => WidMenuPage(),
    '/settings':        (context) => SettingsPage(),
    '/profiles':        (context) => ProfilesPage(),
    '/notifications':   (context) => NotificationPage(),
    '/search':          (context) => SearchPage(),
  },
));