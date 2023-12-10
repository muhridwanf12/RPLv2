import 'package:flutter/material.dart';
import 'package:tubes/model/database.dart';
import 'package:intl/intl.dart';

class TambahAnak extends StatefulWidget {
const TambahAnak({ Key? key }) : super(key: key);

  @override
  State<TambahAnak> createState() => _TambahAnakState();
}

class _TambahAnakState extends State<TambahAnak> {
  late String gender = "Laki-laki";
  late DateTime tanggal;
  


   TextEditingController cont_nama = TextEditingController();
   TextEditingController cont_tgl_lahir = TextEditingController();
  //  TextEditingController cont_gender = TextEditingController();
   TextEditingController  cont_nama_ayah = TextEditingController();
   TextEditingController cont_nama_ibu = TextEditingController();
   final AppDb database = AppDb();

   Future insertanak(String nama_anak, String gender, DateTime tgl_lahir, String nama_ayah, String nama_ibu) async{
    await database.into(database.anak).insert(AnakCompanion.insert(
      gender: gender, nama_anak: nama_anak, tgl_lahir: tgl_lahir, nama_ayah: nama_ayah, nama_ibu: nama_ibu));
      print("berhasil");
   }



  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Input Data Anak',  style: TextStyle(color: Colors.white),)),
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [

            //form nama anak
            TextField(
              controller: cont_nama,
              decoration: const InputDecoration(label: Text('Nama Anak'),
              border: OutlineInputBorder()),
            ),

            //jarak pemisah
            const SizedBox(height: 20,),


            //form tanggal lahir
            TextField(
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    firstDate: DateTime(1945),
                    lastDate: DateTime(2100),
                  );
        
                  if (pickedDate != null) {
                    setState(() {
                    cont_tgl_lahir.text = DateFormat('dd-MM-yyyy').format(pickedDate);
                    tanggal = DateFormat('yyyy-MM-dd').parse(cont_tgl_lahir.text, true);
                    });
                  }
                },
                readOnly: true,
                controller: cont_tgl_lahir,
                decoration: const InputDecoration(
                  labelText: "Tanggal lahir",
                  border: OutlineInputBorder(),
                ),
                
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
                        gender= value.toString();
                      });
                    },
                  ),
                  const SizedBox(width: 80, child: Text("Perempuan")),
                ],
              ),
                  TextField(
                    controller: cont_nama_ayah,
                    decoration: const InputDecoration(label: Text('Nama Ayah'),
                    border: OutlineInputBorder(),
                    ),
                    
                  ),
                  const SizedBox(height: 20,),
                  TextField(
                    controller: cont_nama_ibu,
                    decoration: const InputDecoration(
                      label: Text('Nama Ibu'),
                      border: OutlineInputBorder(),
                    ),
                    
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue
                        ),
                        onPressed: () async {
                          if (cont_nama.text.isEmpty | cont_nama_ayah.text.isEmpty |
                          (gender == null) | cont_nama_ibu.text.isEmpty | cont_tgl_lahir.text.isEmpty){
                            showDialog(
                              context: context, 
                              builder: (context){
                                return AlertDialog(
                                  title: const Text("Lengkapi semua data!"),
                                  actions: [
                                    ElevatedButton(
                                      onPressed:() {
                                        Navigator.of(context).pop();
                                      },
                                      style: const ButtonStyle(
                                      ),
                                      child: const Text("OK"),
                                    )
                                  ],
                                );
                              });
                          }else{
                            insertanak(cont_nama.text, gender, tanggal, cont_nama_ayah.text, cont_nama_ibu.text);
                            Navigator.pop(context);
                          }
                        },
                        child: const Text('Simpan',
                        style: TextStyle(
                          color: Colors.white
                        ),),
                      ),
                      const SizedBox(width: 20,),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Batal",
                        style: TextStyle(
                          color: Colors.white
                        ),),
                      )
                    ],
                  )
          ],
        ),
      )
    );
  }
}