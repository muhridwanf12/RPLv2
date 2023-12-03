part of '_index.dart';

void grafik(BuildContext context, double x, double y, String judul) {
  showAdaptiveDialog(
    context: context,
    builder: (BuildContext context) {
      return Center(
        child: Container(
          color: Colors.white,
          width: 500,
          height: 500,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
          ),
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                judul,  //judul grafik
                style: const TextStyle(
                  fontSize: 15, 
                  fontWeight: FontWeight.bold
                )
              ),

              //jarak pemisah judul dengan grafik
              const SizedBox(height: 3),

              //grafik

            ],
          ),
        ),
      );
    },
  );
}
