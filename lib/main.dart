import 'package:flutter/material.dart';
import 'package:request/request.dart';
import 'package:request/shared/components/constants.dart';
import 'package:request/shared/network/local/cache_helper.dart';
import 'package:request/shared/network/remote/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  await CacheHelper.init();

  LINK = CacheHelper.getData(key: 'link') == null
      ? ''
      : CacheHelper.getData(key: 'link');
  print('link $LINK');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      home: RequestScreen(),
    );
  }
}
