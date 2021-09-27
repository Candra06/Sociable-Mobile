import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sociable/Pages/Membership/membership.dart';

class VideoContentItem extends StatelessWidget {

  String thumbnailVideo;
  String judulVideo;
  String typeVideo;
  String urlVideo;

  VideoContentItem(this.thumbnailVideo,this.judulVideo,this.typeVideo,this.urlVideo);
  // const VideoContentItem({
  //   Key? key,
  // }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(

      onTap: (){
        if(typeVideo == "Premium"){
          Navigator.of(context).push(MaterialPageRoute(builder: (context){
            return MemberShipPage();
          }));
        }
      },
      child: Card(
        elevation: 0,
        margin: EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        ),
        
        child: Container(
          padding: EdgeInsets.only(left: 10),
          width: double.infinity,
          // height: 93.41,
          child: Row(
            children: [
              Container(
                width: 92.22,
                height: 67.72,

                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 0,
                        blurRadius: 30,
                        offset: Offset(0, 6), // changes position of shadow
                      ),
                    ],
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(image: AssetImage(thumbnailVideo.toString(),),fit: BoxFit.cover)
                ),
                child: Flexible(
                  fit: FlexFit.tight,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color.fromRGBO(225, 225,225, 99)
                    ),
                    child: Center(child: Center(child: Icon(Icons.slow_motion_video_outlined),),
                  ),
                )
                ),
              ),
              SizedBox(width: 10,),
              Flexible(
                fit: FlexFit.tight,
                child: Container(
                  padding: EdgeInsets.only(top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          if(typeVideo == "Premium")
                            Container(
                              width: 70,height: 20,
                              padding: EdgeInsets.symmetric(vertical: 3),
                              decoration:BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.circular(28)
                              ),
                              child: Center(child: Text(typeVideo,style: TextStyle(fontSize: 12),),),
                            )
                          else
                            Container(
                              width: 70,height: 20,
                              padding: EdgeInsets.symmetric(vertical: 3),
                              decoration:BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(28)
                              ),
                              child: Center(child: Text(typeVideo,style: TextStyle(fontSize: 12),),),
                            ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Text(judulVideo,
                        style: TextStyle(fontSize: 14),)
                    ],
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