import 'package:cinemax/features/onBoarding/controller/on_boarding_cubit.dart';
import 'package:cinemax/firebase_options.dart';
import 'package:cinemax/main/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiBlocProvider(
      providers: [BlocProvider(create: (_) => OnBoardingCubit())],

      child: const MyApp(),
    ),
  );
}
