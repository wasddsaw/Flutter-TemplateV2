import 'package:blog_mobile/Class/Chat/chat.dart';
import 'package:blog_mobile/Class/Counter/counter.dart';
import 'package:blog_mobile/Class/Home/home.dart';
import 'package:blog_mobile/Class/Http/http.dart';
import 'package:get/route_manager.dart';

const String routeHome = '/';
const String routeCounter = '/counter';
const String routeHttp = '/http';
const String routeChat = '/chat';

mixin AppRoutes {
  final List<GetPage> generateRoutes = [
    GetPage(
      name: routeHome,
      page: () => const Home()
    ),
    GetPage(
      name: routeCounter, 
      page: () => const Counter()
    ),
    GetPage(
      name: routeHttp, 
      page: () => const Http()
    ),
    GetPage(
      name: routeChat, 
      page: () => const Chat()
    )
  ];
}

// https://github.com/abuanwar072/20-Error-States-Flutter