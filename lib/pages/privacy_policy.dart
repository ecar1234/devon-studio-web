import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';


class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  Future<String> _loadPrivacyPolicyData() async {
    final String response = await rootBundle.loadString("assets/text/privacy_policy.txt");
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("개인정보 보호 정책"),
      //   centerTitle: true,
      // ),
      body: Center(
        child: Container(
          // 💡 화면 세로 길이에 딱 맞추면 여백이 없으므로 0.85 정도로 여유를 주는 것이 웹에서 보기 좋습니다.
          height: MediaQuery.sizeOf(context).height * 0.85,
          constraints: BoxConstraints(
            maxWidth: 600,
            minWidth: 320,
          ),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: FutureBuilder<String>(
            future: _loadPrivacyPolicyData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: SizedBox(
                    height: 40,
                    width: 40,
                    child: CircularProgressIndicator(),
                  ),
                );
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                // 💡 [핵심] Markdown 하나만 넣어도 자체적으로 세로 스크롤을 지원합니다!
                return Markdown(
                  data: snapshot.data!,
                  physics: const BouncingScrollPhysics(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
