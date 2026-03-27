import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:developer';
import 'package:url_launcher/url_launcher.dart';

class RecyclingMethodPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('분리수거장 이용방법')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: SingleChildScrollView(
          //내용이 길 경우 스크롤 가능하게 합니다.
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '''<분리수거 방법>
재활용품은 속이 보이는 투명 또는 반투명 봉투에 넣어 배출합니다.
[종류 - 품목 - 배출방법]
종이팩 - 종이팩 - 내용물을 비우고 물로 한 번 헹군 후 
펼치거나 압착하여 봉투에 넣거나 묶어 배출
유리병 - 음료수병, 기타병류 - 병뚜껑 제거 후 내용물 비우고 배출
금속캔 - 철캔, 알루미늄캔, 기타캔류 - 내용물 비우고 압착, 겉의 플라스틱 뚜껑 등 제거 (부탄가스 등은 구멍을 뚫어 배출)
합성수지류 - 무색투명한 먹는샘물 페트병/음료 페트병 - 내용물 비우고 부착상표 등을 제거한 후 압착하여 별도 배출. 다른 플라스틱, 유색페트병과 섞이지 않게 수분하여 배출

기타 재활용 가능자원
[종류-품목]
종이류 - 신문지, 책자, 노트, 종이컵, 상자류(골판지 상자 등)
고철류 - 고철(철사, 못 등), 비철금속(알루미늄, 스텐류 등)
의류, 소형가전제품 - 면섬유류, 기타의류(베개, 이불, 인형 제외), 음식물 처리기, 청소기, 선풍기 등
''',
                style: TextStyle(fontSize: 17),
              ),
              const SizedBox(height: 16),
              RichText(
                // 텍스트 내 여러 스타일과 상호작용이 가능하도록 만듭니다.
                text: TextSpan(
                  //텍스트의 특정 부분을 다른 스타일로 표현하거나 클릭 이벤트를 추가합니다.
                  style: const TextStyle(color: Colors.black, fontSize: 16),
                  children: [
                    const TextSpan(text: '더 자세한 분리수거 방법을 보려면 '),
                    TextSpan(
                      text: '여기를 클릭하세요.',
                      style: const TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline),
                      recognizer:
                          TapGestureRecognizer() //텍스트를 클릭하면 onTap 이벤트가 실행됩니다.
                            ..onTap = () async {
                              const String urlString =
                                  'https://www.chuncheon.go.kr/cityhall/living-info/clean-environment/waste-discharge/recyclable/';
                              final Uri url = Uri.parse(
                                  urlString); //Uri.parse를 통해 문자열 URL을 Uri 객체로 변환합니다.
                              try {
                                await launchUrl(
                                    url); //launchUrl**을 통해 URL을 외부 브라우저에서 엽니다
                              } catch (e) {
                                log('url 열기 실패: $e'); //URL 열기 실패 시 log를 통해 에러 메시지를 출력합니다
                              }
                            },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
