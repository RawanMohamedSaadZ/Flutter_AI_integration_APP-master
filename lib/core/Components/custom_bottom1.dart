import 'package:flutter/material.dart';
import '../../features/App/presentation/views/screens/home.dart';
import '../../features/cat_images/presentation/pages/items_api_page.dart';
import '../../features/detector/detector_screen.dart';


class Bottom1 extends StatefulWidget {
  const Bottom1({super.key});

  @override
  Bottom1State createState() => Bottom1State();
}
class Bottom1State extends State<Bottom1> {


  int _currentindex = 0 ;

  final List<Widget> _screens =[
    const ItemsAPIPage(),
    const DetectorPage(),
    const Home(),
  ];


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: _screens[_currentindex],


      bottomNavigationBar: BottomNavigationBar(

        unselectedItemColor: Colors.white,

        unselectedIconTheme: const IconThemeData(color: Colors.white),
        iconSize: 35,
        selectedItemColor: Colors.black,
        backgroundColor: _currentindex == 2 ? const Color(0xff6E2D8C) :const Color(0xff7E4DB5) ,

        currentIndex: _currentindex,
        onTap: (index){
          setState(() {
            _currentindex = index;
          });
        },

        items: const [
          BottomNavigationBarItem(
            icon:  Icon(Icons.shop,),
            label: 'Category',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            label: 'Camera',
          ),
          BottomNavigationBarItem(

            icon: Icon(Icons.home),
            label: 'Home',
          ),
        ],
      ),
    );
  }
}

