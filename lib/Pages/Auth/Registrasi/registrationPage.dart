import 'package:flutter/material.dart';
import 'package:sociable/Pages/Auth/authModel.dart';
import 'package:sociable/Pages/Auth/auth_repository.dart';
import 'package:sociable/helper/config.dart';
import 'package:sociable/helper/route.dart';

import 'diagnosa.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  TextEditingController usernameInput = new TextEditingController();
  TextEditingController emailInput = new TextEditingController();
  bool obsuced = true;
  TextEditingController passwordInput = new TextEditingController();
  TextEditingController tanggalLahirInput = new TextEditingController();
  TextEditingController nomorTeleponInput = new TextEditingController();
  String valGender, birhtDate;
  DateTime _dateTime;

  List jenisKelaminInput = ["Jenis Kelamin", "Laki-laki", 'Perempuan'];
  Auth auth = new Auth();
  AuthRepository repository = new AuthRepository();

  void regsiter() async {
    setState(() {
      Config.loading(context);
    });
    auth.username = usernameInput.text;
    auth.email = emailInput.text;
    auth.password = passwordInput.text;
    auth.phone = nomorTeleponInput.text;
    auth.gender = valGender;
    auth.birthDate = _dateTime;

    bool respon = await repository.register(auth);
    if (respon) {
      Config.alert(1, 'Register berhasil');
    } else {
      Config.alert(0, 'Register gagal');
    }
    Navigator.pop(context);
    Navigator.pushNamed(context, Routes.LOGIN);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              controller: usernameInput,
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
              controller: emailInput,
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
              controller: passwordInput,
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
              controller: tanggalLahirInput,
              onTap: () {
                showDatePicker(context: context, initialDate: _dateTime == null ? DateTime.now() : _dateTime, firstDate: DateTime(1945), lastDate: DateTime.now()).then((date) {
                  if (date != null) {
                    setState(() {
                      _dateTime = date;
                      tanggalLahirInput.text = Config.formatDateInput(date.toString());
                      var tgl = _dateTime.toString().split(' ');
                      birhtDate = tgl[0].toString();
                    });
                  }
                });
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
              controller: nomorTeleponInput,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
                hintText: "Nomor Telepon +62",
                // labelText: "Username",
              ),
            ),

            Container(
              margin: EdgeInsets.only(top: 15, bottom: 10),
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.fromLTRB(10, 4, 10, 4),
              decoration: BoxDecoration(border: Border.all(color: Config.borderInput), borderRadius: BorderRadius.circular(40)),
              child: DropdownButton(
                underline: SizedBox(),
                hint: Text(
                  "Jenis Kelamin",
                  style: TextStyle(
                    // color: Config.textGrey,
                    fontFamily: 'BarlowCondensed',
                  ),
                ),
                isExpanded: true,
                value: valGender,
                items: jenisKelaminInput.map((value) {
                  return DropdownMenuItem(
                    child: Text(value),
                    value: value,
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    valGender = value;
                  });
                },
              ),
            ),
            // DropdownButton<String>(
            //   hint: Text('Jenis Kelamin'),
            //   items: <String>['Laki-laki', 'Perempuan'].map((String value) {
            //     return DropdownMenuItem<String>(
            //       value: value,
            //       child: Text(value),
            //     );
            //   }).toList(),
            //   onChanged: (value) {
            //     setState(() {
            //       val
            //     });
            //   },
            // ),
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
                    if (usernameInput.text.isEmpty) {
                      Config.alert(0, 'Username tidak boleh kosong');
                    } else if (emailInput.text.isEmpty) {
                      Config.alert(0, 'Email tidak boleh kosong');
                    } else if (passwordInput.text.isEmpty) {
                      Config.alert(0, 'Password tidak boleh kosong');
                    } else if (birhtDate.toString().isEmpty) {
                      Config.alert(0, 'Tanggal lahir tidak boleh kosong');
                    } else if (nomorTeleponInput.text.isEmpty) {
                      Config.alert(0, 'Nomor Telepon tidak boleh kosong');
                    } else if (valGender.toString().isEmpty) {
                      Config.alert(0, 'Jenis kelamin tidak boleh kosong');
                    } else {
                      regsiter();
                    }
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
    );
  }
}
