import 'package:flutter/material.dart';
import 'package:sociable/helper/route.dart';

import 'diagnosa.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  var usernameInput;

  var emailInput;

  var obsuced = true;

  var passwordInput;

  var tanggalLahirInput;

  var nomorTeleponInput;

  var jenisKelaminInput = "Jenis Kelamin";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(right: 30, left: 30, top: 50),
          child: ListView(
            children: [
              Text(
                "Registrasi",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                autofocus: false,
                onChanged: (ValueKey) {
                  usernameInput = ValueKey;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
                  hintText: "Username",
                  // labelText: "Username",
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                autofocus: false,
                onChanged: (ValueKey) {
                  usernameInput = ValueKey;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
                  hintText: "Email",
                  // labelText: "Username",
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                // textAlign: TextAlign.center,
                autofocus: false,
                obscureText: obsuced,
                onChanged: (ValueKey) {
                  passwordInput = ValueKey;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
                  hintText: "Password",
                  suffixIcon: IconButton(
                    icon: Icon(Icons.remove_red_eye),
                    onPressed: () {
                      if (obsuced == true) {
                        setState(() {
                          obsuced = false;
                        });
                      } else {
                        setState(() {
                          obsuced = true;
                        });
                      }
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                autofocus: false,
                onChanged: (ValueKey) {
                  tanggalLahirInput = ValueKey;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
                  hintText: "Tanggal Lahir",
                  // labelText: "Username",
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                autofocus: false,
                onChanged: (ValueKey) {
                  nomorTeleponInput = ValueKey;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
                  hintText: "Nomor Telepon +62",
                  // labelText: "Username",
                ),
              ),
              SizedBox(
                height: 15,
              ),
              DropdownButton<String>(
                hint: Text(jenisKelaminInput),
                items: <String>['Laki-laki', 'Perempuan'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (_) {},
              ),
              SizedBox(
                height: 15,
              ),
              Builder(
                builder: (context) => Container(
                  width: 155,
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(53),
                  ),
                  child: FlatButton(
                    child: Text(
                      "Daftar",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
                        return DiagnosaPage();
                      }));
                    },
                  ),
                ),
              ),
              FlatButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.LOGIN);
                  },
                  child: Text(
                    "Sudah Punya Akun?",
                    style: TextStyle(color: Colors.black),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
