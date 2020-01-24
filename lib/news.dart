import 'package:flutter/material.dart';

import 'Article.dart';

Widget News(data) {
  print('hahahahaahahah');
  print(data.length);
  if (data.length == 0) {
    return Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[Text('No articles available in this category')],));
  }
  return ListView.builder(
    itemCount: data.length,
    itemBuilder: (context, index) {
      return GestureDetector(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            Container(
              height: 250,
              width: double.infinity,
              child: data[index]['news_image'] == null ? Image.asset('assets/blank.png') : Image.network(data[index]['news_image'], fit: BoxFit.cover,)            
            ),
            Container(
              color: Color.fromRGBO(0, 0, 0, 0.2),
              padding: EdgeInsets.all(5),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Padding(padding: EdgeInsets.all(100),),
                  Text(data[index]['news_title'], style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold)),
                  // Text(data[index]['source']['name'], style: TextStyle(fontSize: 10, color: Colors.white,))
                ],
              ),
            )
          ],
        ),
        onTap: (){
          if (data[index]['news_description'] != null) {
            Navigator.push(context, 
              MaterialPageRoute(builder: (context) => Article(data[index]))
            );
          }
        },
      );
      
    }
  );
}