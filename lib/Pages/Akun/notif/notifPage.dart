import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sociable/Pages/Akun/notif/widget/notifItem.dart';
class NotifPage extends StatelessWidget {
  // const NotifPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.arrow_back,color: Colors.black,size: 30,),
                  ),
                  Text("Notifikasi",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25),),
                ],
              ),
            ],
          ),
        ),
        body: ListView(
          children: [
            for(int i=1;i<30;i++)
            NotifItem("ini isi notif ke "+i.toString())
          ],
        ),
      ),
    );
  }
}
