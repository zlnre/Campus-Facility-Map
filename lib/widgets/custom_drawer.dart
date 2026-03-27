import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  final String selectedFilter;
  final Function(String) onFilterChanged;

  const CustomDrawer({
    required this.selectedFilter,
    required this.onFilterChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/ecofind_logo.png',
                    height: 70,
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'KNU EcoFind',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Divider(height: 1, thickness: 1, color: Colors.black),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    dense: true,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 5),
                    title: const Text(
                      '분리수거장 이용방법',
                      style: TextStyle(fontSize: 18),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, '/recycling-method');
                    },
                  ),
                  ListTile(
                    dense: true,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 5),
                    title: const Text(
                      '분리수거장 효과',
                      style: TextStyle(fontSize: 18),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, '/recycling-effect');
                    },
                  ),
                  const Divider(thickness: 1, color: Colors.black),
                  ListTile(
                    dense: true,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 5),
                    title: const Text(
                      '흡연장 이용방법',
                      style: TextStyle(fontSize: 18),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, '/smoking-method');
                    },
                  ),
                  ListTile(
                    dense: true,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 5),
                    title: const Text(
                      '흡연장 효과',
                      style: TextStyle(fontSize: 18),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, '/smoking-effect');
                    },
                  ),
                ],
              ),
            ),
            // 여백에 텍스트 추가 (위치 안내 + 이메일)
            const Padding(
              padding: EdgeInsets.only(bottom: 50.0),
              child: Center(
                child: Column(
                  children: const [
                    Text(
                      '위치 업데이트는 관리자에게 연락주시면\n확인 후 변경하겠습니다.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 5), // 두 줄 사이 간격
                    Text(
                      'contact@knuecofind.com', // 이메일 주소
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
