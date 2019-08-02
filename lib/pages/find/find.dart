/*
 * @Author: wangzhongjie
 * @Date: 2019-02-18 17:08:30
 * @LastEditors: wangzhongjie
 * @LastEditTime: 2019-08-02 14:54:58
 * @Description: 发现
 * @Email: uvdream@163.com
 */
import 'package:flutter/material.dart';
import './search.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './swipper.dart';
import './top_navigation.dart';
import './recommend_song_list.dart';
import './new_dish.dart';
import '../../components/play.dart';

class FindPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        leading: InkWell(
          onTap: () {},
          child: Container(
            // color: Colors.green,
            child: Icon(
              IconData(0xe64f, fontFamily: 'IconFont'),
              size: 25,
            ),
          ),
        ),
        title: SearchArea(),
        elevation: 0,
        centerTitle: true,
        actions: <Widget>[PlayButton()],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                SwiperPage(),
                TopNavigation(),
                RecommendSongList(),
                NewDishPage()
              ],
            ),
          )
        ],
      ),
    );
  }
}
