import 'package:flutter/material.dart';
import 'package:task_list/features/presentation/views/desktop_layout.dart';
import 'package:task_list/features/presentation/views/mobile_layout.dart';
import 'package:task_list/features/presentation/views/widgets/adaptive_layout.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AdaptiveLayout(
          mobileLayout: (context) => const MobileLayout(),
          desktopLayout: (context) => const DesktopLayout()),
    );
  }
}
