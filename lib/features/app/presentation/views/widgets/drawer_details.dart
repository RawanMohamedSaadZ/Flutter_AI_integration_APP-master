import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';

class DrawerDetails extends StatelessWidget {
  const DrawerDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        UserAccountsDrawerHeader(
          accountName: const Text("Rawan Mohamed Saad"),
          accountEmail: const Text("Rawan@gmail.com"),
          currentAccountPicture: CircleAvatar(
            child: ClipOval(
              child: Image.network(
                "https://i.pinimg.com/originals/8a/e0/6c/8ae06c97498f44da0df62e0a660d787b.jpg",
                width: 90,
                height: 90,
                fit: BoxFit.cover,
              ),
            ),
          ),
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                  "https://i.pinimg.com/originals/21/40/fb/2140fbfaa6ff0ead316e684fd14825a4.jpg",
                ),
                fit: BoxFit.cover),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        ListTile(
          leading:  Icon(
            Icons.home,
            size: 30,
            color: Colors.white,
          ),
          title:  Text("Home",
              style: Styles.Style26),
          onTap: () {
            Navigator.pushNamed(context, "/HomePage");
          },
        ),
        ListTile(
          leading:  Icon(Icons.star,size: 30,color: Colors.white,),
          title:  Text("Items",style: Styles.Style26
          ),
          onTap : () {

            Navigator.pushNamed(context,"/Bottom1");
          },
        ),

        ListTile(
          leading: Icon(
            Icons.account_circle_outlined,
            size: 30,
            color: Colors.white,
          ),
          title: Text("Profile",
              style: Styles.Style26),
        ),
        ListTile(
            leading: const Icon(
              Icons.notifications,
              size: 30,
              color: Colors.white,
            ),
            title:  Text("Notification",
                style: Styles.Style26),
            onTap: () {}
        ),
        ListTile(
          leading: const Icon(
            Icons.settings,
            size: 30,
            color: Colors.white,
          ),
          title:  Text("Settings",
              style: Styles.Style26),
          onTap: () {},
        ),
        ListTile(
            leading: const Icon(
              Icons.contact_support,
              size: 30,
              color: Colors.white,
            ),
            title:  Text("Contact us",
                style: Styles.Style26),
            onTap: () {
            }

        ),

        ListTile(
          leading:  Icon(
            Icons.logout,
            size: 30,
            color: Colors.white,
          ),
          title:  Text("logout",
              style: Styles.Style26),
          onTap: () {
            Navigator.pushNamed(context, '/');
          },
        ),
      ],
    );
  }
}
