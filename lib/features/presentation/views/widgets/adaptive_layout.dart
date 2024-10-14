import 'package:flutter/material.dart';

class AdaptiveLayout extends StatelessWidget {
  const AdaptiveLayout(
      {super.key, required this.mobileLayout, required this.desktopLayout});

  final WidgetBuilder mobileLayout, desktopLayout;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 800) {
        return mobileLayout(context);
      } else {
        return desktopLayout(context);
      }
    });
  }
}
