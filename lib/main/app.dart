import 'package:cinemax/features/auth/login/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    // context.read<MedicineCubit>().loadMedicines();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,

      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,

          title: 'Medicine Reminder',

          theme: ThemeData(scaffoldBackgroundColor: Color(0xFF1F1D2B)),

          home: LoginScreen(),
        );
      },
    );
  }
}
