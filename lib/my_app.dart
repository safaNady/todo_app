import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/config/theme/app_theme.dart';
import 'package:todo_app/cores/utils/routes_manager.dart';
import 'package:todo_app/providors/setting_providor.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var myProvider = Provider.of<SettingsProvider>(context);
    return ScreenUtilInit(
      designSize: const Size(412, 870),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
          onGenerateRoute: RoutesManager.router,
          initialRoute: RoutesManager.register,
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: myProvider.currentTheme),
    );
  }
}
