// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:task_list/core/utils/app_constants.dart';
import 'package:task_list/core/utils/app_styles.dart';
import 'package:task_list/features/presentation/views/widgets/custom_container.dart';
import 'package:task_list/features/presentation/views/widgets/custom_header.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MobileLayout extends StatefulWidget {
  const MobileLayout({super.key});

  @override
  State<MobileLayout> createState() => _MobileLayoutState();
}

class _MobileLayoutState extends State<MobileLayout> {
  final List<String> texts = [
    "All",
    "Not Done",
    "Done",
  ];
  int selected = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 4),
              child: CustomHeader(),
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              children: List.generate(
                  texts.length,
                  (index) => GestureDetector(
                      onTap: () {
                        setState(() {
                          selected = index;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 6),
                        child: CustomContainer(
                          text: texts[index],
                          isSelected: selected == index,
                        ),
                      ))),
            ),
            SizedBox(
              height: 10,
            ),
            CustomListViewItem()
          ],
        ),
      ),
    );
  }
}

class CustomListViewItem extends StatelessWidget {
  const CustomListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        title: Text(
          "Build UI Android",
          style: AppStyles.stylesInterBold15,
          textAlign: TextAlign.left,
        ),
        subtitle: Text(
          "Due Date: Mon. 21/3/2024",
          style: AppStyles.stylesInterRegular12,
          textAlign: TextAlign.left,
        ),
        trailing: SvgPicture.asset(AppConstants.checkMarkPic),
      ),
    );
  }
}
