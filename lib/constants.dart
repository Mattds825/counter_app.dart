import 'dart:ui';

import 'package:flutter_neumorphic/flutter_neumorphic.dart';

const kColor1 = Color(0xff262626);
const kColor2 = Color(0xff434343);
const kColor3 = Color(0xff555555);
const kColor4 = Color(0xff7b7b7b);
const kColor5 = Color(0xff9d9d9d);
const kColor6 = Color(0xffc4c4c4);

const klColor1 = Color(0xffcfd8dc);
const klColor2 = Color(0xffb0bec5);
const klColor3 = Color(0xff90a4ae);
const klColor4 = Color(0xff78909c);
const klColor5 = Color(0xff607d8b);
const klColor6 = Color(0xff546e7a);

NeumorphicStyle getStye(ColorMode mode) {
  switch (mode) {
    case ColorMode.black:
      return kNeumorphicStyle1;
      break;
    case ColorMode.white:
      return kNeumorphicStyle2;
      break;
    case ColorMode.green:
      // TODO: Handle this case.
      break;
  }
}

const kNeumorphicStyle1 = NeumorphicStyle(
  shadowDarkColor: Colors.black,
  shadowLightColor: Colors.white54,
  shadowDarkColorEmboss: kColor2,
  shadowLightColorEmboss: kColor4,
  depth: 2,
  color: kColor2,
);

const kNeumorphicStyle2 = NeumorphicStyle(
  shadowDarkColor: Colors.black,
  shadowLightColor: Colors.white54,
  shadowDarkColorEmboss: klColor2,
  shadowLightColorEmboss: klColor4,
  depth: 2,
  color: klColor2,
);

enum ColorMode {
  black,
  white,
  green,
}
