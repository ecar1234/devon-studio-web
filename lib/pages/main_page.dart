import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MainPage extends StatefulWidget {
  final Function(String) onNavigate;
  const MainPage({super.key, required this.onNavigate});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  final List<bool> _isVisible = [false, false, false];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if(mounted){
        _startAni();
      }
    } );
  }
  void _startAni()async{
    for(var i = 0; i < 3; i++){
      await Future.delayed(const Duration(milliseconds: 500));
      setState(() {
        _isVisible[i] = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(gradient: RadialGradient(
                colors: [Colors.black87, Colors.black87, Colors.deepPurple, Colors.black87, Colors.black])),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedOpacity(
                    opacity: _isVisible[0] ? 1 : 0,
                    duration: Duration(milliseconds: 1500),
                    child: Text(
                      "Welcome to",
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    )),
                AnimatedOpacity(
                    opacity: _isVisible[1] ? 1 : 0,
                    duration: Duration(milliseconds: 500),
                    child: Text(
                      "DevOn Universe",
                      style: TextStyle(color: Colors.white, fontSize: 80, fontWeight: FontWeight.w600,),
                    )),
                AnimatedOpacity(
                    opacity: _isVisible[2] ? 1 : 0,
                    duration: Duration(milliseconds: 500),
                    child: Text(
                      "-Studio-",
                      style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.w600,letterSpacing: 50),
                    )),
              ],
            ),
          ),
          Container(
            height: 300,
            width: MediaQuery.sizeOf(context).width,
            color: Colors.black87,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 1024,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("사업자 등록번호 : 580-05-03207 / 대표 : 김종관", style: TextStyle(color: Color(0xff888888), fontSize: 18),),
                      const Gap(10),
                      Text("주소 : 경기도 광주시 경안천로 91 / 이메일 : ecar1234@naver.com", style: TextStyle(color: Color(0xff888888), fontSize: 18),)
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
