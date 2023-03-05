import 'package:flutter/material.dart';
import 'package:test_weather_app/presentation/extensions/context_extension.dart';

class AnnotatedDataText extends StatelessWidget {
  final String annotation;
  final String data;

  const AnnotatedDataText({
    super.key,
    required this.annotation,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: annotation,
        style: context.infoAnnotation,
        children: [
          TextSpan(
            text: data,
            style: context.info,
          ),
        ],
      ),
    );
  }
}
