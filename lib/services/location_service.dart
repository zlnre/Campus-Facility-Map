import 'package:flutter/material.dart'; // Colors 사용을 위해 필요
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:location/location.dart';

// LocationService 클래스를 정의하여 위치 정보 제공 및 마커 관리를 담당합니다.
// Flutter 애플리케이션에서 사용자의 현재 위치를 가져오고, 지도에 **마커(핀)**를 표시하기 위한 로직을 포함합니다.
//네이버 지도에 재활용장과 흡연장 마커를 보여주기 위해 flutter_naver_map 라이브러리를 활용합니다.

class LocationService {
  final Location _location = Location();
//LocationService 클래스는 위치 관련 서비스와 마커 데이터를 제공합니다
//location 패키지를 사용하여 위치 정보를 처리합니다.

  Future<LocationData?> checkLocationPermission() async {
    bool serviceEnabled = await _location
        .serviceEnabled(); //위치 권한이 활성화되어 있는지 확인하고, 권한이 없으면 요청합니다.
    if (!serviceEnabled) {
      serviceEnabled = await _location.requestService();
      if (!serviceEnabled) return null; //서비스 비활성화 또는 권한 거부 시 null을 반환합니다
    }

    PermissionStatus permissionGranted = await _location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await _location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) return null;
    }

    return await _location.getLocation();
  }

  Future<LocationData> getCurrentLocation() async {
    return await _location.getLocation(); //사용자의 현재 위치를 가져옵니다.
  }

  List<NMarker> get recyclingMarkers => [
        //마커는 네이버 지도에 표시될 핀으로, 위치 좌표와 색상 등을 포함합니다.
        NMarker(
          id: 'recycling1',
          position: NLatLng(37.868140, 127.738045),
          iconTintColor: Colors.green, // 초록색 마커
        ),
        NMarker(
          id: 'recycling2',
          position: NLatLng(37.867255, 127.741150),
          iconTintColor: Colors.green,
        ),
        NMarker(
          id: 'recycling3',
          position: NLatLng(37.866603, 127.747609),
          iconTintColor: Colors.green,
        ),
        NMarker(
          id: 'recycling4',
          position: NLatLng(37.868323, 127.751536),
          iconTintColor: Colors.green,
        ),
        NMarker(
          id: 'recycling5',
          position: NLatLng(37.868719, 127.747839),
          iconTintColor: Colors.green,
        ),
        NMarker(
          id: 'recycling6',
          position: NLatLng(37.868081, 127.745124),
          iconTintColor: Colors.green,
        ),
        NMarker(
          id: 'recycling7',
          position: NLatLng(37.867303, 127.742653),
          iconTintColor: Colors.green,
        ),
        NMarker(
          id: 'recycling8',
          position: NLatLng(37.865800, 127.743757),
          iconTintColor: Colors.green,
        ),
        NMarker(
          id: 'recycling9',
          position: NLatLng(37.865618, 127.743614),
          iconTintColor: Colors.green,
        ),
        NMarker(
          id: 'recycling10',
          position: NLatLng(37.868043, 127.742483),
          iconTintColor: Colors.green,
        ),
        NMarker(
          id: 'recycling11',
          position: NLatLng(37.871326, 127.741316),
          iconTintColor: Colors.green,
        ),
      ];

  List<NMarker> get smokingMarkers => [
        NMarker(
          id: 'smoking1',
          position: NLatLng(37.868307, 127.738227),
          iconTintColor: Colors.blue, // 파란색 마커
        ),
        NMarker(
          id: 'smoking2',
          position: NLatLng(37.868945, 127.740821),
          iconTintColor: Colors.blue,
        ),
        NMarker(
          id: 'smoking3',
          position: NLatLng(37.867755, 127.747258),
          iconTintColor: Colors.blue,
        ),
        NMarker(
          id: 'smoking4',
          position: NLatLng(37.867602, 127.750046),
          iconTintColor: Colors.blue,
        ),
        NMarker(
          id: 'smoking5',
          position: NLatLng(37.867182, 127.751119),
          iconTintColor: Colors.blue,
        ),
        NMarker(
          id: 'smoking6',
          position: NLatLng(37.869484, 127.752109),
          iconTintColor: Colors.blue,
        ),
        NMarker(
          id: 'smoking7',
          position: NLatLng(37.868789, 127.749374),
          iconTintColor: Colors.blue,
        ),
        NMarker(
          id: 'smoking8',
          position: NLatLng(37.868558, 127.748672),
          iconTintColor: Colors.blue,
        ),
        NMarker(
          id: 'smoking9',
          position: NLatLng(37.865932, 127.748259),
          iconTintColor: Colors.blue,
        ),
        NMarker(
          id: 'smoking10',
          position: NLatLng(37.868129, 127.745819),
          iconTintColor: Colors.blue,
        ),
        NMarker(
          id: 'smoking11',
          position: NLatLng(37.866520, 127.741663),
          iconTintColor: Colors.blue,
        ),
        NMarker(
          id: 'smoking12',
          position: NLatLng(37.865648, 127.743981),
          iconTintColor: Colors.blue,
        ),
        NMarker(
          id: 'smoking13',
          position: NLatLng(37.867394, 127.741174),
          iconTintColor: Colors.blue,
        ),
        NMarker(
          id: 'smoking14',
          position: NLatLng(37.868043, 127.742483),
          iconTintColor: Colors.blue,
        ),
        NMarker(
          id: 'smoking15',
          position: NLatLng(37.867581, 127.738735),
          iconTintColor: Colors.blue,
        ),
        NMarker(
          id: 'smoking16',
          position: NLatLng(37.872220, 127.743637),
          iconTintColor: Colors.blue,
        ),
        NMarker(
          id: 'smoking17',
          position: NLatLng(37.868879, 127.739407),
          iconTintColor: Colors.blue,
        ),
        NMarker(
          id: 'smoking18',
          position: NLatLng(37.869419, 127.739524),
          iconTintColor: Colors.blue,
        ),
        NMarker(
          id: 'smoking19',
          position: NLatLng(37.866184, 127.740008),
          iconTintColor: Colors.blue,
        ),
        NMarker(
          id: 'smoking20',
          position: NLatLng(37.871937, 127.741471),
          iconTintColor: Colors.blue,
        ),
        NMarker(
          id: 'smoking21',
          position: NLatLng(37.869995, 127.741924),
          iconTintColor: Colors.blue,
        ),
        NMarker(
          id: 'smoking22',
          position: NLatLng(37.870672, 127.742151),
          iconTintColor: Colors.blue,
        ),
      ];
}
