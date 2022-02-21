import 'package:blog_mobile/Services/Routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var list = [
    {
      'id': 0,
      'title': 'Counter App'
    },
    {
      'id': 1,
      'title': 'Http'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('home' .tr)),
      body: ListView.builder(
        primary: false,
        itemCount: list.length,
        itemBuilder: (context, index) {
          final title = list[index]['title'] as String;
          final id = list[index]['id'];
          return Container(
            padding: const EdgeInsets.only(left: 4.0, right: 4.0),
            child: Card(
              child: ListTile(
                title: Text(title),
                onTap: () {
                  switch (id) {
                    case 0:
                      Get.toNamed(routeCounter);
                      break;
                    case 1:
                      Get.toNamed(routeHttp);
                      break;
                    default:
                  }
                }
              ),
            ),
          );
        }
      ),
    );
  }
}