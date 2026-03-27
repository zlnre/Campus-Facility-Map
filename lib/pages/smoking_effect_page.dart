import 'package:flutter/material.dart';

class SmokingEffectPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('흡연장 효과')),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '''1) 간접흡연과 3차 흡연

간접흡연(주변 사람들이 흡연할 때 비흡연자가 흡입하게 되는 연기)과 3차 흡연(흡연 후 옷이나 가구에 남는 유해 물질)이 다른 사람에게 어떤 영향을 미치는지 다루는 자료가 있습니다. 이는 비흡연자와 아동의 건강에 주는 위험성과 관련해 중요한 주제입니다.


2) 길거리와 환경의 미관 문제

담배꽁초는 길거리에 가장 흔히 버려지는 쓰레기 중 하나로, 도시 미관을 해치고 청소 비용을 증가시킵니다. 많은 나라와 도시에서는 담배꽁초 문제를 줄이기 위해 거리의 청소 비용과 관리에 상당한 예산을 투입하고 있습니다.
''',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
