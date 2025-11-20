import 'package:flutter/material.dart';

class CompanyPage extends StatefulWidget {
  const CompanyPage({super.key});

  @override
  State<CompanyPage> createState() => _CompanyPageState();
}

class _CompanyPageState extends State<CompanyPage> {
  List<bool> _isLoaded = [false, false];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startAni();
    });
  }

  void _startAni() async {
    for (var i = 0; i < 2; i++) {
      await Future.delayed(const Duration(milliseconds: 800));
      if (mounted) {
        setState(() {
          _isLoaded[i] = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        return Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.black, Colors.black, Colors.deepPurple])),
          child: Center(
            child: SizedBox(
              width: constraints.maxWidth / 1.5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedOpacity(
                    opacity: _isLoaded[0] ? 1 :0,
                    duration: Duration(milliseconds: 500),
                    child: SizedBox(
                      height: 300,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Make a part of life!",
                                style: TextStyle(color: Colors.white, fontSize: 80, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                  width: 600,
                                  // height: 500,
                                  child: Text(
                                    "DevOn Studio는 1인 개발로 시작하여 우리 삶의 필요한 것들과 익숙하지만 불편한 것들을 찾고, "
                                    "조금 더 삶을 편리하게 바꾸는 것을 가장 중요한 가치관으로 개발에 임하고 있습니다."
                                    "사람들은 지금까지의 익숙함으로 인하여 불편함을 느끼고 있지만, 불편함을 인지 하지 못하고, "
                                    "조금의 변화로 인하여 삶의 큰 틀이 바뀌고 있습니다. 우리가 살아가는 시대는 블루오션을 찾을 수 없고 "
                                    "많은 블랙오션을 피해, 레드오션 속에서 돌파구를 찾을 수 있어야만 앞으로 나아 갈 수 있습니다."
                                    "DevOn Studio는 그러한 아주 작은 변화와 돌파구를 찾아 나서는 개발을 하려 합니다.",
                                    style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  AnimatedOpacity(
                    opacity: _isLoaded[1] ? 1 :0,
                    duration: Duration(milliseconds: 500),
                    child: SizedBox(
                      height: 300,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              AnimatedOpacity(
                                  opacity: 1,
                                  duration: const Duration(milliseconds: 500),
                                  child: Text(
                                    "Slow, but striving for perfection!",
                                    style: TextStyle(color: Colors.white, fontSize: 60, fontWeight: FontWeight.w600),
                                  )),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(
                                  width: 600,
                                  // height: 500,
                                  child: Text(
                                    "느리지만 완벽을 향해가자. 이 한마디의 말이 DevOn Studio에서 추구하는 개발자의 마인드 입니다."
                                    "모든 것이 빠르게 변화하고 잠깐의 반짝임을 유행이라 치부하는 현시대에서 우리는 잠깐의 반짝임이 아닌, "
                                    "느리고 조금은 덜 빛나더라도 오래 빛나고 더 따듯한 빛을 발하는 그런 PRODUCT를 만드는 것이 우리의 차별점 입니다."
                                    "하나를 만들더라도 빠르지만 미완성인 것보다, 조금은 느리더라도 더 나은 제품을 만드는것이 개발자가 가져야하는 완벽을 찾는 마음가짐이 아닐까요?",
                                    style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
