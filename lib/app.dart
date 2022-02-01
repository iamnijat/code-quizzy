import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'domain/services/navigation/index.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        navigatorKey: NavigationService.navigationKey,
        debugShowCheckedModeBanner: false,
        title: 'Programming Quiz',
        useInheritedMediaQuery: true,
        initialRoute: NavigationRoutes.splash,
        onGenerateRoute: generateRoute,
      );
    });
  }
}
