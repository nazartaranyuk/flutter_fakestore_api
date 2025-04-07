import 'package:fakestore_api/colors.dart';
import 'package:fakestore_api/feature/main_screen/presentation/widgets/cart_small_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key, required this.onSearchClicked});
  final VoidCallback onSearchClicked;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 8, right: 8, top: 20),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: onSearchClicked,
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color: ProjectColors.bgSearch,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SvgPicture.asset(
                        "assets/search_icon.svg",
                        color: Colors.black,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        "What are you looking for...",
                        style: GoogleFonts.poppins(color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          SizedBox(width: 16),
          SvgPicture.asset("assets/wishlist_icon.svg", width: 35, height: 35),
          SizedBox(width: 16),
          CartIconWithBadge(itemCount: 2),
          SizedBox(width: 16),
          SvgPicture.asset("assets/user_icon.svg", width: 35, height: 35),
        ],
      ),
    );
  }
}
