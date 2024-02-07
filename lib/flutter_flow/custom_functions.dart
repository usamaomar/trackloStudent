import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';

String parseErrorMsg(String action) {
  return action;
}

String convertPhoneNumber(String phoneNumber) {
  // Remove leading zeros
  phoneNumber = phoneNumber.replaceAll(RegExp('^0+'), '');

  // Add country code if not present
  if (!phoneNumber.startsWith('+')) {
    phoneNumber =
        '+962' + phoneNumber; // Change '962' to your desired country code
  }

  return phoneNumber;
}
