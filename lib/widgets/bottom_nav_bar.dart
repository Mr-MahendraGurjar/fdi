import 'package:fdis/pages/dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class BottomNavBar extends StatefulWidget {
  final BuildContext menuScreenContext;
  const BottomNavBar({super.key, required this.menuScreenContext});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  late PersistentTabController _controller;
  late bool _hideNavBar;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController();
    _hideNavBar = false;
  }


  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.grey,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      itemAnimationProperties: const ItemAnimationProperties(),
      screenTransitionAnimation: const ScreenTransitionAnimation(),
      navBarStyle: NavBarStyle.style6,
      onItemSelected: (index) {
        switch (index) {
          case 0:
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Item1(),
              ),
            );
            break;
          case 1:
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AnotherClass(),
              ),
            );
            break;
        // Add cases for other items
        }
      }, screens: _buildScreens(),
    );
  }

  List<Widget> _buildScreens() => [
    DashboardPage(
      menuScreenContext: widget.menuScreenContext,
      hideStatus: _hideNavBar,
      onScreenHideButtonPressed: () {
        setState(() {
          _hideNavBar = !_hideNavBar;
        });
      },
    ),
    MainScreen(
      menuScreenContext: widget.menuScreenContext,
      hideStatus: _hideNavBar,
      onScreenHideButtonPressed: () {
        setState(() {
          _hideNavBar = !_hideNavBar;
        });
      },
    ),
    MainScreen(
      menuScreenContext: widget.menuScreenContext,
      hideStatus: _hideNavBar,
      onScreenHideButtonPressed: () {
        setState(() {
          _hideNavBar = !_hideNavBar;
        });
      },
    ),
    MainScreen(
      menuScreenContext: widget.menuScreenContext,
      hideStatus: _hideNavBar,
      onScreenHideButtonPressed: () {
        setState(() {
          _hideNavBar = !_hideNavBar;
        });
      },
    ),
    MainScreen(
      menuScreenContext: widget.menuScreenContext,
      hideStatus: _hideNavBar,
      onScreenHideButtonPressed: () {
        setState(() {
          _hideNavBar = !_hideNavBar;
        });
      },
    ),
  ];

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: "Item 1",
          activeColorPrimary: Colors.blue,
          inactiveColorPrimary: Colors.grey,
          inactiveColorSecondary: Colors.purple
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.search),
        title: "Search",
        activeColorPrimary: Colors.teal,
        inactiveColorPrimary: Colors.grey,
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          initialRoute: "/",
          routes: {
            "/first": (final context) => const MainScreen2(),
            "/second": (final context) => const MainScreen3(),
          },
        ),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.add),
        title: "Add",
        activeColorPrimary: Colors.blueAccent,
        inactiveColorPrimary: Colors.grey,
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          initialRoute: "/",
          routes: {
            "/first": (final context) => const MainScreen2(),
            "/second": (final context) => const MainScreen3(),
          },
        ),
      ),
      // Add items for other classes
    ];
  }
}
