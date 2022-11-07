import 'dart:ui';

class ColorManager{
  static Color primary = HexColor.fromHex("#0061af");
  static Color darkGray = HexColor.fromHex("#525252");
  static Color gray = HexColor.fromHex("#737477");
  static Color lightGray = HexColor.fromHex("#9E9E9E");
  static Color primaryWithOpacity = HexColor.fromHex("#B3ED9728");

  // new colors
  static Color darkPrimary = HexColor.fromHex("#d17d11");
  static Color grey1 = HexColor.fromHex("#707070");
  static Color grey2 = HexColor.fromHex("#797979");
  static Color white = HexColor.fromHex("#FFFFFF");
  static Color error = HexColor.fromHex("#e61f34"); // red color
  static Color black = HexColor.fromHex("#000000");
  static Color green = HexColor.fromHex("#a6ce39");
  static Color red = HexColor.fromHex("#FF0000");
}
extension HexColor on Color{
  static Color fromHex(String hexColorString){
    hexColorString = hexColorString.replaceAll('#', '');
    if(hexColorString.length == 6){
      hexColorString = "FF"+hexColorString;
    }
    return Color(int.parse(hexColorString,radix: 16));
  }

}