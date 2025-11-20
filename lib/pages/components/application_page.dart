import 'package:devon_studio_web/pages/support_page.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ApplicationPage extends StatelessWidget {
  const ApplicationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        decoration:
            BoxDecoration(gradient: SweepGradient(colors: [Colors.deepPurple, Colors.black, Colors.deepPurple])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: constraints.maxWidth.toDouble() / 2,
              height: 200,
              padding: EdgeInsets.all(20),
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.white), borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  SizedBox(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        "assets/images/readygo_icon.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const Gap(20),
                  SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Ready Go (IOS, Android)",
                          style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        const Gap(10),
                        Text(
                          "여행 준비를 한번에!",
                          style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "항공권, 체크리스트, 로밍, 경비, 숙소 정보를 기록하고 바로바로 확인하세요..",
                          style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "여행관련 기록과 준비물 경비까지 한번에 기록하고 확인하세요.",
                          style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                        const Gap(10),
                        SizedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(
                                  child: TextButton.icon(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => const SupportPage(
                                                      title: "Ready Go",
                                                    )));
                                      },
                                    label: Text(
                                      '고객지원',
                                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                                    ),
                                    icon: Icon(Icons.arrow_forward),
                                    iconAlignment: IconAlignment.end,
                                  ))
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            const Gap(20),
            Container(
              width: constraints.maxWidth.toDouble() / 2,
              height: 200,
              padding: EdgeInsets.all(20),
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.white), borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  SizedBox(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        "assets/images/testus_icon.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const Gap(20),
                  SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "TESTUS (IOS, Android)",
                          style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        const Gap(10),
                        Text(
                          "테스터를 모집과 서비스를 홍보를 위한 개발자를 위한 앱. ",
                          style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                        // Text("테스터 모집에 힘들고 서비스 마케팅은 막막하죠. 그래서 TESTUS를 만들었습니다.", style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),),
                        Text(
                          "나만의 서비스에 테스터를 모집하고 테스터로 활동하며 인사이트를 얻어보세요.",
                          style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "TESTUS의 궁극적 목표는 소통하면 함께 성장하는 공간을 만들고자 함입니다.",
                          style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                        const Gap(10),
                        SizedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(
                                child: TextButton.icon(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => const SupportPage(
                                                  title: "TESTUS",
                                                )));
                                  },
                                  label: Text(
                                    '고객지원',
                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                                  ),
                                  icon: Icon(Icons.arrow_forward),
                                  iconAlignment: IconAlignment.end,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      );
    });
  }
}
