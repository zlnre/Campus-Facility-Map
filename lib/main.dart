import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'pages/recycling_method_page.dart';
import 'pages/recycling_effect_page.dart';
import 'pages/smoking_method_page.dart';
import 'pages/smoking_effect_page.dart';
import 'screens/map_screen.dart';

// Flutter로 네이버 맵 SDK를 사용하는 앱을 실행하고, 사용자의 위치 및 특정 마커(분리수거장, 흡연장)를 보여주는 것입니다.
// 또한, 다른 페이지로 이동할 수 있는 라우팅 기능을 포함합니다.
Future<void> main() async {
  // 앱 실행 시 비동기 초기화 수행 후 앱 실행
  WidgetsFlutterBinding.ensureInitialized(); //flutter 엔진 초기화
  await _initialize(); // 네이버 맵 sdk 초기화
  runApp(const NaverMapApp()); // 앱 실행
}

Future<void> _initialize() async {
  await NaverMapSdk.instance.initialize(
    clientId: 'yfo7nbb00y', //네이버 클라이언트 ID
    onAuthFailed: (e) => debugPrint("네이버맵 인증 오류: \$e"), // 인증 실패 시 에러 출력
  );
}

class NaverMapApp extends StatelessWidget {
  const NaverMapApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        //라우팅 설정으로 앱 내 페이지 이동
        '/recycling-method': (context) =>
            RecyclingMethodPage(), // 분리수거장 이용방법 페이지
        '/recycling-effect': (context) => RecyclingEffectPage(), // 분리수거장 효과 페이지
        '/smoking-method': (context) => SmokingMethodPage(), // 흡연장 이용방법 페이지
        '/smoking-effect': (context) => SmokingEffectPage(), // 흡연장 효과 페이지
      },
      home: const MapScreen(), // 앱의 첫 화면 MapScreen으로 설정
    );
  }
}
