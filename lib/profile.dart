import 'package:flutter/material.dart';


Widget Profile() {
  return Stack(
    children: <Widget>[
      Container(
        color: Colors.blue[100],
        transform: Matrix4.rotationZ(-.8),
      ),
      Container(
        padding: EdgeInsets.all(30),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 100,
                // child: Image.asset('assets/flutter.png'),
                // backgroundColor: Colors.red,
                backgroundImage: NetworkImage('https://images.pexels.com/photos/459225/pexels-photo-459225.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
              ),
              Padding(padding: EdgeInsets.all(20)),
              Text('Name', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
              Padding(padding: EdgeInsets.all(20)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text('100', style: TextStyle(fontSize: 20)),
                      Text('Articles')
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text('60K', style: TextStyle(fontSize: 20)),
                      Text('Followers')
                    ],
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.all(20),),
              MaterialButton(
              onPressed: () {},
              color: Colors.blue,
              child: Text(
                'Follow',
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white,fontSize: 20)
              ),
              padding: EdgeInsets.all(10),
            ),
            ],
          ),
        ),
      )
    ],
  );
}