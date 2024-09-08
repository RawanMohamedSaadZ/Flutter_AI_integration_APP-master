import 'package:flutter/material.dart';
import '../widgets/drawer_widget.dart';
import 'home_view_body.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff6E2D8C),
        title: const Text("Image Classifaction",style:  TextStyle(fontWeight:FontWeight.bold,color: Colors.white ,fontSize: 26) ),
        // leading: IconButton(onPressed: (){}, icon: Icon(Icons.menu),style: ButtonStyle(iconSize:MaterialStateProperty.all(100)),)  ,
        iconTheme: const IconThemeData(color: Colors.white ,size: 42) ,
        centerTitle: true,
      ),
      drawer: const CustomDrawer (),
      body: home_view_body(),
    );
  }
}

