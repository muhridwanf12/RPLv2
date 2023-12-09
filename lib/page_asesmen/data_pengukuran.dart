import 'package:flutter/material.dart';

class DataPengukuran extends StatelessWidget {
const DataPengukuran({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Asep', style: TextStyle(color: Colors.white), )),
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
      actions: [IconButton(onPressed: (){}, icon: const Icon(Icons.delete
      ), color: Colors.white,),
      const SizedBox(width: 10,)],
      ),
      body: Padding(
              padding: const EdgeInsets.all(10),
              child: ListView(
                children: [
                  const SizedBox(height: 20,),
                 Row( 
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      // style: ButtonStyle(shape: MaterialStatePropertyAll(10)),
                      child: const Text('IMT/U'),
                    ),
                    const SizedBox(width: 20),
                    
                          
                  ],),
                  const SizedBox(height: 20),
                  Card(
                     child: ListTile(
                      title: const Text('07 Desember 2023', style: TextStyle(fontWeight: FontWeight.bold),),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Row(children: [
                        
                          Container(
                            width: 50,
                            height: 30,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: Colors.red),
                            child: const Center(child: Text('IMT/U', style: TextStyle(color: Colors.black),)),
                        
                          ),
                          const SizedBox(width: 10,),
                          Container(
                            width: 50,
                            height: 30,
                            // color: Colors.amber,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: Colors.red),
                            child: const Center(child: Text('BB/TB', style: TextStyle(color: Colors.black))),
                        
                          ),
                          const SizedBox(width: 10,),
                          Container(
                            width: 50,
                            height: 30,
                            // color: Colors.amber,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: Colors.green),
                            child: const Center(child: Text('BB/U', style: TextStyle(color: Colors.black))),
                        
                          ),
                          const SizedBox(width: 10,),
                          Container(
                            width: 50,
                            height: 30,
                            // color: Colors.amber,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: Colors.red),
                            child: const Center(child: Text('TB/U', style: TextStyle(color: Colors.black))),
                        
                          ),
                        ],),
                      ),
                      trailing: IconButton(onPressed: (){}, icon: const Icon(Icons.edit)),
                    ),
                  ),
                  
                ],
              ),
              
            ),
          
          floatingActionButton: FloatingActionButton(onPressed: (){}, 
          shape: const CircleBorder(),
          backgroundColor: Colors.blue,
          child: const Icon(Icons.add, color: Colors.white),
          ),
    );
  }
}