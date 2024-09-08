import 'package:flutter/material.dart';

// Importing different app sections
import 'features/App/presentation/views/screens/home.dart';
import 'features/App/presentation/views/screens/login.dart';
import 'features/App/presentation/views/screens/signup.dart';
import 'features/App/presentation/views/screens/welcome.dart';
import 'features/App/presentation/views/widgets/drawer_widget.dart';

// Importing AI model screens

// Importing core components
import 'core/Components/custom_bottom1.dart';
import 'features/cat_images/presentation/pages/items_api_page.dart';
import 'features/image_classifaction_camera/presentation/pages/camera_screen.dart';
import 'gallery/gallery_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const Welcome(),
        '/HomePage': (context) => const Home(),
        '/LoginForm': (context) => const LoginForm(),
        '/custom-drawer': (context) => const CustomDrawer(),
        '/signup': (context) => const Signup(),
        '/Items1': (context) => const ItemsAPIPage(),
        '/Bottom1': (context) => const Bottom1(),
        '/Gallery': (context) => const GalleryScreen(),
        '/Camera': (context) => const CameraScreen(),
      },
    );
  }
}

