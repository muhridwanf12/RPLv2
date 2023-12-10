//function hitung z score BB/TB
//RUMUS MENGHITUNG Z SCORE BB/TB
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tubes/home/home_data.dart';

hitungBBTB(String gender, double bb, double tb, int usia, String edema) {
  if ((edema == "Ya") | (bb == 0) | (tb == 0) | (usia > 60)) {
    return null;
  } else {
    //bulatkan tb menjadi x.0 atau x.5
    if (tb - tb.floor() < 0.25) {
      tb = tb.floor().toDouble();
    } else if ((tb - tb.floor() >= 0.25) && (tb - tb.floor() < 0.75)) {
      tb = tb.floor().toDouble() + 0.5;
    } else {
      tb = (tb.floor() + 1).toDouble();
    }
    //jika usia 0-24 bulan
    if (usia < 25 && usia >= 0) {
      //jika laki-laki 0-24
      if (gender == "Laki-laki") {
        if ((tb < 45) | (tb > 110)) {
          return null;
        } else {
          double x = (tb - 45)*2;
          int baris = x.toInt();
          if (baris > bbtbl024.length){
            return null;
          }
          else if (bb < bbtbl024[baris][4]) {
            return ((bb - bbtbl024[baris][4]) / (bbtbl024[baris][4] - bbtbl024[baris][3]));
          } else if (bb > bbtbl024[baris][4]) {
            return ((bb - bbtbl024[baris][4]) / (bbtbl024[baris][5] - bbtbl024[baris][4]));
          } else {
            return ((bb - bbtbl024[baris][4]) / bbtbl024[baris][4]);
          }
        }
        //jika perempuan 0-24
      } else {
        if ((tb < 45) | (tb > 110)) {
          return null;
        } else {
          double x = (tb - 45)*2;
          int baris = x.toInt();
          if (baris > bbtbp024.length){
            return null;
          }
          else if (bb < bbtbp024[baris][4]) {
            return ((bb - bbtbp024[baris][4]) / (bbtbp024[baris][4] - bbtbp024[baris][3]));
          } else if (bb > bbtbp024[baris][4]) {
            return ((bb - bbtbp024[baris][4]) / (bb - bbtbp024[baris][5] - bb - bbtbp024[baris][4]));
          } else {
            return ((bb - bbtbp024[baris][4]) / bbtbp024[baris][4]);
          }
        }
      }
    }
    //jika usia 25-60 bulan
    else if (usia > 24 && usia <= 60) {
      //jika laki-laki 25-60
      if (gender == "Laki-laki") {
        if ((tb < 65) | (tb > 120)) {
          return null;
        } else {
          double x = (tb - 65)*2;
          int baris = x.toInt();
          if (baris > bbtbl2460.length){
            return null;
          }
          else if (bb < bbtbl2460[baris][4]) {
            return ((bb - bbtbl2460[baris][4]) / (bbtbl2460[baris][4] - bbtbl2460[baris][3]));
          } else if (bb > bbtbl2460[baris][4]) {
            return ((bb - bbtbl2460[baris][4]) / (bbtbl2460[baris][5] - bbtbl2460[baris][4]));
          } else {
            return ((bb - bbtbl2460[baris][4]) / bbtbl2460[baris][4]);
          }
        }
        //jika perempuan 25-60
      } else {
        if ((tb < 65) | (tb > 120)) {
          return null;
        } else {
          int baris = ((tb - 65).toInt())*2;
          if (baris > bbtbp2460.length){
            return null;
          }
          else if (bb < bbtbp2460[baris][4]) {
            return ((bb - bbtbp2460[baris][4]) / (bbtbp2460[baris][4] - bbtbp2460[baris][3]));
          } else if (bb > bbtbp2460[baris][4]) {
            return ((bb - bbtbp2460[baris][4]) / (bb - bbtbp2460[baris][5] - bb - bbtbp2460[baris][4]));
          } else {
            return ((bb - bbtbp2460[baris][4]) / bbtbp2460[baris][4]);
          }
        }
      }
    }
  }
}





//function hitung z score BB/U
//RUMUS Z SCORE BB/U:
//1. Jika BBanak < BBmedian:
//    z = (BBanak - BBmedian) / (BBmedian - BBpada-1SD)

//2. Jika BBanak = BBmedian:
//    z = (BBanak - BBmedian) / BBmedian

//3. Jika BBanak > BBmedian:
//    z = (BBanak -BBmedian) / (BBpada+1SD - BBmedian)
hitungBBU(String gender, double bb, int usia, String edema) {
  if ((edema == "Ya") | (bb == 0) | (usia < 0) | (usia > 60)) {
    return null;
  } else {
    if (gender == "Laki-laki") {
      if (bb == (bbul[usia][3])) {
        return ((bb - bbul[usia][3]) / bbul[usia][3]);
      } else {
        if (bb < bbul[usia][3]) {
          return ((bb - bbul[usia][3]) / (bbul[usia][3] - bbul[usia][2]));
        } else {
          return ((bb - bbul[usia][3]) / (bbul[usia][4] - bbul[usia][3]));
        }
      }
    } else {
      if (bb == bbup[usia][3]) {
        return ((bb - bbup[usia][3]) / bbup[usia][3]);
      } else {
        if (bb < bbup[usia][3]) {
          return ((bb - bbup[usia][3]) / (bbup[usia][3] - bbup[usia][2]));
        } else {
          return ((bb - bbup[usia][3]) / (bbup[usia][4] - bbup[usia][3]));
        }
      }
    }
  }
}


//function hitung z score IMT/U
//RUMUS Z SCORE IMT/U
//1. Jika IMTanak < IMTmedian:
//    z = (IMTanak - IMTmedian) / (IMTmedian - IMTpada-1SD)

//2. Jika IMTanak > IMTmedian:
//    z = (IMTanak - IMTmedian) / (IMTpada+1SD - IMTmedian)

//3. Jika IMTanak = IMTmedian:
//    z = (IMT anak - IMT median) / IMTmedian
hitungIMTU(String gender, double bb, double tb, int usia, String edema) {
  if ((edema == "Ya") | (usia > 60) | (usia < 0) | (bb == 0) | (tb == 0)) {
    return null;
  } else {
    double imt = bb / pow(tb / 100, 2);
    if (gender == "Laki-laki") {
      if (imt < imtul[usia][3]) {
        return (imt - imtul[usia][3]) / (imtul[usia][3] - imtul[usia][2]);
      } else {
        if (imt > imtul[usia][3]) {
          return ((imt - imtul[usia][3]) / (imtul[usia][4] - imtul[usia][3]));
        } else {
          return ((imt - imtul[usia][3]) / imtul[usia][3]);
        }
      }
    } else {
      if (imt < imtup[usia][3]) {
        return ((imt - imtup[usia][3]) / (imtup[usia][3] - imtup[usia][2]));
      } else {
        if (imt > imtup[usia][3]) {
          return ((imt - imtup[usia][3]) / (imtup[usia][4] - imtup[usia][3]));
        } else {
          return ((imt - imtup[usia][3]) / imtup[usia][3]);
        }
      }
    }
  }
}




//function hitung z score TB/U
//RUMUS Z SCORE TB/U
//1. Jika TBanak = TBmedian:
//    z = (TBanak - TBmedian) / TBmedian
//
//2. Jika TBanak < TBmedian:
//    z = (TBanak -TBmedian) / (BBmedian - BBpada-1SD)
//
//3. Jika TBanak > TBmedian:
//    z = (TBanak - TBmedian) / (TBpada+1SD - TBmedian)

hitungTBU( String gender, double tb, int usia, String edema) {
  if ((tb == 0) | (usia < 0) | (usia > 60)) {
    return null;
  } else {
    if (gender == "Laki-laki") {
      if (tb == tbul[usia][3]) {
        return ((tb - tbul[usia][3]) / tbul[usia][3]);
      } else {
        if (tb < tbul[usia][3]) {
          return ((tb - tbul[usia][3]) / (tbul[usia][3] - tbul[usia][2]));
        } else {
          return ((tb - tbul[usia][3]) / (tbul[usia][4] - tbul[usia][3]));
        }
      }
    } else {
      if (tb == tbup[usia][3]) {
        return ((tb - tbup[usia][3]) / tbup[usia][3]);
      } else {
        if (tb < tbup[usia][3]) {
          return ((tb - tbup[usia][3]) / (tbup[usia][3] - tbup[usia][2]));
        } else {
          return ((tb - tbup[usia][3]) / (tbup[usia][4] - tbup[usia][3]));
        }
      }
    }
  }
}


beriwarna(nilai, batas1, batas2, double? batas3, double? batas4, double? batas5) {
  if (nilai == null){
    return Colors.red;         
  }else if (nilai < batas1)  {
    return Colors.red;
  } else if (nilai < batas2) {
    return Colors.amber;
  } else if (nilai < batas3) {
    return Colors.green;
  } else if (nilai > batas4) {      
    return Colors.red;
  } else {
    return Colors.amber;
  }
}



