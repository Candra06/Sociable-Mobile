import 'package:flutter/material.dart';
import 'package:sociable/Pages/Challenges/detail_challenges/detailChallanges.dart';

class ChallengesItem extends StatelessWidget {
  final int idChallenges;
  final String titleChallenges;
  final bool isDone;

  ChallengesItem(this.idChallenges,this.titleChallenges,this.isDone);
  // const ChallengesItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          onPrimary: Colors.grey
        ),
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context){
            return DetailChallanges(idChallenges, titleChallenges, isDone);
          }));
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15)
          ),
          margin: EdgeInsets.all(10),
          child: Container(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  fit:FlexFit.tight,
                  child: Container(
                    color: Colors.white,
                    child: Text("haloo ini challenges",style: TextStyle(color: Colors.black),),
                  ),
                ),
                if(isDone == true)  Icon(Icons.check_circle,size: 50,color: Colors.green,)
                else
                  Icon(Icons.circle_outlined,size: 50,color: Colors.green,)
              ],
            ),
          ),
        )
    );
  }
}
