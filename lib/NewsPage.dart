import 'package:flutter/material.dart';

import 'Article.dart';

class NewsPage extends StatefulWidget {
  var data, title;
  NewsPage(this.data, this.title);
  @override
  _NewsPageState createState() => _NewsPageState(data, title);
}

class _NewsPageState extends State<NewsPage> {
  var data, title;
  _NewsPageState(this.data, this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
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
      ),
    );
  }
}