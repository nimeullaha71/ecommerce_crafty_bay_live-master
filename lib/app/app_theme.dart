import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static ThemeData get lightThemeData{
    return ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: AppColors.getMaterialColor(AppColors.themeColor),
        ),
      textTheme: _textTheme,
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: EdgeInsets.symmetric(horizontal: 16,vertical: 0),
        border: _getInputBorder(AppColors.themeColor),
        enabledBorder:_getInputBorder(AppColors.themeColor),
        focusedBorder: _getInputBorder(AppColors.themeColor),
        errorBorder: _getInputBorder(Colors.red),

        hintStyle: TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.w400
        )
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            fixedSize: Size.fromWidth(double.maxFinite),
            backgroundColor: AppColors.themeColor,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            padding: EdgeInsets.symmetric(vertical: 12),
            textStyle: TextStyle(
              fontSize: 16,
              letterSpacing: 0.4,
              fontWeight: FontWeight.w500,
            )
        ),
      ),
      appBarTheme: AppBarTheme(titleTextStyle:TextStyle(fontSize: 20,color: Colors.black87))
    );
  }

  static OutlineInputBorder _getInputBorder(Color color){
    return OutlineInputBorder(
      borderSide: BorderSide(color: color,width: 1.5),
    );
  }


  static TextTheme get _textTheme{
    return TextTheme(
      titleLarge: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 28,
          letterSpacing: 2,
      ),
      titleMedium: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 24,
        letterSpacing: 2,
      ),
      titleSmall: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 22,
        letterSpacing: 2,
      ),
      headlineMedium: TextStyle(fontSize: 16, color: Colors.grey),
    );
  }

}
