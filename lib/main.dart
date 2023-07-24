import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:white_mastery/view/homeScreen/homescreen.dart';
import 'package:permission_handler/permission_handler.dart';

void main()async {

   WidgetsFlutterBinding.ensureInitialized();


 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      minTextAdapt: true,
      builder: (context, child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            appBarTheme: AppBarTheme(color: Colors.black)
          ),
          home: HomeScreen()),
    );
  }
}
