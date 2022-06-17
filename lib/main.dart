import 'package:flutter/material.dart';
import 'package:iboss_flutter/utils/routes_generater.dart';
import 'package:iboss_flutter/utils/user_simple_preferences.dart';
import 'package:iboss_flutter/widgets/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserSimplePreferences.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTeme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: RouteGenerater.generateRoute,
    );
  }
}
