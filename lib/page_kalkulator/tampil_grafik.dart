part of "_index.dart";

  // grafik(context, usia, hitungIMTU(gender, bb, tb, usia, edema), 
  //                     hitungIMTU(gender, bb, tb, usia, edema), "Grafik Indeks Masa Tubuh Terhadap Usia", gender, usia);

void grafik(BuildContext context, x, y, z, String judul, String gender, int usia) {
  //mengatur data grafik yang ditampilkan
  List <List<FlSpot>> data = data_grafik(judul, usia, gender);
  List <FlSpot> titik = [];
  if ((z != "NA")&&(y != "NA")){
    titik.add(FlSpot(x.toDouble(), y.toDouble()));
    titik.add(FlSpot(x.toDouble(), y.toDouble()));
  }
  
  showAdaptiveDialog(
    context: context,
    builder: (BuildContext context) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
           child: Container(
            width: 550,
            height: 288,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  judul,  //judul grafik
                  style: const TextStyle(
                    decoration: TextDecoration.none,
                    fontFamily: AutofillHints.name,
                    fontSize: 17, 
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),


                //jarak pemisah judul dengan grafik
                const SizedBox(height: 10),



                //grafik
                AspectRatio(
                  aspectRatio: 1.5, 
                  child: LineChart(
                    LineChartData(
                      gridData: FlGridData(show: true),
                      lineTouchData: LineTouchData(enabled: false),
                      lineBarsData: [
                        
                        LineChartBarData(
                          spots:List<FlSpot>.from(data[0]),
                          dotData: FlDotData(show: false),
                          colors: [Colors.red],
                        ),
                        LineChartBarData(
                          spots: List<FlSpot>.from(data[1]),
                          dotData: FlDotData(show: false),
                          colors: [Colors.amber],
                        ),
                        LineChartBarData(
                          spots:List<FlSpot>.from(data[2]),
                          dotData: FlDotData(show: false),
                          colors: [Colors.green],
                        ),
                        LineChartBarData(
                          spots: List<FlSpot>.from(data[3]),
                          dotData: FlDotData(show: false),
                          colors: [Colors.amber],
                        ),
                        LineChartBarData(
                          spots:List<FlSpot>.from(data[4]),
                          dotData: FlDotData(show: false),
                          colors: [Colors.red],
                        ),
                        LineChartBarData(
                          spots : List<FlSpot>.from(titik),
                          colors : [Colors.black]
                        ),
                      ],
                      titlesData: FlTitlesData(
                        leftTitles: SideTitles(
                          showTitles: false,
                          reservedSize: 28,
                          margin: 12,
                        ),
                        bottomTitles: SideTitles(
                          showTitles: false,
                          reservedSize: 28,
                          margin: 12,
                        ),
                        rightTitles: SideTitles(
                          showTitles: false,
                          reservedSize: 28,
                          margin: 12,
                        ),
                        topTitles: SideTitles(
                          showTitles: false,
                          reservedSize: 28,
                          margin: 12,
                        ),
                      ),
                      borderData: FlBorderData(
                        show: true,
                        border: Border.all(
                          color:  const Color(0xff37434d),
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                ),
              ]
            ),
          )
        )
      );
    },
  );
}





List <List<FlSpot>> data_grafik(judul, usia, gender){
  List <FlSpot> data1 = [];   //merah
  List <FlSpot> data2 = [];   //kuning
  List <FlSpot> data3 = [];   //hijau
  List <FlSpot> data4 = [];   //kuning
  List <FlSpot> data5 = [];   //merah
  List <List<FlSpot>> data = [data1, data2, data3, data4, data5];
  if (gender == "Laki-laki"){
    //data grafik untuk IMT/U
    if (judul == "Grafik Indeks Masa Tubuh Terhadap Usia"){
      for ( int i=0; i < (imtul.length); i++){
        data1.add(FlSpot(i.toDouble(), imtul[i][1]));
      }
      for ( int i=0; i < (imtul.length); i++){
        data2.add(FlSpot(i.toDouble(), imtul[i][2]));
      }
      for ( int i=0; i < (imtul.length); i++){
        data3.add(FlSpot(i.toDouble(), imtul[i][3]));
      }
      for ( int i=0; i < (imtul.length); i++){
        data4.add(FlSpot(i.toDouble(), imtul[i][4]));
      }
      for ( int i=0; i < (imtul.length); i++){
        data5.add(FlSpot(i.toDouble(), imtul[i][5]));
      }
    }

    //data grafik untuk BB/TB
    else if (judul == "Grafik Berat Badan Terhadap Tinggi Badan"){
      if (usia <=24 ){
        //data1 
        for ( int i=0; i < (bbtbl024.length); i++){
          data1.add(FlSpot(bbtbl024[i][0], bbtbl024[i][2]));
        }
        //data2
        for ( int i=0; i < (bbtbl024.length); i++){
          data2.add(FlSpot(bbtbl024[i][0], bbtbl024[i][3]));
        }
        //data3
        for ( int i=0; i < (bbtbl024.length); i++){
          data3.add(FlSpot(bbtbl024[i][0], bbtbl024[i][4]));
        }
         //data4
        for ( int i=0; i < (bbtbl024.length); i++){
          data4.add(FlSpot(bbtbl024[i][0], bbtbl024[i][5]));
        }
        //data5
        for ( int i=0; i < (bbtbl024.length); i++){
          data5.add(FlSpot(bbtbl024[i][0], bbtbl024[i][6]));
        }
      }else{
        //data1
        for ( int i=0; i < (bbtbl2460.length); i++){
          data1.add(FlSpot(bbtbl2460[i][0], bbtbl2460[i][2]));
        }
        //data2
        for ( int i=0; i < (bbtbl2460[0].length); i++){
          data2.add(FlSpot(bbtbl2460[i][0], bbtbl2460[i][3]));
        }
        //data3
        for ( int i=0; i < (bbtbl2460.length); i++){
          data3.add(FlSpot(bbtbl2460[i][0], bbtbl2460[i][4]));
        }
        //data4
        for ( int i=0; i < (bbtbl2460.length); i++){
          data4.add(FlSpot(bbtbl2460[i][0], bbtbl2460[i][5]));
        }
        //data5
        for ( int i=0; i < (bbtbl2460.length); i++){
          data5.add(FlSpot(bbtbl2460[i][0], bbtbl2460[i][6]));
        }
      }
    }

    //data grafik BB/U
    else if (judul == "Grafik Berat Badan Terhadap Usia"){
      //data1
      for ( int i=0; i < (bbul.length); i++){
        data1.add(FlSpot(i.toDouble(), bbul[i][1]));
      }

      //data2
      for ( int i=0; i < (bbul.length); i++){
        data2.add(FlSpot(i.toDouble(), bbul[i][2]));
      }

      //data3
      for ( int i=0; i < (bbul.length); i++){
        data3.add(FlSpot(i.toDouble(), bbul[i][3]));
      }

      //data4
      for ( int i=0; i < (bbul.length); i++){
        data4.add(FlSpot(i.toDouble(), bbul[i][4]));
      }

      //data5
      for ( int i=0; i < (bbul.length); i++){
        data5.add(FlSpot(i.toDouble(), bbul[i][5]));
      }
    }

    //Data grafik
    if (judul == "Grafik Tinggi Badan Terhadap Usia"){
      //data1
      for ( int i=0; i < (tbul.length); i++){
        data1.add(FlSpot(i.toDouble(), tbul[i][1]));
      }

      //data2
      for ( int i=0; i < (tbul.length); i++){
        data2.add(FlSpot(i.toDouble(), tbul[i][2]));
      }

      //data3
      for ( int i=0; i < (tbul.length); i++){
        data3.add(FlSpot(i.toDouble(), tbul[i][3]));
      }

      //data4
      for ( int i=0; i < (tbul.length); i++){
        data4.add(FlSpot(i.toDouble(), tbul[i][4]));
      }

      //data5
      for ( int i=0; i < (tbul.length); i++){
        data5.add(FlSpot(i.toDouble(), tbul[i][5]));
      }
    }
  }else{
    //grafik perempuan
    //data grafik untuk IMT/U
    if (judul == "Grafik Indeks Masa Tubuh Terhadap Usia"){
      for ( int i=0; i < (imtup.length); i++){
        data1.add(FlSpot(i.toDouble(), imtup[i][1]));
      }
      for ( int i=0; i < (imtup.length); i++){
        data2.add(FlSpot(i.toDouble(), imtup[i][2]));
      }
      for ( int i=0; i < (imtup.length); i++){
        data3.add(FlSpot(i.toDouble(), imtup[i][3]));
      }
      for ( int i=0; i < (imtup.length); i++){
        data4.add(FlSpot(i.toDouble(), imtup[i][4]));
      }
      for ( int i=0; i < (imtup.length); i++){
        data5.add(FlSpot(i.toDouble(), imtup[i][5]));
      }
    }

    //data grafik untuk BB/TB
    else if (judul == "Grafik Berat Badan Terhadap Tinggi Badan"){
      if (usia <= 24){
        //data1 
        for ( int i=0; i < (bbtbp024.length); i++){
          data1.add(FlSpot(bbtbp024[i][0], bbtbp024[i][2]));
        }
        //data2
        for ( int i=0; i < (bbtbp024.length); i++){
          data2.add(FlSpot(bbtbp024[i][0], bbtbp024[i][3]));
        }
        //data3
        for ( int i=0; i < (bbtbp024.length); i++){
          data3.add(FlSpot(bbtbp024[i][0], bbtbp024[i][4]));
        }
        //data4
        for ( int i=0; i < (bbtbp024.length); i++){
          data4.add(FlSpot(bbtbp024[i][0], bbtbp024[i][5]));
        }
        //data5
        for ( int i=0; i < (bbtbp024.length); i++){
          data5.add(FlSpot(bbtbp024[i][0], bbtbp024[i][6]));
        }
      }else{
        //data1
        for ( int i=0; i < (bbtbp2460.length); i++){
          data1.add(FlSpot(bbtbp2460[i][0], bbtbp2460[i][2]));
        }
        //data2
        for ( int i=0; i < (bbtbp2460[0].length); i++){
          data2.add(FlSpot(bbtbp2460[i][0], bbtbp2460[i][3]));
        }
        //data3
        for ( int i=0; i < (bbtbp2460.length); i++){
          data3.add(FlSpot(bbtbp2460[i][0], bbtbp2460[i][4]));
        }
        //data4
        for ( int i=0; i < (bbtbp2460.length); i++){
          data4.add(FlSpot(bbtbp2460[i][0], bbtbp2460[i][5]));
        }
        //data5
        for ( int i=0; i < (bbtbp2460.length); i++){
          data5.add(FlSpot(bbtbp2460[i][0], bbtbp2460[i][6]));
        }
      }
    }

    //data grafik BB/U
    else if (judul == "Grafik Berat Badan Terhadap Usia"){
      //data1
      for ( int i=0; i < (bbup.length); i++){
        data1.add(FlSpot(i.toDouble(), bbup[i][1]));
      }

      //data2
      for ( int i=0; i < (bbup.length); i++){
        data2.add(FlSpot(i.toDouble(), bbup[i][2]));
      }

      //data3
      for ( int i=0; i < (bbup.length); i++){
        data3.add(FlSpot(i.toDouble(), bbup[i][3]));
      }

      //data4
      for ( int i=0; i < (bbup.length); i++){
        data4.add(FlSpot(i.toDouble(), bbup[i][4]));
      }

      //data5
      for ( int i=0; i < (bbup.length); i++){
        data5.add(FlSpot(i.toDouble(), bbup[i][5]));
      }
    }

    //Data grafik
    if (judul == "Grafik Tinggi Badan Terhadap Usia"){
      //data1
      for ( int i=0; i < (tbup.length); i++){
        data1.add(FlSpot(i.toDouble(), tbup[i][1]));
      }

      //data2
      for ( int i=0; i < (tbup.length); i++){
        data2.add(FlSpot(i.toDouble(), tbup[i][2]));
      }

      //data3
      for ( int i=0; i < (tbup.length); i++){
        data3.add(FlSpot(i.toDouble(), tbup[i][3]));
      }

      //data4
      for ( int i=0; i < (tbup.length); i++){
        data4.add(FlSpot(i.toDouble(), tbup[i][4]));
      }

      //data5
      for ( int i=0; i < (tbup.length); i++){
        data5.add(FlSpot(i.toDouble(), tbup[i][5]));
      }
    }

  }

  return data;
  
}
 