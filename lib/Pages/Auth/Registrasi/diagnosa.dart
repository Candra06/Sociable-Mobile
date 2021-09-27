import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'hasilDiagnosa.dart';

class DiagnosaPage extends StatelessWidget {
  // const DiagnosaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Colors.blue[200],
            // image: DecorationImage(image: AssetImage("assets/images/registrasi/diagnosa.jpg",),fit: BoxFit.cover),

          ),
          child: ListView(
            children: [
              Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 205,left: 58,right: 58,),
                    width: 294,
                    height: 294,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(26),
                      // color: Colors.blue
                      color: Color.fromARGB(50,255, 255, 255)
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 171,left: 46,right: 46,),
                    width: 318,
                    height: 318,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(26),
                        // color: Colors.blue
                        color: Color.fromARGB(100,214, 243, 255)
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 131,left: 35,right: 35,),
                    width: 342,
                    height: 342,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(26),
                        // color: Colors.blue
                        color: Colors.white
                    ),
                    child: Stack(
                      children: [
                        Container(
                          width: 278,
                          height: 5,
                          margin: EdgeInsets.only(left: 34,right: 34,top: 39),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(71),
                            color: Colors.grey
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 0.3 * 278,
                                height: 5,
                                // margin: EdgeInsets.only(left: 34,right: 34,top: 39),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(71),
                                    color: Colors.blue
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.symmetric(vertical: 0,horizontal: 20),
                            child: Center(child: Text("Apakah anda adalah seorang yang takut pada figur otoritas?",textAlign: TextAlign.center,style: TextStyle(fontSize: 24),),))
                      ],
                    ),
                  ),
                ],
              ),

              Container(

                margin: EdgeInsets.only(top: 28,left: 34,right: 34,),
                padding: const EdgeInsets.only(top: 24),
                // width: 400
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(26),
                    // color: Colors.blue
                    color: Color.fromARGB(40,255, 255, 255)
                ),
                child: Row(

                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Button_Input(0,"Sangat Tidak Terganggu"),
                    Button_Input(1,"Tidak Terganggu"),
                    Button_Input(2,"biasa"),
                    Button_Input(3,"terganggu"),
                    Button_Input(4,"sangat terganggu"),








                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Button_Input extends StatelessWidget {
  int value;
  final String value_string;

  Button_Input(this.value,this.value_string);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        ElevatedButton(
          onPressed: () {
            // print("hello");
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
              return HasilDiagnosa();
              // return MainPage();
            }));
          },
          child: Text(value.toString(),style: TextStyle(fontSize: 18,color: Colors.black),),
          style: ElevatedButton.styleFrom(

            shape: CircleBorder(),

            padding: EdgeInsets.all(15),
            primary: Colors.white, // <-- Button color
            onPrimary: Colors.blue, // <-- Splash color
          ),

        ),

        Container(
            width: 50,height: 90,
            margin: EdgeInsets.only(top: 10),
            child: Text(value_string,textAlign: TextAlign.center,style: TextStyle(fontSize: 10),))
      ],
    );
  }
}
