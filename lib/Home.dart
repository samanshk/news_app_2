import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:news/Settings.dart';
// import 'package:news/category.dart';

import 'package:news/news.dart';
import 'category.dart';
import 'post.dart';
import 'profile.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _currentIndex = 0;
  var data, categoryData, title = '', newsTitle = 'General';
  var url = 'http://news.raushanjha.in/flutterapi/news';
  var categoryUrl = 'http://news.raushanjha.in/flutterapi/category';

  
  void changeBrightness() {
    DynamicTheme.of(context).setBrightness(Theme.of(context).brightness == Brightness.dark? Brightness.light: Brightness.dark);
  }

  Future<String> getJsonData() async {
    var response = await http.get(Uri.encodeFull(url));
    var catresponse = await http.get(Uri.encodeFull(categoryUrl));
    setState(() {
      data = json.decode(response.body);
      categoryData = json.decode(catresponse.body);
    });

      print(categoryData);
  }

  @override
  void initState() {
    // checkConnected();
    getJsonData();
    super.initState();
  }

  categorySelector(i) {
    switch (i) {
      case 0:
        // setState(() {
        //   newsTitle = 'Write an article';
        // });
        break;
      case 1:
        title = 'Categories';
        // _categories();
        setState(() {
          title = 'Categories';
        });
        break;
      case 2:
        return ;
        break;
      case 3:
        setState(() {
          title = 'Write an article';
        });
        // return Post();
        break;
      case 4:
        setState(() {
          title = 'Profile';
        });
        break;
      case 5:
        setState(() {
          title = 'Settings';
        });
        break;
    }
  }

  bodySelector() {
    switch (_currentIndex) {
      case 0:
        return data != null ? News(data) : null;
        break;
      case 1:
        return category(categoryData);
        break;
      case 2:
        return ;
        break;
      case 3:
        return Settings(changeBrightness);
        break;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _currentIndex == 0 ? Text(newsTitle) : Text(title),
      ),
      body: bodySelector(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.live_tv),
            title: Text('TV'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_applications),
            title: Text('Settings'),
          ),
        ],
        showUnselectedLabels: true,        
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.amber[800],
        onTap: (int i) {
          categorySelector(i);
          setState(() {
            _currentIndex = i;
          });
        },
      ),
    );
  }



  // Future<void> _categories() async {
  //   return showDialog<void>(
  //     context: context,
  //     barrierDismissible: false, // user must tap button!
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: Text('Categories', textAlign: TextAlign.center),
  //         content: ListView.builder(
  //           itemCount: categoryData.length,
  //           itemBuilder: (context, index) {
  //             return Container(
  //               margin: EdgeInsets.only(bottom: 14),
  //               child: Card(
  //                 child: ListTile(
  //                   leading: Image.network(categoryData[index]['category_image'], height: 100, width: 100,),
  //                   title: Text(categoryData[index]['category_name'], style: TextStyle(fontWeight: FontWeight.bold),),
  //                   onTap: () {
  //                     setState(() {
  //                       url = 'http://news.raushanjha.in/flutterapi/categorynews.php?cat_id=${categoryData[index]['cid']}';
  //                       // switch (categoryData[index]['cid']) {
  //                       //   case "12":
  //                       //     url = 'http://news.raushanjha.in/flutterapi/categorynews.php?cat_id=12';
  //                       //     break;
  //                       //   case "13":
  //                       //     url = 'http://news.raushanjha.in/flutterapi/categorynews.php?cat_id=13';
  //                       //     break;
  //                       //   case "14":
  //                       //     url = 'http://news.raushanjha.in/flutterapi/categorynews.php?cat_id=14';
  //                       //     break;
  //                       //   case "15":
  //                       //     url = 'http://news.raushanjha.in/flutterapi/categorynews.php?cat_id=15';
  //                       //     break;
  //                       //   case "16":
  //                       //     url = 'http://news.raushanjha.in/flutterapi/categorynews.php?cat_id=16';
  //                       //     break;
  //                       //   default:
  //                       // }
  //                       getJsonData();
  //                       Navigator.pop(context);
  //                       newsTitle = categoryData[index]['category_name'];
  //                       _currentIndex = 0;
  //                     });
  //                   },
  //                 ),
  //               ),
  //             );
  //           },
  //         ) 
          
          // SingleChildScrollView(
          //   child: ListBody(
          //     children: <Widget>[
          //       ListTile(
          //         leading: Icon(Icons.people),
          //         title: Text('General'),
          //         onTap: () {
          //           setState(() {
          //             url = 'https://newsapi.org/v2/top-headlines?country=in&category=general&apiKey=26d5eb07ed2f458db0e112b59c24eb16';
          //             getJsonData();
          //             Navigator.pop(context);
          //             newsTitle = 'General';
          //             _currentIndex = 0;
          //           });
          //         },
          //       ),
          //       ListTile(
          //         leading: Icon(Icons.business_center),
          //         title: Text('Business'),
          //         onTap: () {
          //           setState(() {
          //             url = 'https://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=26d5eb07ed2f458db0e112b59c24eb16';
          //             getJsonData();
          //             Navigator.pop(context);
          //             newsTitle = 'Business';
          //             _currentIndex = 0;
          //           });
          //         },
          //       ),
          //       ListTile(
          //         leading: Icon(Icons.directions_bike),
          //         title: Text('Sports'),
          //         onTap: () {
          //           setState(() {
          //             url = 'https://newsapi.org/v2/top-headlines?country=in&category=sports&apiKey=26d5eb07ed2f458db0e112b59c24eb16';
          //             getJsonData();
          //             Navigator.pop(context);
          //             newsTitle = 'Sports';
          //             _currentIndex = 0;
          //           });
          //         },
          //       ),
          //       ListTile(
          //         leading: Icon(Icons.healing),
          //         title: Text('Health'),
          //         onTap: () {
          //           setState(() {
          //             url = 'https://newsapi.org/v2/top-headlines?country=in&category=health&apiKey=26d5eb07ed2f458db0e112b59c24eb16';
          //             getJsonData();
          //             Navigator.pop(context);
          //             newsTitle = 'Health';
          //             _currentIndex = 0;
          //           });
          //         },
          //       ),
          //       ListTile(
          //         leading: Icon(Icons.movie_filter),
          //         title: Text('Entertainment'),
          //         onTap: () {
          //           setState(() {
          //             url = 'https://newsapi.org/v2/top-headlines?country=in&category=entertainment&apiKey=26d5eb07ed2f458db0e112b59c24eb16';
          //             getJsonData();
          //             Navigator.pop(context);
          //             newsTitle = 'Entertainment';
          //             _currentIndex = 0;
          //           });
          //         },
          //       ),
          //       ListTile(
          //         leading: Icon(Icons.ac_unit),
          //         title: Text('Science'),
          //         onTap: () {
          //           setState(() {
          //             url = 'https://newsapi.org/v2/top-headlines?country=in&category=science&apiKey=26d5eb07ed2f458db0e112b59c24eb16';
          //             getJsonData();
          //             Navigator.pop(context);
          //             newsTitle = 'Science';
          //             _currentIndex = 0;
          //           });
          //         },
          //       ),
          //       ListTile(
          //         leading: Image.network(src),
          //         title: Text('Technology'),
          //         onTap: () {
          //           setState(() {
          //             url = 'https://newsapi.org/v2/top-headlines?country=in&category=technology&apiKey=26d5eb07ed2f458db0e112b59c24eb16';
          //             getJsonData();
          //             Navigator.pop(context);
          //             newsTitle = 'Technology';
          //             _currentIndex = 0;
          //           });
          //         },
          //       ),
          //     ],
          //   ),
          // ),
  //       );
  //     },
  //   );
  // }
}