import 'package:flutter/material.dart';

class SearchLayout extends StatelessWidget {
  TextEditingController searchInput = new TextEditingController();
  // const SearchLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(20),
            child: Padding(
              padding: const EdgeInsets.only(left: 8,right: 8),
              child: Column(
                children: [
                  TextField(
                    controller: searchInput,
                    autofocus: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40)
                      ),
                      prefixIcon: IconButton(
                        onPressed: (){
                          Navigator.of(context).pop();
                        },
                        icon: Icon(Icons.arrow_back),
                      ),
                      suffixIcon: IconButton(
                        onPressed: (){},
                        icon: Icon(Icons.search),
                      ),
                      hintText: "search",
                      // labelText: "Username",
                    ),
                  ),
                SizedBox(height: 10,)
                ]
              ),
            ),
          ),

          backgroundColor: Colors.white,
        )
      ),
    );
  }
}
