import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import '../services/location_service.dart';
import '../widgets/custom_drawer.dart';
import 'package:location/location.dart';

//사용자의 현재 위치를 가져와 지도의 카메라를 이동시킵니다.
//분리수거장 마커와 흡연장 마커를 지도에 표시합니다.
//사용자가 선택한 필터(‘Recycling’ or ‘Smoking’)에 따라 지도에 마커를 바꿔 표시합니다.

class MapScreen extends StatefulWidget {
  // StatefulWidget으로 선언되었으며, 상태를 유지하면서 지도와 상호작용합니다.
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final LocationService _locationService =
      LocationService(); //위치 권한 확인 및 현재 위치를 가져오는 클래스입니다.
  NaverMapController? _mapController; //네이버 지도를 제어하는 컨트롤러입니다.
  String _selectedFilter =
      'Recycling'; // 선택된 마커 필터 상태(‘Recycling’ or ‘Smoking’)를 저장합니다

  @override
  void initState() {
    super.initState();
    _locationService.checkLocationPermission().then((locationData) {
      // 앱 실행 시 위치 권한을 확인
      if (locationData != null) {
        _moveToCurrentLocation(locationData); // 지도 카메라를 현재 위치로 이동
      }
    });
  }

  // 현재 위치로 이동
  void _moveToCurrentLocation(LocationData locationData) {
    if (_mapController != null) {
      _mapController!.updateCamera(
        NCameraUpdate.scrollAndZoomTo(
          target: NLatLng(locationData.latitude!, locationData.longitude!),
          zoom: 15,
        ),
      );
    }
  }

  // 분리수거장 마커를 추가
  void _addRecyclingMarkers() {
    if (_mapController != null) {
      _mapController!.clearOverlays(); // 기존 마커 제거

      final recyclingMarkers = _locationService.recyclingMarkers;
      _mapController!.addOverlayAll(recyclingMarkers.toSet()); // 마커 추가
    }
  }

  // 필터링된 마커 표시
  void _filterMarkers(String filter) {
    setState(() {
      _selectedFilter = filter;
    });

    if (_mapController == null) {
      debugPrint('맵 컨트롤러가 초기화되지 않았습니다.');
      return;
    }

    final markers = (filter == 'Recycling')
        ? _locationService.recyclingMarkers
        : _locationService.smokingMarkers;

    _mapController!.clearOverlays();
    _mapController!.addOverlayAll(markers.toSet());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(
        selectedFilter: _selectedFilter,
        onFilterChanged: (filter) => _filterMarkers(filter),
      ),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.green[700]?.withOpacity(0.7),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                blurRadius: 10,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Builder(
                      builder: (context) {
                        return IconButton(
                          icon: const Icon(Icons.menu, color: Colors.white),
                          onPressed: () {
                            Scaffold.of(context).openDrawer();
                          },
                        );
                      },
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Text(
                        'KNU EcoFind',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    TextButton.icon(
                      icon: Icon(Icons.recycling,
                          color: _selectedFilter == 'Recycling'
                              ? Colors.white
                              : Colors.grey),
                      label: Text(
                        'Recycling',
                        style: TextStyle(
                          color: _selectedFilter == 'Recycling'
                              ? Colors.white
                              : Colors.grey,
                        ),
                      ),
                      onPressed: () {
                        _filterMarkers('Recycling');
                      },
                    ),
                    TextButton.icon(
                      icon: Icon(Icons.smoking_rooms,
                          color: _selectedFilter == 'Smoking'
                              ? Colors.white
                              : Colors.grey),
                      label: Text(
                        'Smoking',
                        style: TextStyle(
                          color: _selectedFilter == 'Smoking'
                              ? Colors.white
                              : Colors.grey,
                        ),
                      ),
                      onPressed: () {
                        _filterMarkers('Smoking');
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: NaverMap(
        onMapReady: (controller) {
          _mapController = controller;

          // 현재 위치로 이동 및 분리수거장 마커 표시
          _locationService.getCurrentLocation().then((locationData) {
            _moveToCurrentLocation(locationData);
          });

          _addRecyclingMarkers(); // 앱 실행 시 분리수거장 마커 표시
        },
        options: const NaverMapViewOptions(
          indoorEnable: true,
          locationButtonEnable: true, // 내 위치 버튼 활성화
          initialCameraPosition: NCameraPosition(
            // 초기 지도 위치 및 줌 레벨 설정
            target: NLatLng(37.868830, 127.744770),
            zoom: 15,
          ),
        ),
      ),
    );
  }
}
