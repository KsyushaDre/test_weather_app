import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_weather_app/app_theme/app_theme.dart';
import 'package:test_weather_app/di/injector.dart';
import 'package:test_weather_app/presentation/main_screen/main_screen.dart';
import 'package:test_weather_app/presentation/main_screen/main_screen_cubit.dart';

void main() async {
  await Injector.setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: BlocProvider<MainScreenCubit>(
        create: (BuildContext context) => Injector.resolve(),
        child: const SafeArea(
          child: MainScreen(),
        ),
      ),
    );
  }
}
