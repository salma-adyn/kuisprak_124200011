import 'package:flutter/material.dart';
import 'package:kuispraktikum/books_data.dart';

class DetailScreen extends StatefulWidget {
  final int albumIdx ;

  const DetailScreen({Key? key, required this.albumIdx}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  bool toggle = false;

  Widget build(BuildContext context) {
    final BooksData books_data = booksDataList[widget.albumIdx];
    return Scaffold(
        appBar: AppBar(
          title: Text(books_data.title),
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: IconButton(
                icon:
                toggle ? Icon(Icons.favorite_border) : Icon(Icons.favorite),
                onPressed: () {
                  setState(() {
                    toggle = !toggle;
                  });
                },
              ),
            )
          ],
        ),
        body: ListView(
          children: [
              Center(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Image.network(books_data.imageLinks, width: 100),
                    ),
                    SizedBox(height: 20),
                    Text(
                      books_data.title,
                      style:
                      TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    Text("Author : ${books_data.authors}",
                      style:
                      TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    Text("Tanggal Rilis : ${books_data.publishedDate}",
                      style:
                      TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    Text("Kategori : ${books_data.categories}",
                      style:
                      TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 7),
                    Text(books_data.description,
                      style:
                      TextStyle(fontSize: 15, height: 1.5),
                    ),
                  ]
                ),
              ),
            ],
          ),
        );
    }
}
