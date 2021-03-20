import 'package:flutter/material.dart';
import 'package:home_mate/scaffold/home_scaffold.dart';
import 'package:flutter_inner_drawer/inner_drawer.dart';

//NavigationDrawer
import 'package:home_mate/drawer/navigation_drawer.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<InnerDrawerState> _innerDrawerKey =  GlobalKey<InnerDrawerState>();

  void _toggle() {
    _innerDrawerKey.currentState.toggle(
        direction: InnerDrawerDirection.end
    );
  }


  @override
  Widget build(BuildContext context) {
    return InnerDrawer(
      //Settings
      key: _innerDrawerKey,

      //Tap Properties
      onTapClose:               true,
      tapScaffoldEnabled:       false,
      velocity:                 20,
      swipeChild:               true,
      offset:                   IDOffset.horizontal(-0.25),
      swipe:                    true,
      colorTransitionChild:     Colors.black54,
      colorTransitionScaffold:  Colors.black54,
      leftAnimationType:        InnerDrawerAnimation.quadratic,
      backgroundDecoration:     BoxDecoration(color: Colors.grey),


      //Drawer
      leftChild: NavDrawer(),

      //Scaffold
      scaffold: HomeScaffold(),

    );
  }
}
