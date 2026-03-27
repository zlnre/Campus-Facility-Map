// recycling_effect_page.dart
import 'package:flutter/material.dart';

class RecyclingEffectPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('분리수거장 효과')),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '''1) 자원절약 

분리수거를 통해 쓰레기를 재활용하면, 새로운 자원을 채굴하거나 생산할 필요성이 줄어들어 자원을 절약할 수 있습니다. 분리수거된 플라스틱을 재활용하면 석유 같은 천연자원의 사용량을 줄일 수 있습니다.


2) 환경 오염 감소
분리수거를 통해 폐기물이 매립되거나 소각되는 양을 줄이면, 환경 오염을 크게 감소시킬 수 있습니다. 분리수거된 재활용품은 매립지로 보내지지 않아 토양 오염과 침출수 문제를 줄입니다. 특히 플라스틱은 분해되기까지 수백 년이 걸리기 때문에 매립지 부담을 줄이는 데 중요합니다. 그리고 쓰레기를 소각하면 다이옥신 같은 유독성 물질이 발생할 수 있는데 이를 줄일 수 있고, 소각 시 발생하는 미세먼지와 온실가스 또한 줄일 수 있습니다.
''',
                style: TextStyle(fontSize: 17),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
