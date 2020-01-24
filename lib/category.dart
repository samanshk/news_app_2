import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'NewsPage.dart';


Widget category(categoryData) {
  print('category data $categoryData');
    return Column(
      children: <Widget>[
        Padding(padding: EdgeInsets.all(5),),
        Expanded(
          child: ListView.builder(
            itemCount: categoryData.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(bottom: 14, left: 20, right: 20),
                child: Card(
                  child: ListTile(
                    leading: Image.network(categoryData[index]['category_image'], height: 100, width: 100,),
                    title: Text('      ' + categoryData[index]['category_name'], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                    onTap: () async {
                      var url = 'http://news.raushanjha.in/flutterapi/categorynews.php?cat_id=${categoryData[index]['cid']}';
                      var response = await http.get(Uri.encodeFull(url));
                      var data = json.decode(response.body);

                      Navigator.push(context, MaterialPageRoute(builder: (context) => NewsPage(data, categoryData[index]['category_name'])));
                    },
                  ),
                  
                )
              );
            }
          ),
        ),
      ],
    );
  }