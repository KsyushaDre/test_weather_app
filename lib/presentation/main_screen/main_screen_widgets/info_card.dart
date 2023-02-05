import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final Color backgroundColor;
  final Widget child;

  const InfoCard({
    super.key,
    required this.backgroundColor,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: FittedBox(child: child),
    );
  }
}
