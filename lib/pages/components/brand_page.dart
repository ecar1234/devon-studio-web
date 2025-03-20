import 'package:flutter/material.dart';

class BrandPage extends StatelessWidget {
  const BrandPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
        gradient: SweepGradient(colors: [Colors.deepPurple, Colors.black,Colors.deepPurple])
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("브랜드 개발 준비 중입니다.", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20),)
      ],
    )
    );
  }
}
