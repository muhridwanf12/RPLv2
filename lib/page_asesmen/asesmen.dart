import 'package:flutter/material.dart';
import 'package:tubes/model/database.dart';
import 'package:tubes/page_asesmen/data_anak.dart';
import 'package:tubes/page_asesmen/data_pengukuran.dart';

class Asesmen extends StatefulWidget {
  Asesmen({super.key});

  @override
  State<Asesmen> createState() => _AsesmenState();
}

class _AsesmenState extends State<Asesmen> {
   final AppDb database = AppDb();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Asesmen Individu',
            style: TextStyle(color: Colors.white),
          ),
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
        actions: [
          //tombol hapus semua data anak
          IconButton(
            onPressed: () async {
              await database.deleteAllAnak();
              setState(() {
                
                
              });
            },
            icon: const Icon(Icons.delete),
            color: Colors.white,
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: FutureBuilder<List<AnakData>>(
        future: database.getAllAnak(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator(color: Colors.blue,));
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            //jika berhasil
            List<AnakData> anakList = snapshot.data!;
            return ListView.builder(
              itemCount: anakList.length,
              itemBuilder: (context, index) {
                AnakData anak = anakList[index];
                return Padding(
                  padding: const EdgeInsets.all(2),
                  child: Card(
                    child: ListTile(
                      title: Text(
                        anak.nama_anak,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text('Ny.${anak.nama_ibu} & Tn.${anak.nama_ayah}'),
                      // trailing: IconButton(
                      //   onPressed: () {
                      //     // edit_data_anak(anak.id_anak);
                      //   },
                      //   icon: const Icon(Icons.edit),
                      // ),

                      //saat list diklik
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DataPengukuran(id_anak: anak.id_anak),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
           await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const TambahAnak()),
          );
        },
        shape: const CircleBorder(),
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
