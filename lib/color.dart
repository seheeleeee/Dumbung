import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Color textColor(Case){
  switch(Case){
    case 0 : return Color(int.parse('#FFFFFF'.substring(1, 7), radix: 16) + 0xFF000000);
    case 50 : return Color(int.parse('#F3F4F5'.substring(1, 7), radix: 16) + 0xFF000000);
    case 100 : return Color(int.parse('#EAECF0'.substring(1, 7), radix: 16) + 0xFF000000);
    case 200 : return Color(int.parse('#C8CED8'.substring(1, 7), radix: 16) + 0xFF000000);
    case 300 : return Color(int.parse('#999EA8'.substring(1, 7), radix: 16) + 0xFF000000);
    case 400 : return Color(int.parse('#686C75'.substring(1, 7), radix: 16) + 0xFF000000);
    case 500 : return Color(int.parse('#363A48'.substring(1, 7), radix: 16) + 0xFF000000);
    case 600 : return Color(int.parse('#1F222D'.substring(1, 7), radix: 16) + 0xFF000000);
  }
  return Color(int.parse('#1F222D'.substring(1, 7), radix: 16) + 0xFF000000);
}




Color bubbleBGColor(Case){
  switch (Case) {
    case 0: return Color(int.parse('#DDE3EE'.substring(1, 7), radix: 16) + 0xFF000000);
    case 1: return Color(int.parse('#EDE7D9'.substring(1, 7), radix: 16) + 0xFF000000);
    case 2 : return Color(int.parse('#FFDEC6'.substring(1, 7), radix: 16) + 0xFF000000);'FFDEC6';
    case 3 : return Color(int.parse('#FEAAC6'.substring(1, 7), radix: 16) + 0xFF000000);
    case 4 : return Color(int.parse('#D04466'.substring(1, 7), radix: 16) + 0xFF000000);
    case 5 : return Color(int.parse('#C0AAFE'.substring(1, 7), radix: 16) + 0xFF000000);
    case 6 : return Color(int.parse('#7ECBE9'.substring(1, 7), radix: 16) + 0xFF000000);
    case 7 : return Color(int.parse('#57B569'.substring(1, 7), radix: 16) + 0xFF000000);
    case 8 : return Color(int.parse('#2B7DDD'.substring(1, 7), radix: 16) + 0xFF000000);
    case 9 : return Color(int.parse('#5D3391'.substring(1, 7), radix: 16) + 0xFF000000);
  }
  return Color(int.parse('#DDE3EE'.substring(1, 7), radix: 16) + 0xFF000000);
}


Color bubbleTextColor(Case){
  switch (Case) {
    case 0: return Color(int.parse('#495874'.substring(1, 7), radix: 16) + 0xFF000000);
    case 1: return Color(int.parse('#69614D'.substring(1, 7), radix: 16) + 0xFF000000);
    case 2 : return Color(int.parse('#D94646'.substring(1, 7), radix: 16) + 0xFF000000);'FFDEC6';
    case 3 : return Color(int.parse('#BE3564'.substring(1, 7), radix: 16) + 0xFF000000);
    case 4 : return Color(int.parse('#FEF868'.substring(1, 7), radix: 16) + 0xFF000000);
    case 5 : return Color(int.parse('#6C46D9'.substring(1, 7), radix: 16) + 0xFF000000);
    case 6 : return Color(int.parse('#DF4402'.substring(1, 7), radix: 16) + 0xFF000000);
    case 7 : return Color(int.parse('#055A15'.substring(1, 7), radix: 16) + 0xFF000000);
    case 8 : return Color(int.parse('#90FC9D'.substring(1, 7), radix: 16) + 0xFF000000);
    case 9 : return Color(int.parse('#DAFA7E'.substring(1, 7), radix: 16) + 0xFF000000);
  }
  return Color(int.parse('#DDE3EE'.substring(1, 7), radix: 16) + 0xFF000000);
}


