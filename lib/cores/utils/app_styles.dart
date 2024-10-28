import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/cores/utils/colors_manager.dart';

class LightAppStyle {
  static TextStyle appBar = GoogleFonts.poppins(
      fontSize: 22, fontWeight: FontWeight.w700, color: ColorsManager.white);
  static TextStyle settingsTabLabel = GoogleFonts.poppins(
      fontSize: 14, fontWeight: FontWeight.w700, color: ColorsManager.black);
  static TextStyle selectedItemLabel = GoogleFonts.inter(
      fontSize: 14, fontWeight: FontWeight.w400, color: ColorsManager.blue);
}
