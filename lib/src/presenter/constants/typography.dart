import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

sealed class Typography {
  final light = GoogleFonts.ptSans(fontWeight: FontWeight.w300);
  final medium = GoogleFonts.ptSans(fontWeight: FontWeight.w500);
  final bold = GoogleFonts.ptSans(fontWeight: FontWeight.bold);

  TextStyle get lightCaption1 => light.copyWith(fontSize: 12);
  TextStyle get lightCaption2 => light.copyWith(fontSize: 10);
  TextStyle get lightLabel3 => light.copyWith(fontSize: 14);
  TextStyle get lightLabel2 => light.copyWith(fontSize: 16);
  TextStyle get lightLabel1 => light.copyWith(fontSize: 18);
  TextStyle get lightHeader1 => light.copyWith(fontSize: 32);

  TextStyle get mediumCaption1 => medium.copyWith(fontSize: 12);
  TextStyle get mediumCaption2 => medium.copyWith(fontSize: 10);
  TextStyle get mediumLabel3 => medium.copyWith(fontSize: 14);
  TextStyle get mediumLabel2 => medium.copyWith(fontSize: 16);
  TextStyle get mediumLabel1 => medium.copyWith(fontSize: 18);
  TextStyle get mediumHeader1 => medium.copyWith(fontSize: 32);

  TextStyle get boldCaption1 => medium.copyWith(fontSize: 12);
  TextStyle get boldCaption2 => medium.copyWith(fontSize: 10);
  TextStyle get boldLabel3 => medium.copyWith(fontSize: 14);
  TextStyle get boldLabel2 => medium.copyWith(fontSize: 16);
  TextStyle get boldLabel1 => medium.copyWith(fontSize: 18);
  TextStyle get boldHeader1 => medium.copyWith(fontSize: 32);
}
