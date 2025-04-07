import 'package:fakestore_api/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: ProjectColors.bgSearch,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Row(
          children: [
            const SizedBox(width: 10),
            SvgPicture.asset("assets/search_icon.svg", color: Colors.black),
            const SizedBox(width: 10),
            Text(
              "Search something...",
              style: GoogleFonts.roboto(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
