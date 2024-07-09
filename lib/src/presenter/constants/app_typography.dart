import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

mixin AppTypography {
  final _light = GoogleFonts.ptSans(
    fontWeight: FontWeight.w300,
    color: AppColors.white,
  );
  final _medium = GoogleFonts.ptSans(
    fontWeight: FontWeight.w500,
    color: AppColors.white,
  );
  final _bold = GoogleFonts.ptSans(
    fontWeight: FontWeight.bold,
    color: AppColors.white,
  );

  TextStyle get lightCaption1 => _light.copyWith(fontSize: 12);
  TextStyle get lightCaption2 => _light.copyWith(fontSize: 10);
  TextStyle get lightLabel3 => _light.copyWith(fontSize: 14);
  TextStyle get lightLabel2 => _light.copyWith(fontSize: 16);
  TextStyle get lightLabel1 => _light.copyWith(fontSize: 18);
  TextStyle get lightHeader1 => _light.copyWith(fontSize: 32);

  TextStyle get mediumCaption1 => _medium.copyWith(fontSize: 12);
  TextStyle get mediumCaption2 => _medium.copyWith(fontSize: 10);
  TextStyle get mediumLabel3 => _medium.copyWith(fontSize: 14);
  TextStyle get mediumLabel2 => _medium.copyWith(fontSize: 16);
  TextStyle get mediumLabel1 => _medium.copyWith(fontSize: 18);
  TextStyle get mediumHeader1 => _medium.copyWith(fontSize: 32);

  TextStyle get boldCaption1 => _bold.copyWith(fontSize: 12);
  TextStyle get boldCaption2 => _bold.copyWith(fontSize: 10);
  TextStyle get boldLabel3 => _bold.copyWith(fontSize: 14);
  TextStyle get boldLabel2 => _bold.copyWith(fontSize: 16);
  TextStyle get boldLabel1 => _bold.copyWith(fontSize: 18);
  TextStyle get boldHeader1 => _bold.copyWith(fontSize: 32);
}
