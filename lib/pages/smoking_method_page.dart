import 'package:flutter/material.dart';

class SmokingMethodPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('흡연장 이용방법')),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '''
담배꽁초는 지정된 장소에 버리기 : 담배꽁초를 바닥에 버리지 말고, 흡연구역 내 마련된 재떨이에 버립니다. 담배 불이 완전히 꺼졌는지 확인하고 버려 화재 위험을 방지하세요.

흡연 후 주변 정리 : 흡연 후 자신이 사용한 재떨이 주변이나 공용 흡연 구역을 깨끗이 유지해 다음 이용자를 배려합니다. 흡연구역 내 쓰레기통이 있는 경우, 사용한 포장지나 쓰레기를 그곳에 버립니다. 

다른 사람에게 불편을 주지 않기 : 흡연구역이 붐빌 경우, 다른 사람들과 적정 거리를 유지하며 담배 연기가 다른 사람에게 직접 닿지 않도록 주의합니다. 

흡연구역 외부에 흡연 냄새를 최소화 : 흡연 후 손과 옷에 남아있는 냄새를 최소화 하기 위해 손 세정제나 방향제를 사용합니다.이는 비흡연자와의 접촉 시 배려의 표시가 됩니다. 

흡연구역을 자주 점검하고 개선 요청 : 흡연구역의 청결 또는 시설상태가 좋지 않다면 관리 담당자에게 개선 요청을 할 수 있습니다. 
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
