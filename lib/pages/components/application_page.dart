import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ApplicationPage extends StatelessWidget {
  const ApplicationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints){
      return Container(
        decoration: BoxDecoration(
          gradient: SweepGradient(colors: [Colors.deepPurple, Colors.black,Colors.deepPurple])
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: constraints.maxWidth.toDouble() / 2,
              height: 200,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(10)
              ),
              child: Row(
                children: [
                  SizedBox(
                    child: Image.asset("assets/images/icon.png", fit: BoxFit.cover,),
                  ),
                  const Gap(20),
                  SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Ready Go (IOS, Android)", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),),
                        const Gap(10),
                        Text("여행 준비를 한번에!", style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),),
                        Text("항공권, 체크리스트, 로밍, 경비, 숙소 정보를 기록하고 바로바로 확인하세요..", style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),),
                        Text("여행관련 기록과 준비물 경비까지 한번에 기록하고 확인하세요.", style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),)
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
    );
  }
}
