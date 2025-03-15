import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<bool> _isHover = [false, false, false];

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black87,
          actions: [
            SizedBox(
              width: 500,
              child: Row(
                children: [
                  SizedBox(
                    width: 100,
                    child: TextButton(
                        onPressed: () {},
                        onHover: (isHover) {
                          setState(() {
                            _isHover[0] = isHover;
                          });
                        },
                        style: TextButton.styleFrom(padding: EdgeInsets.zero),
                        child: Text(
                          "Company",
                          style: TextStyle(
                              color: _isHover[0] ? Colors.deepPurpleAccent : Color(0xff666666),
                              fontSize: _isHover[0] ? 15 : 14,
                              fontWeight: _isHover[0] ? FontWeight.w600 : FontWeight.w400),
                        )),
                  ),
                  const Gap(10),
                  SizedBox(
                    width: 100,
                    child: TextButton(
                        onPressed: () {},
                        onHover: (isHover) {
                          setState(() {
                            _isHover[1] = isHover;
                          });
                        },
                        style: TextButton.styleFrom(padding: EdgeInsets.zero),
                        child: Text(
                          "Product",
                          style: TextStyle(
                              color: _isHover[1] ? Colors.deepPurpleAccent : Color(0xff666666),
                              fontSize: _isHover[1] ? 15 : 14,
                              fontWeight: _isHover[1] ? FontWeight.w600 : FontWeight.w400),
                        )),
                  ),
                  const Gap(10),
                  SizedBox(
                    width: 100,
                    child: TextButton(
                        onPressed: () {},
                        onHover: (isHover) {
                          setState(() {
                            _isHover[2] = isHover;
                          });
                        },
                        style: TextButton.styleFrom(padding: EdgeInsets.zero),
                        child: Text(
                          "Contact",
                          style: TextStyle(
                              color: _isHover[2] ? Colors.deepPurpleAccent : Color(0xff666666),
                              fontSize: _isHover[2] ? 15 : 14,
                              fontWeight: _isHover[2] ? FontWeight.w600 : FontWeight.w400),
                        )),
                  ),
                ],
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.sizeOf(context).height,
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(gradient: RadialGradient(
                    // begin: Alignment.topLeft,
                    // end: Alignment.bottomRight,
                    colors: [Colors.black87, Colors.black87, Colors.deepPurple, Colors.black87, Colors.black])),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        // height: MediaQuery.sizeOf(context).height,
                        child: Text(
                          "Welcome to",
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        )),
                    SizedBox(
                        // height: MediaQuery.sizeOf(context).height,
                        child: Text(
                          "DevOn Universe",
                          style: TextStyle(color: Colors.white, fontSize: 80, fontWeight: FontWeight.w600,),
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
        ));
  }
}
