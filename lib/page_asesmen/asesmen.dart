import 'package:flutter/material.dart';
import 'package:tubes/page_asesmen/data_pengukuran.dart';
import 'package:tubes/page_asesmen/tambah_anak.dart';

class Asesmen extends StatelessWidget {
const Asesmen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Asesmen Individu', style: TextStyle(color: Colors.white), )),
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
      actions: [IconButton(onPressed: (){}, icon: const Icon(Icons.delete), color: Colors.white,),
      const SizedBox(width: 10,)],
      ),
      body: 
        // Column(
          
            Padding(
              padding: const EdgeInsets.all(10),
              child: ListView(
                children: [
                  Card(
                    child: ListTile(
                      title: const Text('Ujang', style: TextStyle(fontWeight: FontWeight.bold),),
                      subtitle: const Text('Ny.Siti & Tn.Hadi'),
                      trailing: IconButton(onPressed: (){}, icon: const Icon(Icons.edit)),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: const Text('Asep', style: TextStyle(fontWeight: FontWeight.bold),),
                      subtitle: const Text('Ny.Nyai & Tn.Tono'),
                      trailing: IconButton(onPressed: (){}, icon: const Icon(Icons.edit)),
                      onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const DataPengukuran())); },
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: const Text('Gabriella', style: TextStyle(fontWeight: FontWeight.bold),),
                      subtitle: const Text('Ny.Elizabeth & Tn.John'),
                      trailing: IconButton(onPressed: (){}, icon: const Icon(Icons.edit)),
                    ),
                  ),
                ],
              ),
              
            ),
          
          floatingActionButton: FloatingActionButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => const TambahAnak()));
          }, 
          shape: const CircleBorder(),
          backgroundColor: Colors.blue,
          child: const Icon(Icons.add, color: Colors.white),
          ),
         
      
    );
  }
}