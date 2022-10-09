import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:product_app/views/products/view.dart';
import 'core/cache_helper.dart';
import 'core/helper_methods.dart';
import 'views/home/view.dart';
import 'views/login/view.dart';
import 'views/my_map/view.dart';
import 'views/register/view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorKey,
        title: 'Products App',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: child,
      ),
      child:  HomeScreen(),
    );
  }
}
