import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sociable/Pages/Membership/payment.dart';

class MemberShipPage extends StatelessWidget {
  // const MemberShipPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/images/bg.png"))
          ),
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: (){
                        Navigator.of(context).pop();
                      },
                      icon: Icon(Icons.close,size: 40,color: Colors.white,)
                  ),
                ],
              ),


              Image.asset("assets/images/logo.png",width: 103,height: 111,),
              Text("Join Membership Untuk Mengakses Fitur Ini!",textAlign: TextAlign.center,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left: 40,right: 40),
                child: Text("Dapatkan keuntungan akses berkonsultasi dengan psikolog dan konten-konten premium lainnya",textAlign: TextAlign.center),
              ),
              InkWell(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context){
                    return PayMent();
                  }));
                },
                child: Card(
                  margin: EdgeInsets.all(20),
                  color: Color.fromRGBO(255, 255, 255, 0.35),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)

                  ),
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(20),
                    // height: 198,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.payment,color: Colors.amber,size: 30,),
                            SizedBox(width: 20,),
                            Text("Gold Membership",style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold),)
                          ],
                        ),
                        SizedBox(height: 20,),
                        Text("Dapatkan akses membership selama satu tahun dengan harga yang lebih terjangkau"),
                        SizedBox(height: 40,),

                        Card(
                          color: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(41)
                          ),
                          child: Container(
                            width: 143,
                            height: 39,

                            child: Center(child: Text("IDR 999.999",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),)),
                          ),
                        )

                      ],
                    ),
                  ),
                ),
              ),




              InkWell(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context){
                    return PayMent();
                  }));
                },
                child: Card(
                  margin: EdgeInsets.only(left: 20,right: 20),
                  color: Color.fromRGBO(255, 255, 255, 0.35),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)

                  ),
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(20),
                    // height: 198,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.payment,color: Colors.grey,size: 30,),
                            SizedBox(width: 20,),
                            Text("Silver Membership",style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold),)
                          ],
                        ),
                        SizedBox(height: 20,),
                        Text("Dapatkan akses membership selama satu bulan"),
                        SizedBox(height: 40,),

                        InkWell(
                          onTap: (){

                          },
                          child: Card(
                            color: Colors.blue,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(41)
                            ),
                            child: Container(
                              width: 143,
                              height: 39,

                              child: Center(child: Text("IDR 95.000",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),)),
                            ),
                          ),
                        )

                      ],
                    ),
                  ),
                ),
              )


            ],
          ),
        ),
      ),
    );
  }
}
