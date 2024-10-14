import 'package:flutter/material.dart';
import 'package:task_list/utils/app_styles.dart';
import 'package:task_list/features/presentation/views/mobile_layout.dart';
import 'package:task_list/features/presentation/views/widgets/adaptive_layout.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AdaptiveLayout(
          mobileLayout: (context) => MobileLayout(),
          desktopLayout: (context) => Center(child: Text('Desktop'))),
    );
  }
}
