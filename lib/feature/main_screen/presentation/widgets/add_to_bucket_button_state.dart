import 'package:flutter/material.dart';

sealed class AddToBucketInnerState {
  final Color buttonColor = Colors.black;
}

class BucketLoading extends AddToBucketInnerState{

  @override
  Color get buttonColor => Colors.black;
}
class BucketSuccess extends AddToBucketInnerState {

  @override
  Color get buttonColor => Colors.black;
}
class BucketInitial extends AddToBucketInnerState {

  @override
  Color get buttonColor => Colors.black;
}