import 'package:flutter/material.dart';

void tampilDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Tanggal pengukuran sebelum tanggal lahir!"),
        content: const Text("Tanggal pengukuran harus setelah tanggal lahir anak."),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("OK"),
          )
        ],
      );
    },
  );
}
