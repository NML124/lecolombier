import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

///COLORS
const Color appbarGreyColor = Color.fromRGBO(224, 225, 221, 1);
const Color black = Colors.black;
const Color white = Colors.white;
const Color grey = Color(0XFFF3F3F3);
const Color greyDark = Color(0XFFAFAFAF);
const Color primary = Color(0XFFF19200);
const Color primaryLight = Color(0XFFE3A840);
const Color blue = Color(0XFF00BCFF);
const Color blueDark = Color(0XFF2F88FF);

const Color red = Color(0XFFFF0400);
const Color yellow = Color(0XFFF9D400);
const Color green = Color(0XFF47AF58);

/// FONTS SIZE
const textSizeSmall = 6.0;
const textSizeSMedium = 8.0;
const textSizeMedium = 11.0;
const textSizeLargeMedium = 14.0;
const textSizeNormal = 18.0;
const textSizeLarge = 24.0;
const textSizeXLarge = 31.0;
const textSizeXXLarge = 41.0;
const textSizeXXXLarge = 53.0;

///DateTime
DateFormat dateFormatMonthAndYear = DateFormat('MMMM yyyy', "fr");
DateFormat dateFormatDateAndHour = DateFormat('d MMMM yyyy à H:mm', "fr");
DateFormat dateFormatDay = DateFormat('E', 'fr');

///PADDING
const paddingSmall = 2.0;
const paddingSMedium = 8.0;
const paddingMedium = 11.0;
const paddingLargeMedium = 14.0;
const paddingNormal = 18.0;
const paddingLarge = 24.0;
const paddingXLarge = 31.0;
const paddingXXLarge = 41.0;
const paddingXXXLarge = 53.0;

/// Border radius
const double borderRadius = 15;

///Assets path
const String logoColorPath = "assets/images/logo_icam_color.png";
const String logoWhitePath = "assets/images/logo_icam_white.png";
const String dashboardBlobPath = "assets/images/dashboard_blob.png";
const String fanPath = "assets/svg/fan.svg";
const String thermometerPath = "assets/svg/thermometer.svg";
const String dropWaterPath = "assets/svg/drop_water.svg";
const String lightPath = "assets/svg/light.svg";
const String waterTankPath = "assets/svg/tank.svg";
const String birdHousePath = "assets/svg/house_bird.svg";
const String birdInBirdHousePath = "assets/svg/bird.svg";
const String recordPath = "assets/svg/record.svg";
