import 'package:flutter/material.dart';

MaterialStateProperty<OutlinedBorder> shapeOfButtonRounded =
    MaterialStateProperty.all<RoundedRectangleBorder>(
  RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(12.0),
  ),
);