import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardTextTheme {
  static TextTheme cardTextTheme = TextTheme(
    bodyText2: GoogleFonts.openSans(
      color: Colors.white,
      fontSize: 13,
      fontWeight: FontWeight
          .bold, //FontWeight.w600, // affects the size of the fonts too
    ),
  );
}

class MapTheme {
  static TextTheme lightTextTheme = TextTheme(
      bodyText1: GoogleFonts.openSans(
        color: Colors.black,
        fontSize: 30,
        fontWeight: FontWeight.w600,
      ),
      bodyText2: GoogleFonts.openSans(
        color: Colors.black,
        fontSize: 12,
        fontWeight: FontWeight.w600, // affects the size of the fonts too
      ),
      subtitle2: GoogleFonts.openSans(
        color: Colors.black54,
        fontSize: 17,
        fontWeight: FontWeight.w600,
      ),
      headline6: GoogleFonts.openSans(
        fontSize: 20,
        color: Colors
            .black54, //Color(0xff008F8F), // dark cyan , can be import for field names in a form
        fontWeight: FontWeight.w600,
      ));

  static ThemeData light() {
    //overriding Theme.light() functions which is default value for Theme
    return ThemeData(
      textTheme: lightTextTheme,
      brightness: Brightness.light,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white, //Color(
        // 0xff4F4047,
        // ),
        foregroundColor: Colors.black,
      ),
      //backgroundColor: Colors.black, //Color(0xffEDE9EB),
      scaffoldBackgroundColor: Colors.white, //Color(0xffEDE9EB),
      cardTheme: CardTheme(
        color: Colors.white, //Color(0xffAF97A6),
      ),
      iconTheme: IconThemeData(
        color: Color(
          0xffE8C9E8,
        ),
      ),
    );
  }

  static const miscellaneousIcons = {
    "favouriteIconTheme": Colors.yellow,
  };
}
