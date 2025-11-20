import 'dart:convert';

import 'package:devon_studio_web/data/product_model.dart';
import 'package:devon_studio_web/data/support_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:url_launcher/url_launcher.dart';

class SupportPage extends StatefulWidget {
  final String title;

  const SupportPage({super.key, required this.title});

  @override
  State<SupportPage> createState() => _SupportPageState();
}

class _SupportPageState extends State<SupportPage> {
  SupportModel? supportData;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    _loadSupportData();
  }

  Future<void> _loadSupportData() async {
    try {
      final result = await getSupportModel();

      if (!mounted) return;

      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          setState(() {
            supportData = result;
          });
        }
      });
    } catch (e) {
      debugPrint('Error loading support data: $e'); // 콘솔에도 찍고
      if (mounted) {
        setState(() {
          errorMessage = e.toString(); // 에러 내용을 저장
        });
      }
    }
  }

  Future<SupportModel> getSupportModel() async {
    final String response = await rootBundle.loadString("lib/data/support.json");
    final Map<String, dynamic> jsonMap = jsonDecode(response);
    final SupportModel data = SupportModel.fromJson(jsonMap);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    final product = widget.title == 'Ready Go' ? supportData?.products![0] : supportData?.products![1];

    if (supportData == null) return Center(child: CircularProgressIndicator());
    return Scaffold(
        appBar: AppBar(
          title: Text('${widget.title} - 고객지원', style: TextStyle(color: Colors.white)),
          centerTitle: false,
          backgroundColor: Colors.black,
          leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back, color: Colors.white,)),
        ),
        body: LayoutBuilder(builder: (context, constraints) {
          return SingleChildScrollView(
            child: Container(
                width: constraints.maxWidth,
                padding: EdgeInsets.all(30),
                decoration:
                    BoxDecoration(gradient: LinearGradient(colors: [Colors.black, Colors.black, Colors.deepPurple])),
                child: SizedBox(
                  width: constraints.maxWidth * 0.5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("${product!.title} (IOS, ANDROID)", style: TextStyle(fontSize: 44, fontWeight: FontWeight.bold, color: Colors.white), textAlign: TextAlign.center),
                      const Gap(20),
                      Text("${product.subTitle}", style: TextStyle(fontSize: 28, color: Colors.white), textAlign: TextAlign.center),
                      const Gap(20),
                      Text("${product.description}", style: TextStyle(fontSize: 20, color: Colors.white), textAlign: TextAlign.center),
                      const Gap(20),
                      Text("${product.contents}", style: TextStyle(fontSize: 18, color: Colors.white), textAlign: TextAlign.center),
                      const Gap(20),
                      SizedBox(
                        width: constraints.maxWidth * 0.4,
                        child: Column(
                          children: [
                            Text("앱의 기능", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white)),
                            const Gap(10),
                            ListView.separated(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (context, idx){
                                  return Row(
                                    // crossAxisAlignment를 start로 설정하여 아이콘과 텍스트의 상단을 맞춥니다.
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        // 텍스트가 여러 줄일 경우 아이콘이 중앙에 오는 것을 방지하기 위해 Padding을 사용
                                        padding: const EdgeInsets.only(top: 4.0),
                                        child: Icon(Icons.check_circle, color: Colors.white),
                                      ),
                                      const Gap(10),

                                      // Expanded를 사용하여 남은 공간을 모두 차지하도록 합니다.
                                      Expanded(
                                        child: Column(
                                          // 텍스트들을 세로로 정렬하고, 시작점을 기준으로 맞춥니다.
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            // 'title' 텍스트
                                            Text(
                                              "${product.features![idx]['title']}",
                                              style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                                              softWrap: true,
                                            ),
                                            const Gap(4), // 제목과 설명 사이의 간격

                                            // 'description' 텍스트
                                            Text(
                                              "${product.features![idx]['description']}",
                                              style: TextStyle(fontSize: 18, color: Colors.white),
                                              softWrap: true, // Expanded 내부에 있으므로 정상적으로 줄바꿈됩니다.
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  );
                            }, separatorBuilder: (context, idx) => const Gap(10), itemCount: product.features!.length)
                          ],
                        ),
                      ),
                      const Gap(20),
                      Text("이 페이지는 ${widget.title}의 공식 고객지원 페이지 입니다.", style: TextStyle(fontSize: 18, color: Colors.white),),
                      const Gap(10),
                      Text("${supportData!.address}", style: TextStyle(fontSize: 16, color: Colors.white),),
                      const Gap(10),
                      TextButton(onPressed: (){
                        // final url = Uri.parse("${supportData!.privacyPolicy}");
                        launchUrl(Uri.parse("${supportData!.privacyPolicy}"));
                      }, child: Text("개인정보 보호 정책", style: TextStyle(fontSize: 16, color: Colors.redAccent),))
                    ],
                  ),
                )),
          );
        }));
  }
}
