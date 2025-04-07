import 'package:fakestore_api/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SubtitleWidget extends StatelessWidget {
  const SubtitleWidget({super.key, required this.subtitle});

  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 30,
          width: 10,
          decoration: BoxDecoration(color: ProjectColors.buttonColor, borderRadius: BorderRadius.all(Radius.circular(4))),
        ),
        SizedBox(width: 5,),
        Text(
            subtitle,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              color: ProjectColors.buttonColor,
              fontSize: 16
            ),
        ),
      ],
    );
  }
}
