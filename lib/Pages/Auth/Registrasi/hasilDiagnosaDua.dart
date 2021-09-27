import 'package:flutter/material.dart';
import 'package:sociable/MainPage.dart';



class HasilDiagnosaDua extends StatelessWidget {
  // const HasilDiagnosaDua({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          shadowColor: Colors.white,
          title: Center(child: Text("HASIL DIAGNOSA",style: TextStyle(fontSize: 20,color: Colors.black),)),
        ),

        body: Column(
          children: [

            Container(
              width: double.infinity,
              height: 200,
              margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.only(right: 28),
              // color: Colors.green,
              child: Row(

                children: [
                  Image.asset("assets/images/vector1.png", height: 320,),

                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 10,),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Hai [nama User]",textAlign: TextAlign.start,style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold),),
                          SizedBox(height: 10,),
                          Text(""
                              "Berdasarkan hasil diagnosa kami, kamu termasuk orang yang mengidap Social Anxiety Disorder (SAD) dalam kategori [kategori] loh.",
                            style: TextStyle(fontSize: 15,color: Colors.black,),)
                        ],
                      ),
                    ),
                  ),

                ],
              ),
            ),

            // Image.asset("assets/images/vector1.png",
            //   height: 320,),
            //



            Flexible(
                fit: FlexFit.tight,
                child: Container(
                  margin: EdgeInsets.only(top: 0),
                  padding: EdgeInsets.only(right: 5,left: 5,top: 20),
                  width: double.infinity,
                  height: 500,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(46,230, 255, 1),
                      // color:Colors.blue;
                      borderRadius: BorderRadius.only(topRight: Radius.circular(50),topLeft: Radius.circular(50),)
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Jangan Khawatir, Kamu Tetap Bisa Menggunakan Sociable",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),

                      ),
                      SizedBox(height: 28,),
                      Text("Melalui fitur-fitur yang tersedia, kami yakin dapat menjauhkanmu dari penyakit Social Anxiety Disorder",textAlign: TextAlign.center,style: TextStyle(fontSize: 16),),

                      SizedBox(height: 30,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 110,
                            height: 200,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(image: AssetImage("assets/images/chalange.png"),fit: BoxFit.cover),

                            ),

                          ),
                          Container(
                            width: 110,
                            height: 200,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(image: AssetImage("assets/images/forum.png"),fit: BoxFit.cover),

                            ),

                          ),
                          Container(
                            width: 110,
                            height: 200,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(image: AssetImage("assets/images/konten.png"),fit: BoxFit.cover),

                            ),

                          ),


                        ],
                      ),
                      Builder(
                        builder: (context) => Container(
                          width: 155,
                          height: 45,
                          margin: EdgeInsets.only(top: 40),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(53),

                          ),
                          child: FlatButton(
                            child: Text("Join Program",style: TextStyle(fontSize: 20,color: Colors.black),),
                            onPressed: () {
                              Navigator.of(context)
                                  .pushReplacement(MaterialPageRoute(builder: (context) {
                                return MainPage();
                              }));
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                )
            )

          ],
        ),
      ),
    );
  }
}
