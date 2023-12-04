part of '_index.dart';

void grafik(BuildContext context, double x, double y, String judul) {
  showAdaptiveDialog(

    context: context,
    builder: (BuildContext context) {
      return Center(
        
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            width: 500,
            height: 500,
            decoration: BoxDecoration(
              color: Colors.white,
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
                    fontFamily: AutofillHints.name,
                    fontSize: 17, 
                    fontWeight: FontWeight.bold,
                    color: Colors.pink
                  )
                ),
          
                //jarak pemisah judul dengan grafik
                const SizedBox(height: 3),
          
                //grafik
          
              ],
            ),
          ),
        ),
      );
    },
  );
}
