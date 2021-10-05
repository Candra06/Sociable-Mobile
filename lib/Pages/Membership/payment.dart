import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sociable/Pages/Membership/repository/membership_repository.dart';
import 'package:sociable/helper/config.dart';
import 'package:sociable/helper/route.dart';

class PayMent extends StatefulWidget {
  const PayMent({Key key}) : super(key: key);

  @override
  _PayMentState createState() => _PayMentState();
}

class _PayMentState extends State<PayMent> {
  File tmpFile;
  String fileName = '';
  Future<File> file;
  Future<File> foto;

  void submit() async {
    setState(() {
      Config.loading(context);
    });
    MemberRepository repository = new MemberRepository();

    bool respon = await repository.store(tmpFile);
    print(respon);
    if (respon) {
      setState(() {
        Navigator.pop(context);
        Config.alert(1, 'Berhasil mengupload bukti pembayaran');
        Navigator.pushNamed(context, Routes.HOME);
      });
    } else {
      setState(() {
        Navigator.pop(context);
        Config.alert(0, 'Gagal mengupload bukti pembayaran');
      });
    }
  }

  Future getImage(context) async {
    final picker = ImagePicker();
    PickedFile pickedFile;
    final imgSrc = await showDialog<ImageSource>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Pilih bukti transfer"),
        actions: <Widget>[
          MaterialButton(
            child: Text("Kamera"),
            onPressed: () async {
              Navigator.pop(context, ImageSource.camera);
              pickedFile = await picker.getImage(source: ImageSource.camera);

              setState(() {
                fileName = pickedFile.path.toString();
                tmpFile = File(pickedFile.path);
              });
            },
          ),
          MaterialButton(
              child: Text("Galeri"),
              onPressed: () async {
                Navigator.pop(context, ImageSource.gallery);
                pickedFile = await picker.getImage(source: ImageSource.gallery);

                setState(() {
                  fileName = pickedFile.path.toString();
                  tmpFile = File(pickedFile.path);
                });
              })
        ],
      ),
    );
  }

  Widget showImage() {
    if (fileName == null || fileName == '') {
      return InkWell(
        onTap: () {
          getImage(context);
        },
        child: Container(
          width: double.infinity,
          height: 272,
          padding: EdgeInsets.all(25),
          decoration: BoxDecoration(color: Color.fromRGBO(240, 240, 241, 1), borderRadius: BorderRadius.circular(25)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.camera_alt,
                size: 30,
                color: Colors.grey,
              ),
              Text("Upload Bukti Transfer disisni")
            ],
          ),
        ),
      );
    } else {
      return InkWell(
        onTap: () {
          getImage(context);
        },
        child: Container(
          width: double.infinity,
          height: 272,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(color: Color.fromRGBO(240, 240, 241, 1), borderRadius: BorderRadius.circular(25)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.file(
                tmpFile,
                height: 200,
                fit: BoxFit.fitHeight,
              ),
            ],
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ListView(
          padding: EdgeInsets.only(top: 23, bottom: 23, left: 25, right: 25),
          children: [
            SizedBox(
              height: 40,
            ),
            Text(
              "INFORMASI PEMBAYARAN",
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.all(25),
              decoration: BoxDecoration(color: Color.fromRGBO(240, 240, 241, 1), borderRadius: BorderRadius.circular(25)),
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
            SizedBox(
              height: 20,
            ),
            Text(
              "Pilihan Rekening",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Image.asset("assets/images/payments.png"),
            SizedBox(
              height: 20,
            ),
            Text(
              "Bukti Transfer",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            showImage(),
            SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(side: BorderSide(color: Colors.grey, width: 0.5), borderRadius: BorderRadius.circular(50)),
                    child: Container(
                      width: 161,
                      height: 47,
                      child: Center(
                          child: Text(
                        "Nanti",
                        style: TextStyle(fontSize: 18),
                      )),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    if (tmpFile.path.isEmpty) {
                      Config.alert(0, 'Pilih Bukti Transfer');
                    } else {
                      submit();
                    }
                  },
                  child: Container(
                    width: 161,
                    height: 47,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), color: Color.fromRGBO(61, 198, 242, 1)),
                    child: Center(
                        child: Text(
                      "Submit",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    )),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
