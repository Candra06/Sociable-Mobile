import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sociable/Pages/konten/models/konten_model.dart';
import 'package:sociable/Pages/konten/models/konten_repository.dart';
import 'package:sociable/Pages/konten/widget/video_konten.dart';
import 'package:sociable/helper/config.dart';
import 'package:sociable/helper/network.dart';

class KontenPage extends StatefulWidget {
  @override
  _KontenPageState createState() => _KontenPageState();
}

class _KontenPageState extends State<KontenPage> {
  Future<List<KontenModel>> listModel;
  KontenRepository kontenRepository = KontenRepository();
  bool load = true;

  void getData() async {
    setState(() {
      load = true;
    });

    listModel = kontenRepository.ListKonten();
    setState(() {
      load = false;
    });
  }

  @override
  void initState() {
    getData();

    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'KONTEN',
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
          ),
        ),
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: load
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 138,
                  // color: Colors.white,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 35,
                        ),
                        Container(
                          width: 295,
                          height: 138,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                              image: AssetImage("assets/images/konten/konten_slide1.jpeg"),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            padding: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Color.fromRGBO(100, 100, 100, 99),
                            ),
                            child: Text(
                              'Temukan \nteman baru!',
                              style: GoogleFonts.poppins().copyWith(
                                color: Color(0xffF7F7F7),
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          width: 295,
                          height: 138,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                              image: AssetImage("assets/images/konten/konten_slide2.jpeg"),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            padding: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Color.fromRGBO(100, 100, 100, 99),
                            ),
                            child: Text(
                              'Temukan \npengalaman baru!',
                              style: GoogleFonts.poppins().copyWith(
                                color: Color(0xffF7F7F7),
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: FutureBuilder<List<KontenModel>>(
                    future: listModel,
                    builder: (builder, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else {
                        return snapshot.hasData
                            ? ListView.builder(
                                itemCount: snapshot.data.length,
                                itemBuilder: (BuildContext bc, int i) {
                                  return VideoContentItem(
                                    idVideo: snapshot.data[i].url,
                                    thumbnailVideo: EndPoint.server + '/' + snapshot.data[i].thumbnail,
                                    judulVideo: snapshot.data[i].title,
                                    typeVideo: snapshot.data[i].status == "Premium" ? true : false,
                                    description: snapshot.data[i].description,
                                  );
                                },
                              )
                            : Container(
                                child: Config.emptyData('Belum ada forum', context),
                              );
                      }
                    },
                  ),
                )
              ],
            ),
    );
  }
}
