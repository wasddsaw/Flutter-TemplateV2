import 'dart:convert';

import 'package:blog_mobile/Component/ShowDialog/loading_dialog.dart';
import 'package:blog_mobile/Services/Webservice/Model/Posts/posts.dart';
import 'package:blog_mobile/Services/Webservice/api_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:logger/logger.dart';
import 'package:dio/dio.dart' as dio;

late ApiManager apiManager;
List<Posts>? postData;

class Http extends StatefulWidget {
  const Http({ Key? key }) : super(key: key);

  @override
  _HttpState createState() => _HttpState();
}

class _HttpState extends State<Http> {

  Future onGetPosts() async {
    Future.delayed(Duration.zero, () => (LoadingDialog().init(context: context)));
    await apiManager.getPosts().then((res) {
      Navigator.of(context).pop();
      onReadResponse(true, res);
    }).catchError((res) {
      Navigator.of(context).pop();
      onReadResponse(false, res);
    });
  }

  void onReadResponse(bool status, res) {
    if (status) {
      Logger().d(const JsonEncoder.withIndent('  ').convert(res));
      setState(() { postData = res; });
    } else {
      switch (res.runtimeType) {
        case dio.DioError:
          final err = (res as dio.DioError).response;
          Logger().d('Error : ${err?.statusCode} -> ${err?.statusMessage}');
          break;
        default:
      }
    }
  }

  @override
  void initState() {
    super.initState();
    apiManager = ApiManager(dio.Dio());

    onGetPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('http' .tr)),
      body: ListView.separated(
        primary: false,
        itemCount: postData?.length ?? 0,
        itemBuilder:(context, index){
          return ListTile(
            title: Text(postData![index].title!),
            subtitle: Text(postData![index].body!),
            onTap: () {
              
            },
          );
        },
        separatorBuilder: (context, index) {
          return const Divider();
        },
      ),
    );
  }
}