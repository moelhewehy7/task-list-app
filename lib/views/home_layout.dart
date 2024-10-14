import 'package:flutter/material.dart';
import 'package:task_list/utils/app_styles.dart';
import 'package:task_list/widgets/adaptive_layout.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Good Morning",
          style: AppStyles.stylesInterMedium30,
          textAlign: TextAlign.left,
        ),
      ),
      body: AdaptiveLayout(
          mobileLayout: (context) => Center(
                  child: Text(
                'Mobile',
                style: TextStyle(fontFamily: "inter"),
              )),
          desktopLayout: (context) => Center(child: Text('Desktop'))),
    );
  }
}
