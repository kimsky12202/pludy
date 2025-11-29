import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart';
import '../providers/theme_provider.dart';
import 'login_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final userProvider = Provider.of<UserProvider>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);

    return ListView(
      padding: EdgeInsets.zero,
      children: [
        // 상단 프로필 영역
        UserAccountsDrawerHeader(
          decoration: BoxDecoration(
            color: colorScheme.primary,
          ),
          accountName: Text(
            userProvider.username ?? '사용자',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: colorScheme.onPrimary,
            ),
          ),
          accountEmail: Text(
            userProvider.email ?? '',
            style: TextStyle(color: colorScheme.onPrimary.withValues(alpha: 0.7)),
          ),
          currentAccountPicture: CircleAvatar(
            backgroundColor: colorScheme.surface,
            child: Text(
              (userProvider.username ?? 'U')[0].toUpperCase(),
              style: TextStyle(fontSize: 24, color: colorScheme.primary),
            ),
          ),
        ),

        // 다크모드 스위치
        SwitchListTile(
          title: Text('다크 모드', style: TextStyle(color: colorScheme.onSurface)),
          subtitle: Text('어두운 테마를 사용합니다', style: TextStyle(color: colorScheme.secondary)),
          secondary: Icon(Icons.dark_mode, color: colorScheme.onSurface),
          value: themeProvider.isDarkMode,
          onChanged: (value) => themeProvider.toggleTheme(value),
        ),

        Divider(color: colorScheme.outline),

        // 로그아웃
        ListTile(
          leading: Icon(Icons.logout, color: colorScheme.onSurface),
          title: Text('로그아웃', style: TextStyle(color: colorScheme.onSurface)),
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
          leading: Icon(Icons.delete_forever, color: colorScheme.error),
          title: Text('계정 삭제', style: TextStyle(color: colorScheme.error)),
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
