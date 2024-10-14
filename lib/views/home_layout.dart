import 'package:flutter/material.dart';
import 'package:task_list/widgets/adaptive_layout.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: AdaptiveLayout(
          mobileLayout: (context) => Center(child: Text('Mobile')),
          desktopLayout: (context) => Center(child: Text('Desktop'))),
    );
  }
}
