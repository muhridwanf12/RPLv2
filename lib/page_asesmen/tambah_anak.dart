import 'package:flutter/material.dart';

class TambahAnak extends StatefulWidget {
const TambahAnak({ Key? key }) : super(key: key);

  @override
  State<TambahAnak> createState() => _TambahAnakState();
}

class _TambahAnakState extends State<TambahAnak> {
   String gender = "Laki-laki";
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Anak'),
      ),
      body: Row(
        children: [
          const TextField(
            decoration: InputDecoration(label: Text('Nama Anak')),
          ),
          const TextField(
            decoration: InputDecoration(label: Text('Tanggal Lahir')),
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(width: 100, child: Text("Jenis Kelamin")),
                Radio(
                  value: "Laki-laki",
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value.toString();
                    });
                  },
                ),
                const SizedBox(
                  width: 80,
                  child: Text("Laki-laki"),
                ),
                Radio(
                  value: "Perempuan",
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value.toString();
                    });
                  },
                ),
                const SizedBox(width: 80, child: Text("Perempuan")),
                const TextField(decoration: InputDecoration(label: Text('Nama Ayah')),),
                const TextField(decoration: InputDecoration(label: Text('Nama Ibu')),),
              ],
            ),
        ],
      )
    );
  }
}