import 'package:flutter/material.dart';

import 'res_table.dart';

var global = ThemeData(
  fontFamily: 'Tajawal',
  primaryColor: ResTable.primary,
  textTheme: TextTheme(
    headline1: TextStyle(
      fontSize: 28,
      color: ResTable.primary,
      fontWeight: FontWeight.bold,
    ),
    headline2: TextStyle(
      fontWeight: FontWeight.bold,
      color: ResTable.light,
      letterSpacing: 1.25,
      fontSize: 24,
    ),
    headline3: TextStyle(
      fontSize: 24,
      color: ResTable.secondry,
    ),
    headline4: const TextStyle(
      fontSize: 20,
    ),
    headline5: const TextStyle(
      fontSize: 16,
    ),
    headline6: const TextStyle(
      fontSize: 12,
    ),
    bodyText1: const TextStyle(
      fontSize: 10,
    ),
    bodyText2: const TextStyle(
      fontSize: 8,
    ),
  ),
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: ResTable.secondry,
  ),
  textSelectionTheme: TextSelectionThemeData(
    selectionColor: ResTable.primary,
    cursorColor: ResTable.primary,
    selectionHandleColor: ResTable.secondry,
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: UnderlineInputBorder(
      borderSide: BorderSide(
        color: ResTable.primary,
      ),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: ResTable.primary,
      ),
    ),
    focusColor: ResTable.primary,
  ),
  iconTheme: IconThemeData(
    color: ResTable.primary,
    opacity: 1,
  ),
  appBarTheme: AppBarTheme(
    titleTextStyle: TextStyle(
      color: ResTable.primary,
      fontSize: 24,
    ),
    actionsIconTheme: IconThemeData(
      color: ResTable.primary,
    ),
    iconTheme: IconThemeData(
      color: ResTable.primary,
    ),
  ),
);

var lightTheme = global.copyWith(
  appBarTheme: global.appBarTheme.copyWith(
    color: ResTable.primaryLight,
  ),
  textTheme: global.textTheme.copyWith(
    headline1: global.textTheme.headline1!.copyWith(),
    headline2: global.textTheme.headline2!.copyWith(),
    headline3: global.textTheme.headline3!.copyWith(
      color: ResTable.dark,
    ),
    headline4: global.textTheme.headline4!.copyWith(
      color: ResTable.dark,
    ),
    headline5: global.textTheme.headline5!.copyWith(
      color: ResTable.dark,
    ),
    headline6: global.textTheme.headline6!.copyWith(
      color: ResTable.dark,
    ),
    bodyText1: global.textTheme.bodyText1!.copyWith(
      color: ResTable.dark,
    ),
    bodyText2: global.textTheme.bodyText2!.copyWith(
      color: ResTable.dark,
    ),
  ),
  primaryColorLight: ResTable.secondryLight,
  primaryColorDark: ResTable.primaryLight,
  brightness: Brightness.light,
  backgroundColor: ResTable.light,
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      textStyle: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.hovered)) {
            return darkTheme.textTheme.headline4!.copyWith(
              fontSize: 18,
            );
          }
          return lightTheme.textTheme.headline5;
        },
      ),
      backgroundColor: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.hovered)) {
            return ResTable.primary.withOpacity(0.2);
          }
          return ResTable.secondryLight.withOpacity(0.25);
        },
      ),
    ),
  ),
);

var darkTheme = global.copyWith(
  appBarTheme: global.appBarTheme.copyWith(
    color: ResTable.primaryDark,
  ),
  textTheme: global.textTheme.copyWith(
    headline1: global.textTheme.headline1!.copyWith(
      color: ResTable.light,
    ),
    headline2: global.textTheme.headline2!.copyWith(
      color: ResTable.light,
    ),
    headline3: global.textTheme.headline3!.copyWith(
      color: ResTable.light,
    ),
    headline4: global.textTheme.headline4!.copyWith(
      color: ResTable.light,
    ),
    headline5: global.textTheme.headline5!.copyWith(
      color: ResTable.light,
    ),
    headline6: global.textTheme.headline6!.copyWith(
      color: ResTable.light,
    ),
    bodyText1: global.textTheme.bodyText1!.copyWith(
      color: ResTable.light,
    ),
    bodyText2: global.textTheme.bodyText2!.copyWith(
      color: ResTable.light,
    ),
  ),
  primaryColorLight: ResTable.seconderyDark,
  primaryColorDark: ResTable.primaryDark,
  brightness: Brightness.dark,
  backgroundColor: ResTable.dark,
);
