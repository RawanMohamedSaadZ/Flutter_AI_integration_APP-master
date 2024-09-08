import 'package:flutter/material.dart';

import 'drawer_details.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight:  Radius.circular(80),
            bottomRight:  Radius.circular(80),
          ),
        ),
        backgroundColor: const Color(0xff653E91),
        child: DrawerDetails());
  }
}

