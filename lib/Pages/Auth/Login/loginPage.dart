import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sociable/Pages/Auth/Registrasi/diagnosa.dart';
import 'package:sociable/Pages/Auth/authModel.dart';
import 'package:sociable/Pages/Auth/auth_repository.dart';
import 'package:sociable/helper/config.dart';
import 'package:sociable/helper/route.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var obsuced = true;

  TextEditingController txtUsername = new TextEditingController();
  TextEditingController txtPassword = new TextEditingController();
  Auth auth = new Auth();
  AuthRepository repository = AuthRepository();

  void submitLogin() async {
    setState(() {
      Config.loading(context);
    });
    auth.username = txtUsername.text;
    auth.password = txtPassword.text;

    dynamic respon =
        await repository.loginProses(auth).then((value) => {auth = value});
    bool res;
    if (respon != null) {
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setString('username', auth.username);
      pref.setString('email', auth.email);
      pref.setString('phone', auth.phone);
      pref.setString('role', auth.role.toString());
      pref.setString('token', auth.token);
      pref.setString('gender', auth.gender);
      pref.setString('membership', auth.membership.toString());
      pref.setString('birthDate', auth.birthDate.toString());
      Config.alert(1, 'Login berhasil');
      Navigator.pop(context);
      if (auth.levelDiagnosa == null) {
        res = await repository.createChallenge();
        pref.setString('level_diagnosa', '-');
        pref.setString('isDiagnosa', 'true');
        setState(() {
          Navigator.of(context)
              .pushReplacement(MaterialPageRoute(builder: (context) {
            return DiagnosaPage();
          }));
        });
      } else {
        pref.setString('level_diagnosa', auth.levelDiagnosa);
        pref.setString('isDiagnosa', 'false');
        setState(() {
          Navigator.pushNamed(context, Routes.HOME);
        });
      }
    } else {
      print('object');
      Navigator.pop(context);
    }
    Config.emptyData('Forum masih kosong', context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.only(right: 30, left: 30),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage("assets/images/logo.png"),
                  width: 181,
                  height: 195,
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  autofocus: false,
                  controller: txtUsername,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40)),

                    hintText: "Username",
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
                  controller: txtPassword,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40)),
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
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (txtUsername.text.isEmpty) {
                      return Config.alert(0, 'Username tidak boleh kosong');
                    } else if (txtPassword.text.isEmpty) {
                      return Config.alert(0, 'Password tidak boleh kosong');
                    } else {
                      submitLogin();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(155, 45),
                    primary: Config.darkPrimary,
                    onPrimary: Config.textWhite,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                  ),
                  child: Text(
                    "Masuk",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                Builder(
                  builder: (context) => Center(
                    child: FlatButton(
                      child: Text("Belum Punya Akun?"),
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.REGISTER);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
