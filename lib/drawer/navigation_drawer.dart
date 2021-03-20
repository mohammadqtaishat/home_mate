import 'package:flutter/material.dart';
import 'dart:ui';


class NavDrawerItem extends StatelessWidget {

  final String itemTitle;
  final IconData itemIcon;
  NavDrawerItem({this.itemTitle, this.itemIcon});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => print(this.itemTitle),
      title: Text(
        this.itemTitle,
        style: TextStyle(color: Colors.white, fontSize: 14),
      ),
      leading: Icon(
        this.itemIcon,
        color: Colors.white,
        size: 26,
      ),
      horizontalTitleGap: 0,
    );
  }
}

class NavDrawer extends StatelessWidget {
  //Key
  NavDrawer({Key key}) : super(key: key);

  //Offset
  final double swipeOffset = 1;

  //Navigation Drawer Items
  final Color navDrawerItemsColor = Colors.white;
  final double navDrawerItemsGap = 0;

  //Navigation Drawer Items List
  List<Widget> _navDrawerList(){
    return[
      //User
      Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 10, bottom: 15),
            width: 80,
            child: ClipRRect(
              child: Image.asset('assets/images/batman.jpg'),
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          Text(
            "User",
            style: TextStyle(color: navDrawerItemsColor, fontSize: 18),
          )
        ],
        //mainAxisAlignment: MainAxisAlignment.center,
      ),
      //Padding
      Padding(
        padding: EdgeInsets.all(10),
      ),
      NavDrawerItem(itemTitle: 'Audio', itemIcon: Icons.audiotrack_rounded),
      NavDrawerItem(itemTitle: 'Light', itemIcon: Icons.lightbulb),
      NavDrawerItem(itemTitle: 'Shade', itemIcon: Icons.wb_shade),
      NavDrawerItem(itemTitle: 'Climate', itemIcon: Icons.thermostat_rounded),
      NavDrawerItem(itemTitle: 'Security', itemIcon: Icons.security_rounded),
      NavDrawerItem(itemTitle: 'Entry', itemIcon: Icons.vpn_key_rounded),
      NavDrawerItem(itemTitle: 'Rooms', itemIcon: Icons.room_preferences_rounded),
      NavDrawerItem(itemTitle: 'ISO 3D', itemIcon: Icons.house_siding_rounded),
    ];
  }

  @override
  Widget build(BuildContext context) {
    //Navigation Menu Drawer
    return Material(
      child: Stack(
        //NavDrawer Items
        children: <Widget>[
          Container(
            //Background Color
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      ColorTween(
                        begin: Colors.blueAccent,
                        end: Colors.blueGrey[400].withRed(100),
                      ).lerp(swipeOffset),
                      ColorTween(
                        begin: Colors.green,
                        end: Colors.blueGrey[800].withGreen(80),
                      ).lerp(swipeOffset),
                    ]
                )
            ),

            //Items
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(4,0,4,0),
                  child: Column(

                    //Alignments
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,

                    //ItemList
                    children: _navDrawerList(),

                  ),
                )
              ],
            ),
          ),

          //TODO Learn what this does
          swipeOffset < 1
              ? BackdropFilter(
            filter: ImageFilter.blur(
                sigmaX: (10 - swipeOffset * 10),
                sigmaY: (10 - swipeOffset * 10)
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0),
              ),
            ),
          )
              : null,
        ].where((a) => a != null).toList(),

      ),
    );
  }
}
