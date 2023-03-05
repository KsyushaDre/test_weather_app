import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_weather_app/domain/enums/city.dart';
import 'package:test_weather_app/presentation/extensions/context_extension.dart';
import 'package:test_weather_app/presentation/main_screen/main_screen_cubit.dart';
import 'package:test_weather_app/presentation/main_screen/main_screen_state.dart';

class ChooseCity extends StatefulWidget {
  const ChooseCity({super.key});

  @override
  State<ChooseCity> createState() => _ChooseCityState();
}

class _ChooseCityState extends State<ChooseCity> {
  @override
  Widget build(BuildContext context) {
    return BlocSelector<MainScreenCubit, MainScreenState, City?>(
      selector: (state) => state.city,
      builder: (context, city) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            City.values.length,
            (index) => Row(
              children: [
                Radio<City>(
                  value: City.values[index],
                  groupValue: city,
                  onChanged: context.read<MainScreenCubit>().changeCity,
                ),
                Text(
                  City.values[index].name,
                  style: context.option,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
