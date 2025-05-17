import 'package:elevate_tech_assessment/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyles {
  static TextStyle textColor14W400=GoogleFonts.poppins(
    fontSize: 14,
    color: AppColors.textColor,
    fontWeight: FontWeight.w400
  );
  static TextStyle textColor12W400=GoogleFonts.poppins(
      fontSize: 12,
      color: AppColors.textColor,
      fontWeight: FontWeight.w400
  );
  static TextStyle priceColor11W400=GoogleFonts.poppins(
      fontSize: 11,
      color: AppColors.priceColor,
      fontWeight: FontWeight.w400
  );
}