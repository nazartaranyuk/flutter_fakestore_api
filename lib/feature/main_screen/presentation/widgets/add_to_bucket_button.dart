import 'package:fakestore_api/feature/main_screen/presentation/widgets/add_to_bucket_button_state.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/utils/colors.dart';

class AddToBucketButton extends StatefulWidget {
  final AddToBucketInnerState state;
  const AddToBucketButton({super.key, required this.state});

  @override
  State<StatefulWidget> createState() => AddToBucketState();
}

class AddToBucketState extends State<AddToBucketButton> {

  Widget handleState(AddToBucketInnerState state) {
    if (state is BucketInitial) {
      return Text(
        "Add to bucket",
        style: GoogleFonts.poppins(fontWeight: FontWeight.w600, color: ProjectColors.textColorSecondary),
      );
    } else if (state is BucketLoading) {
      return SizedBox(height: 20, width: 20, child: Center(child: CircularProgressIndicator(color: Colors.white, strokeWidth: 3,),));
    } else {
      return Text(
        "In bucket",
        style: GoogleFonts.poppins(fontWeight: FontWeight.w600, color: ProjectColors.textColorSecondary),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          color: widget.state.buttonColor,
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [ handleState(widget.state)],
            ),
          ),
        ),
      ),
    );
  }

}