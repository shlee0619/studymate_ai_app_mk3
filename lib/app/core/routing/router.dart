import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/errors/error_profile_screen.dart';
import '../../features/library/library_screen.dart';
import '../../features/quiz/quiz_screen.dart';
import '../../features/review/review_screen.dart';
import '../../features/settings/settings_screen.dart';

GoRouter createRouter() => GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (ctx, st) => const AppScaffold(selectedIndex: 0, child: LibraryScreen()),
        ),
        GoRoute(
          path: '/quiz',
          builder: (ctx, st) => const AppScaffold(selectedIndex: 1, child: QuizScreen()),
        ),
        GoRoute(
          path: '/review',
          builder: (ctx, st) => const AppScaffold(selectedIndex: 2, child: ReviewScreen()),
        ),
        GoRoute(
          path: '/errors',
          builder: (ctx, st) => const AppScaffold(selectedIndex: 3, child: ErrorProfileScreen()),
        ),
        GoRoute(
          path: '/settings',
          builder: (ctx, st) => const AppScaffold(selectedIndex: 4, child: SettingsScreen()),
        ),
      ],
    );

class AppScaffold extends StatelessWidget {
  final Widget child;
  final int selectedIndex;
  const AppScaffold({super.key, required this.child, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('StudyMate AI')),
      body: SafeArea(child: child),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.folder), label: 'Library'),
          NavigationDestination(icon: Icon(Icons.quiz), label: 'Quiz'),
          NavigationDestination(icon: Icon(Icons.refresh), label: 'Review'),
          NavigationDestination(icon: Icon(Icons.bug_report), label: 'Errors'),
          NavigationDestination(icon: Icon(Icons.settings), label: 'Settings'),
        ],
        onDestinationSelected: (i) {
          switch (i) {
            case 0:
              GoRouter.of(context).go('/');
              break;
            case 1:
              GoRouter.of(context).go('/quiz');
              break;
            case 2:
              GoRouter.of(context).go('/review');
              break;
            case 3:
              GoRouter.of(context).go('/errors');
              break;
            case 4:
              GoRouter.of(context).go('/settings');
              break;
          }
        },
      ),
    );
  }
}
