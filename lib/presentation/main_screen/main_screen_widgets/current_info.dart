import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_weather_app/presentation/extensions/context_extension.dart';
import 'package:test_weather_app/presentation/main_screen/main_screen_cubit.dart';
import 'package:test_weather_app/presentation/main_screen/main_screen_state.dart';
import 'package:test_weather_app/presentation/main_screen/main_screen_widgets/current_info_card.dart';

class CurrentInfo extends StatelessWidget {
  const CurrentInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BlocSelector<MainScreenCubit, MainScreenState, String?>(
            selector: (state) => state.currentWeatherData?.locationName,
            builder: (context, locationName) {
              if (locationName != null) {
                return FittedBox(
                  child: Text(
                    locationName,
                    style: context.currentLocationName,
                  ),
                );
              }
              return const SizedBox();
            }),
        const CurrentInfoCard(),
      ],
    );
  }
}
