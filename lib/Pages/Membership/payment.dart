import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PayMent extends StatelessWidget {
  // const PayMent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ListView(
          padding: EdgeInsets.only(top: 23,bottom: 23,left: 15,right: 25),
          children: [
            SizedBox(height: 40,),
            Text("INFORMASI PEMBAYARAN",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 25 ),),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.all(25),
              decoration: BoxDecoration(
                  color: Color.fromRGBO(240, 240, 241, 1),
                borderRadius: BorderRadius.circular(25)
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Tata Cara Pembayaran"),
                  Text(""),
                  Text("1. isi data diri"),
                  Text("2. pilih metode pembayaran"),
                  Text("3. transfer ke nomor rekening tertera"),
                  Text("4. upload bukti transfer"),
                  Text("5. Permintaan anda segera diproses")
                ],
              ),
            ),
            SizedBox(height: 20,),
            Text("Pilihan Rekening",style: TextStyle(fontWeight: FontWeight.bold),),
            Image.asset("assets/images/payments.png"),
            SizedBox(height: 20,),
            Text("Bukti Transfer",style: TextStyle(fontWeight: FontWeight.bold),),
            Container(
              width: double.infinity,
              height: 272,
              padding: EdgeInsets.all(25),
              decoration: BoxDecoration(
                  color: Color.fromRGBO(240, 240, 241, 1),
                  borderRadius: BorderRadius.circular(25)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.camera_alt ,size: 30,color: Colors.grey,),
                  Text("Upload Bukti Transfer disisni")
                ],
              ),
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                InkWell(
                  onTap: (){Navigator.of(context).pop();},
                  child: Card(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.grey,width: 0.5),
                      borderRadius: BorderRadius.circular(50)
                    ),
                    child: Container(
                      width: 161,
                      height: 47,
                      child: Center(child: Text("Nanti",style: TextStyle(fontSize: 18),)),
                    ),
                  ),
                ),
                Container(
                  width: 161,
                  height: 47,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Color.fromRGBO(61, 198, 242, 1)
                  ),
                  child: Center(child: Text("Submit",style: TextStyle(fontSize: 18,color:Colors.white),)),
                ),
              ],
            )

          ],
        ),
      ),
    );
  }
}
