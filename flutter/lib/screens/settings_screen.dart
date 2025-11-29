import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart';
import '../providers/theme_provider.dart';
import 'login_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);
    final colorScheme = Theme.of(context).colorScheme;

    return ListView(
      padding: EdgeInsets.zero,
      children: [
        // 상단 프로필 영역
        UserAccountsDrawerHeader(
          decoration: BoxDecoration(
            color:
                colorScheme.primary == Colors.white
                    ? Colors
                        .grey
                        .shade900 // 다크모드일 땐 짙은 회색 배경
                    : Colors.black, // 라이트모드일 땐 검은 배경
          ),
          accountName: Text(
            userProvider.username ?? '사용자',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          accountEmail: Text(
            userProvider.email ?? '',
            style: TextStyle(color: Colors.white70),
          ),
          currentAccountPicture: CircleAvatar(
            backgroundColor: Colors.white,
            child: Text(
              (userProvider.username ?? 'U')[0].toUpperCase(),
              style: TextStyle(fontSize: 24, color: Colors.black),
            ),
          ),
        ),

        // 다크모드 스위치
        SwitchListTile(
          title: Text('다크 모드'),
          subtitle: Text('어두운 테마를 사용합니다'),
          secondary: Icon(Icons.dark_mode),
          value: themeProvider.isDarkMode,
          activeColor: Colors.white, // 켜졌을 때 버튼 색
          activeTrackColor: Colors.black, // 켜졌을 때 트랙 색
          onChanged: (value) => themeProvider.toggleTheme(value),
        ),

        Divider(),

        // 로그아웃
        ListTile(
          leading: Icon(Icons.logout),
          title: Text('로그아웃'),
          onTap: () async {
            await userProvider.logout();
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
              (route) => false,
            );
          },
        ),

        // 계정 삭제
        ListTile(
          leading: Icon(Icons.delete_forever, color: Colors.red),
          title: Text('계정 삭제', style: TextStyle(color: Colors.red)),
          onTap: () async {
            await userProvider.deleteAccount();
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
              (route) => false,
            );
          },
        ),
      ],
    );
  }
}
