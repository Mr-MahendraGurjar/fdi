import 'package:fdis/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key, required BuildContext menuScreenContext, required bool hideStatus, required Null Function() onScreenHideButtonPressed}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {

  final bool showBottomNav = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: widget.showBottomNav
          ? BottomNavBar(
        selectedIndex: _selectedIndex,
        onTabSelected: _onTabSelected,
      )
          : null,
    );
  }
}
