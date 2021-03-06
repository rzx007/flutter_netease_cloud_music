import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './provider/count.dart';
import './provider/find/new_dish.dart';
import './provider/current_index.dart';
import './provider/song_list/song_detail.dart';
// void main() => runApp(MyApp());
import './splash_screen.dart';
import 'package:fluro/fluro.dart';
import './routers/routes.dart';
import './routers/application.dart';

// void main() => runApp(ChangeNotifierProvider(
//     builder: (context) => CounterBloc(), child: MyApp()));

void main() {
  Provider.debugCheckInvalidValueType = null;
  // var counter = CounterBloc();
  // var newDish = NewDishProvider();
  // runApp(MultiProvider(
  //   providers: [
  //     Provider<CounterBloc>.value(value: counter),
  //     Provider<NewDishProvider>.value(value: newDish),
  //     // ChangeNotifierProvider(builder: (_) => NewDishProvider()),
  //   ],
  //   child: MyApp(),
  // ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // 注册路由
    final router = Router();
    Routes.configureRoutes(router);
    Application.router = router;

    var counter = CounterBloc();
    // var newDish = NewDishProvider();
    return MultiProvider(
      providers: [
        Provider<CounterBloc>.value(value: counter),
        // Provider<T>管理恒定数据不通知视图刷新
        // Provider<NewDishProvider>.value(value: newDish),
        ChangeNotifierProvider(builder: (_) => NewDishProvider()),
        ChangeNotifierProvider(builder: (_) => CurrentIndexProvider()),
        ChangeNotifierProvider(builder: (_) => SongDetailProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: '网易云音乐(仿)',
        theme: ThemeData(
          primaryColor: Colors.white,
        ),
        home: SplashScreen(),
      ),
    );
  }
}
