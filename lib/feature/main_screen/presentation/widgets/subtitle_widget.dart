import 'package:fakestore_api/core/utils/base_text.dart';
import 'package:fakestore_api/core/utils/colors.dart';
import 'package:flutter/material.dart';

class SubtitleWidget extends StatelessWidget {
  const SubtitleWidget({super.key, required this.subtitle});

  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 30,
          width: 15,
          decoration: BoxDecoration(color: ProjectColors.buttonColor, borderRadius: BorderRadius.all(Radius.circular(4))),
        ),
        SizedBox(width: 5,),
        BaseText(text: subtitle, fontWeight: FontWeight.w600, color: ProjectColors.buttonColor, fontSize: 16,)
      ],
    );
  }
}
