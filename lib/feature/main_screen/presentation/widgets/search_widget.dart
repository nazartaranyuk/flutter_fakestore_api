import 'package:fakestore_api/core/utils/colors.dart';
import 'package:fakestore_api/feature/main_screen/presentation/widgets/cart_small_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key, required this.onSearchClicked, required this.bucketCount, required this.onBucketClicked});
  final VoidCallback onSearchClicked;
  final VoidCallback onBucketClicked;
  final int bucketCount;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 8, right: 8, bottom: 5),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SearchField(onSearchClicked: onSearchClicked),
          SizedBox(width: 16),
          SvgPicture.asset("assets/wishlist_icon.svg", width: 35, height: 35),
          SizedBox(width: 16),
          CartIconWithBadge(itemCount: bucketCount, onBucketClicked: onBucketClicked,),
          SizedBox(width: 16),
          SvgPicture.asset("assets/user_icon.svg", width: 35, height: 35),
        ],
      ),
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({super.key, required this.onSearchClicked});
  final VoidCallback onSearchClicked;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onSearchClicked,
        child: Container(
          height: 40,
          decoration: BoxDecoration(
            color: ProjectColors.bgSearch,
            borderRadius: BorderRadius.all(Radius.circular(4)),
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
                Expanded(
                  child: Text(
                    "What are you looking for...",
                    style: GoogleFonts.poppins(color: Colors.black, fontSize: 14),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
