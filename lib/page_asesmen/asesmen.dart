import 'package:flutter/material.dart';
import 'package:tubes/model/database.dart';
import 'package:tubes/model/tb_anak.dart';
import 'package:tubes/page_asesmen/data_anak.dart';
import 'package:tubes/page_asesmen/data_pengukuran.dart';

class Asesmen extends StatelessWidget {
  Asesmen({super.key});
  final AppDb database = AppDb();

  Future<List<AnakData>> getAllAnak() async {
    return await database.getAllAnak();
  }
  

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
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.delete),
            color: Colors.white,
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: FutureBuilder<List<AnakData>>(
        future: getAllAnak(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            // Data loaded successfully
            List<AnakData> anakList = snapshot.data!;

            // Use the data in your UI
            return ListView.builder(
              itemCount: anakList.length,
              itemBuilder: (context, index) {
                AnakData anak = anakList[index];
                // Use the anak in your list
                return Card(
                  child: ListTile(
                    title: Text(
                      anak.nama_anak,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('${anak.nama_ibu} & ${anak.nama_ayah}'),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.edit),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DataPengukuran(),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TambahAnak()),
          );
        },
        shape: const CircleBorder(),
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
