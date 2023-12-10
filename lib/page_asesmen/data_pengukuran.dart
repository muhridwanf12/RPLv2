import 'package:flutter/material.dart';
import 'package:tubes/model/database.dart';
import 'package:tubes/page_asesmen/proses_hitung.dart';
import 'package:tubes/page_asesmen/tambah_data_pengukuran.dart';
import 'package:intl/intl.dart';

class DataPengukuran extends StatefulWidget {
  final int id_anak; 
  // final String gender;
  const DataPengukuran({Key? key, required this.id_anak}) : super(key: key);



  @override
  State<DataPengukuran> createState() => _DataPengukuranState();
}

class _DataPengukuranState extends State<DataPengukuran> {
  final AppDb database = AppDb();

  String formatDate(DateTime date) {
  final formatter = DateFormat('dd MMMM yyyy');
  return formatter.format(date);
  }


  



  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: FutureBuilder<String?>(
          future: database.getNamaAnak(widget.id_anak),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator(color: Colors.blue));
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              String namaAnak = snapshot.data ?? 'Nama tidak ditemukan';
              return Center(
                child: Text(
                  namaAnak,
                  style: const TextStyle(color: Colors.white),
                ),
              );
            }
          },
        ),
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back, //ikon kembali
            color: Colors.white, //warna ikon kembali
          ),
          onPressed: () {
            //======= direct ke halaman awal =========
            Navigator.pop(context);
          },
        ),
      actions: [IconButton(onPressed: (){
        database.deleteAllPengukuran(widget.id_anak);
      }, 
      icon: const Icon(Icons.delete
      ), color: Colors.white,),
      const SizedBox(width: 10,)],
      ),
      body: Column(
        children: [
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Tombol IMT/U
              ElevatedButton(
                onPressed: (){},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, 
                ),
                child: const Text(
                  "IMT/U",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )
              ),const SizedBox(width: 10,),


              //Tombol BB/TB
              ElevatedButton(
                onPressed: (){},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, 
                ),
                child: const Text(
                  "BB/TB",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )
              ),const SizedBox(width: 10,),

              //Tombol BB/U
              ElevatedButton(
                onPressed: (){},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, 
                ),
                child: const Text(
                  "BB/U",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )
              ), const SizedBox(width: 10,),


              //Tombol TB/U
              ElevatedButton(
                onPressed: (){},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, 
                ),
                child: const Text(
                  "TB/U",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )
              ),const SizedBox(width: 10,),
            ],
          ),
          const SizedBox(height: 10,),

          Expanded(
            child: FutureBuilder<List<PengukuranData>>(
                  future: database.getPengukuranAnak(widget.id_anak),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator(color: Colors.blue));
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else if (snapshot.data == null || snapshot.data!.isEmpty) {
                      return const Center(child: Text('Tidak ada data pengukuran.'));
                    } else {
                      List<PengukuranData> dataList = snapshot.data!;
                      return ListView.builder(
                        itemCount: dataList.length,
                        itemBuilder: (context, index) {
                          PengukuranData pengukuran = dataList[index];
                          return Card(
                                child: ListTile(
                                  title: Text(
                                    formatDate(pengukuran.tgl_pengukuran),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold
                                    ),),
                                  subtitle: Padding(
                                    padding: const EdgeInsets.only(top:10),
                                    child: Row(
                                      children: [
                                    
                                        //label IMT/U
                                        Container(
                                          width: 50,
                                          height: 30,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(5),
                                            color: beriwarna(pengukuran.imtu,  -2, -1, 1, 2, 1),
                                          ),
                                          child: const Center(
                                            child: Text('IMT/U', style: TextStyle(color: Colors.black)),
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                    
                                    
                                        //label BB/TB
                                        Container(
                                          width: 50,
                                          height: 30,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(5),
                                            color: beriwarna(pengukuran.imtu,  -2, -1, 1, 2, 1),
                                          ),
                                          child: const Center(
                                            child: Text('BB/TB', style: TextStyle(color: Colors.black)),
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                    
                                    
                                        //label BB/U
                                        Container(
                                          width: 50,
                                          height: 30,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(5),
                                            color: beriwarna(pengukuran.tbbb,  -2, -1, 1, 2, 1),
                                          ),
                                          child: const Center(
                                            child: Text('BB/U', style: TextStyle(color: Colors.black)),
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                    
                                    
                                        //label TB/U
                                        Container(
                                          width: 50,
                                          height: 30,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(5),
                                            color: beriwarna(pengukuran.imtu,  -2, -1, 1, 2, 1),
                                          ),
                                          child: const Center(
                                            child: Text('TB/U', style: TextStyle(color: Colors.black)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                        //           trailing: IconButton(onPressed: () {
                        //             showDialog(
                        //   context: context,
                        //   builder: (context) {
                        //     return AlertDialog(
                        //       title: const Text('Konfirmasi'),
                        //       content: const Text('Apakah Anda yakin ingin menghapus data ini?'),
                        //       actions: [
                        //         ElevatedButton(
                        //           onPressed: () {
                        //              database.deletePengukuran(widget.id_anak);
                        //             Navigator.pop(context); // Close the dialog
                        //           },
                        //           child: const Text('Ya'),
                        //         ),
                        //         ElevatedButton(
                        //           onPressed: () {
                        //             Navigator.pop(context); // Close the dialog
                        //           },
                        //           child: const Text('Tidak'),
                        //         ),
                        //       ],
                        //     );
                        //   },
                        // );

                        //           }, 
                        //           icon: const Icon(Icons.delete)),
                                ),
                              );
            
                        },
                      );
                    }
                  },
                ),
          ),
        ],
      ),
        
      
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
           await Navigator.push(
            context,
             MaterialPageRoute(builder: (context) =>  TambahDataPengukuran(idAnak : widget.id_anak, gender: "Laki-laki",)),
          );
        },
        shape: const CircleBorder(),
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add, color: Colors.white),
      ),
      );
  }
}