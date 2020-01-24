import 'package:flutter/material.dart';

Widget Post() {
  return SingleChildScrollView(
    child: Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Padding(padding: EdgeInsets.all(40),),
          Text(
            'Write an article',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.left,
          ),
          Padding(padding: EdgeInsets.all(10)),
          TextField(
            decoration: InputDecoration(
              hintText: 'Name',
              icon: Icon(Icons.person, color: Colors.blue,),
            ),
          ),
          Padding(padding: EdgeInsets.all(10)),
          TextField(
            decoration: InputDecoration(
              hintText: 'Date',
              icon: Icon(Icons.date_range, color: Colors.blue,),
            ),
          ),
          Padding(padding: EdgeInsets.all(10)),
          TextField(
            decoration: InputDecoration(
              hintText: 'Title',
              icon: Icon(Icons.text_fields, color: Colors.blue,),
            ),
          ),
          Padding(padding: EdgeInsets.all(10)),
          TextField(
            decoration: InputDecoration(
              hintText: 'Content',
              icon: Icon(Icons.text_format, color: Colors.blue,),
            ),
            minLines: 5,
            maxLines: 10,
          ),
          Padding(padding: EdgeInsets.all(10)),
          MaterialButton(
              onPressed: () {},
              color: Colors.blue,
              child: Text(
                'Post',
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white,fontSize: 20)
              ),
          )
        ],
      ),
    )
  );
}