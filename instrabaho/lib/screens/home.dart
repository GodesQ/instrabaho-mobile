import 'package:flutter/material.dart';
import 'package:instrabaho/component/myText.dart';
import 'package:basic_utils/basic_utils.dart';
import 'package:instrabaho/screens/tab_screens/add_ons_tab.dart';
import 'package:instrabaho/screens/tab_screens/chat_tab.dart';
import 'package:instrabaho/screens/tab_screens/feed_tab.dart';
import 'package:instrabaho/screens/tab_screens/home_tab.dart';
import 'package:instrabaho/screens/tab_screens/profile_tab.dart';
import 'package:ionicons/ionicons.dart';

class Home extends StatefulWidget {
  const Home({Key? key, this.userType}) : super(key: key);
  final String? userType;
  @override
  State<Home> createState() => _HomeState();
}

int _selectedIndex = 0;
List pages = [
  const HomeTab(),
  const AddOnsTab(),
  const ChatTab(),
  const FeedTab(),
  const ProfileTab()
];

final GlobalKey<ScaffoldState> _key = GlobalKey();

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      backgroundColor: Colors.white,
      drawer: const Drawer(),
      appBar: AppBar(
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            setState(() {
              _selectedIndex = 0;
            });
          },
          child: Center(
              child: IconButton(
            icon: const Icon(
              Ionicons.menu_outline,
              color: Colors.black87,
            ),
            onPressed: () {
              _key.currentState!.openDrawer();
            },
          )),
        ),
        elevation: 0,
        actions: [
          Center(
            child: MyText(
              text: StringUtils.capitalize(widget.userType ?? 'UserType'),
              size: 12,
              color: Colors.black54,
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                _selectedIndex = 4;
              });
            },
            child: Stack(
              clipBehavior: Clip.none,
              children: const [
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/dummy-pic.jpg'),
                  ),
                ),
                Positioned(
                  right: 35,
                  bottom: 15,
                  child: CircleAvatar(
                    radius: 5,
                    backgroundColor: Colors.greenAccent,
                  ),
                )
              ],
            ),
          )
        ],
        backgroundColor: Colors.white,
        title: const Image(
          image: AssetImage('assets/logo.png'),
          width: 80,
        ),
      ),
      body: pages.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          elevation: 3,
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          selectedFontSize: 12,
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: true,
          selectedItemColor: Colors.deepOrange,
          unselectedItemColor: Colors.black54,
          unselectedFontSize: 12,
          items: [
            navItem('Projects', Ionicons.list_outline, Ionicons.list),
            navItem('Add-ons', Ionicons.calendar_outline, Ionicons.calendar),
            navItem('Chat', Ionicons.chatbox_outline, Ionicons.chatbox),
            navItem('Feed', Ionicons.newspaper_outline, Ionicons.newspaper),
            navItem('Profile', Ionicons.person_outline, Ionicons.person),
          ]),
    );
  }

  BottomNavigationBarItem navItem(
      String label, IconData iconData, IconData activeIcon) {
    return BottomNavigationBarItem(
        activeIcon: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Icon(activeIcon),
        ),
        icon: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Icon(
            iconData,
          ),
        ),
        label: label);
  }
}
