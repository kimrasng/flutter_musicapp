import 'package:flutter/material.dart';

import './screen/playlist.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),

      home: const MusicListPage(),
    );
  }
}

class MusicListPage extends StatelessWidget {
  const MusicListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Info(),
          Playlist(),
          // Controller(),
        ],
      ),
    );
  }
}
