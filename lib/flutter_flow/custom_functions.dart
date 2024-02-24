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

bool isValidPhoneNumber(String phoneNumber) {
  // Remove any whitespace or special characters from the phone number
  phoneNumber = phoneNumber.replaceAll(RegExp(r'[^\d]'), '');

  // Check if the phone number starts with +962, 00962, 07, or 7
  if (phoneNumber.startsWith('+962') ||
      phoneNumber.startsWith('00962') ||
      phoneNumber.startsWith('07') ||
      phoneNumber.startsWith('7')) {
    // Check if the rest of the number has a length of 8
    if (phoneNumber.substring(3).length == 8) {
      // Check if the first digit of the remaining number is 7, 9, 8, or 5
      String firstDigit = phoneNumber.substring(3, 4);
      if (['7', '9', '8', '5'].contains(firstDigit)) {
        return true;
      }
    }
  }
  return false;
}
