import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:provider/provider.dart';
import 'package:stl/Model/Store.dart';
import 'package:stl/Screen/pre_oredr_screen.dart';
import 'package:stl/Widget/bannerShowcase.dart';
import 'package:stl/Widget/mainAppBar.dart';
import 'package:stl/Widget/profileBox.dart';
import 'package:stl/Widget/roundedButton.dart';
import 'package:stl/Widget/stlpassShowcase.dart';
import 'package:stl/constraint.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Size _size = getSize(context);
    double _widgetWidth = _size.width * 0.85;

    return SingleChildScrollView(
        child: Container(
            margin: EdgeInsets.symmetric(
                horizontal: _size.width * 0.075), // 가로길이 7.5%만큼의 좌우 여백
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top *
                    1.5), //상단바 1.5배높이만큼의 위 여백
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MainAppBar(), //앱바
                SizedBox(height: _size.height * 0.03), //위젯과 위젯 사이 여백
                BannerShowcase(), //배너 슬라이드쇼
                SizedBox(height: _size.height * 0.03),
                ProfileBox(), //프로필, 할인 받기 버튼
                SizedBox(height: _size.height * 0.03),
                STLPASSShowcase(), //보유 중인 정기권을 보여주는 슬라이드쇼
                SizedBox(height: _size.height * 0.03),
                Row(
                  children: [
                    Expanded(
                      child: RoundedButton(
                        title: "구독권 공유",
                        onTap: () => Navigator.pushNamed(context, '/sharing'),
                      ),
                    ),
                    SizedBox(
                      width: _widgetWidth * 0.05,
                    ),
                    Expanded(
                        child: RoundedButton(
                      title: "STL 배달",
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return PreOrderScreen(isDelivery: true);
                        }));
                      },
                    ))
                  ],
                ),
                SizedBox(height: _size.height * 0.03),
                RoundedButton(
                  title: "미리 주문",
                  onTap: () => Navigator.pushNamed(context, '/pre_order'),
                ),
                SizedBox(height: _size.height * 0.03),
              ],
            )));
  }
}
