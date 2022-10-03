import 'package:flutter/material.dart';
import 'package:kuispraktikum/books_data.dart';
import 'detail_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Daftar Buku"),
      ),
      body:
      GridView.builder(
        gridDelegate:
        SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, index) {
          final BooksData place = booksDataList[index];
          return InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailScreen(albumIdx: index);
              })
              );
            },
            child: Container(
              padding: const EdgeInsets.fromLTRB(50, 15, 50, 15),
              child: Card(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Colors.redAccent.shade700,
                  ),
                  borderRadius: BorderRadius.circular(25.0),
                ),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 10,),
                    Image.network(place.imageLinks, width: 600, height: 200,),
                    SizedBox(height: 15,),
                    Text(place.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        // fontSize: 40,
                      ),),
                  ]
                ),
              ),
            ),
          );
        },
        itemCount: booksDataList.length,
      ),
    );
  }
}