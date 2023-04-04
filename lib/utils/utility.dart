import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'color_constants.dart';

class Utility {

  static void snackBar(String msg, BuildContext context) {
    var snackBar = SnackBar(
      content: Text(msg,style: const TextStyle(color: ColorConstants.white),),
      backgroundColor: ColorConstants.appColor,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static String dateConverter(String date) {
    // Input date Format
    final format = DateFormat("yyyy-MM-dd");
    DateTime gettingDate = format.parse(date);
    final DateFormat formatter = DateFormat('dd-MM-yyyy');
    // Output Date Format
    final String formatted = formatter.format(gettingDate);
    return formatted;
  }

  static bool checkIfSequenceIsPrime(int sequenceNo){
    bool isPrime = true;
    for(int index = 2; index <= (sequenceNo / 2); ++index ){
      if(sequenceNo % index == 0){
        return isPrime = false;
      }
    }
    return isPrime;
  }
}
