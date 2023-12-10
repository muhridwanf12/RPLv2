import 'package:flutter/material.dart';
import 'package:drift/drift.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:tubes/page_asesmen/proses_hitung.dart';
import 'package:tubes/page_kalkulator/hitung_usia.dart';
import 'package:tubes/model/database.dart';

class TambahDataPengukuran extends StatefulWidget {
  final int idAnak;
  final String gender;
  const TambahDataPengukuran({super.key, required this.idAnak, required this.gender});
  @override
  State<TambahDataPengukuran> createState() => _TambahDataPengukuranState();
}

class _TambahDataPengukuranState extends State<TambahDataPengukuran> {
  final AppDb database = AppDb();

  DateTime? tanggal, tgl_lahir;
  String? edema;
  double? bb,tb,imtu,bbtb,bbu,tbu;
  int? usia;

  insertpengukuran(id_anak, tgl_pengukuran, usia, bb, tb, imtu, bbtb, bbu, tbu) async{
    // print("Debug: imtu=$imtu, tbbb=$bbtb, bbu=$bbu, tbu=$tbu");
    await database.into(database.pengukuran).insert(PengukuranCompanion.insert( 
      id_anak: widget.idAnak,
      edema: edema!,
      tb: tb,
      bb: bb,
      imtu: Value(imtu), 
      tbbb: Value(bbtb), 
      bbu: Value (bbu), 
      tbu: Value(tbu), 
      tgl_pengukuran: tanggal!, 
      usia: usia));
      print("berhasil");
   }

  TextEditingController cont_tgl_ukur = TextEditingController();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: FutureBuilder<String?>(
            future: database.getNamaAnak(widget.idAnak),
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [

            //form tanggal pengukuran
            TextField(
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    firstDate: DateTime(1945),
                    lastDate: DateTime(2100),
                  );
        
                  if (pickedDate != null) {
                    setState(() {
                    tanggal = pickedDate;
                    cont_tgl_ukur.text = DateFormat('dd-MM-yyyy').format(pickedDate);
                    //tanggal = DateFormat('yyyy-MM-dd').parse(cont_tgl_ukur.text, true);
                    });
                  }
                },
                readOnly: true,
                controller: cont_tgl_ukur,
                decoration: const InputDecoration(
                  labelText: "Tanggal pengukuran",
                  border: OutlineInputBorder(),
                ),
              ),



              //Radio button edema
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(width: 100, child: Text("Edema")),
                  Radio(
                    value: "Ya",
                    groupValue: edema,
                    
                    onChanged: (value) {
                      setState(() {
                        edema = value.toString();
                      });
                    },
                  ),
                  const SizedBox(
                    width: 80,
                    child: Text("Ya"),
                  ),
                  Radio(
                    value: "Tidak",
                    groupValue: edema,
                    onChanged: (value) {
                      setState(() {
                        edema = value.toString();
                      });
                    },
                  ),
                  const SizedBox(width: 80, child: Text("Tidak")),
                ]
              ),


              //form tinggi badan
              TextFormField(
                onChanged: (berat) {
                  setState(() {
                     tb = berat.isEmpty ? 0.0 : double.tryParse(berat)!;
                  });
                },
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,9}')),
                ],
                decoration: const InputDecoration(
                  label: Text("Tinggi badan (kg)"),
                  border: OutlineInputBorder(),
                )),
                const SizedBox(height: 20,),



              //form berat badan
              TextFormField(
                onChanged: (berat) {
                  setState(() {
                     bb = berat.isEmpty ? 0.0 : double.tryParse(berat)!;
                  });
                },
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,9}')),
                ],
                decoration: const InputDecoration(
                  label: Text("Berat badan (kg)"),
                  border: OutlineInputBorder(),
                )),


                //tombol simpan dan batal
                const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue
                        ),
                        onPressed: () async {
                          tgl_lahir = await database.getTanggalLahir(widget.idAnak);
                          if (cont_tgl_ukur.text.isEmpty || edema == null ||
                          tb == null || bb == null  || tanggal!.isBefore(tgl_lahir!)){
                            // ignore: use_build_context_synchronously
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
                              usia = hitungUsia(tanggal!, tgl_lahir!);
                              imtu = hitungIMTU(widget.gender, bb!, tb!, usia!, edema!);
                              bbtb = hitungBBTB(widget.gender, bb!, tb!, usia!, edema!);
                              bbu = hitungBBU(widget.gender, bb!, usia!, edema!);
                              tbu = hitungTBU(widget.gender, tb!, usia!, edema!);
                              // imtu = hitungIMTU(widget.id_anak, bb, tb, usia, edema)
                              insertpengukuran(widget.idAnak, tanggal, usia, bb!, tb!, imtu, bbtb, bbu, tbu );
                              print("${tanggal} data berhasil masuk");
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
      ),
    );
  }
}