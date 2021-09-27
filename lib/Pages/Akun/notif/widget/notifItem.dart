import 'package:flutter/material.dart';
class NotifItem extends StatelessWidget {
  final String isiNotif;

  NotifItem(this.isiNotif);
  // const NotifItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(top: 10,left: 20,right: 20),
      child: Container(
        width: double.infinity,

        padding: EdgeInsets.all(10),
        child: Text(isiNotif),
      ),
    );
  }
}
