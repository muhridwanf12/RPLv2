part of '../_index.dart';

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
    return "NA";
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
