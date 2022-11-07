import 'package:flutter/material.dart';

import 'fontManager.dart';

TextStyle _getTextStyle(double fontSize,String fontFamily,Color color,FontWeight fontWeight){
  return TextStyle(fontSize: fontSize,fontFamily: fontFamily,color: color,fontWeight: fontWeight);
}

//Regular font

TextStyle getRegularTextStyle({double fontSize = FontSize.s12,required Color color}){

  return _getTextStyle(fontSize, FontConstant.fontFamily, color,FontWightManager.regular);

}

//Medium font

TextStyle getMediumTextStyle({double fontSize = FontSize.s12,required Color color}){

  return _getTextStyle(fontSize, FontConstant.fontFamily, color,FontWightManager.medium);

}
//SemiBold font

TextStyle getSemiBoldTextStyle({double fontSize = FontSize.s12,required Color color}){

  return _getTextStyle(fontSize, FontConstant.fontFamily, color,FontWightManager.semiBold);

}
//Bold font

TextStyle getBoldTextStyle({double fontSize = FontSize.s12,required Color color}){

  return _getTextStyle(fontSize, FontConstant.fontFamily, color,FontWightManager.bold);

}
//Light font

TextStyle getLightTextStyle({double fontSize = FontSize.s12,required Color color}){

  return _getTextStyle(fontSize, FontConstant.fontFamily, color,FontWightManager.light);

}