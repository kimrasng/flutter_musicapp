import 'package:flutter/material.dart';

import './data/api.dart';
import './data/music.dart';

import './screen/controller.dart';
import './screen/info.dart';
import './screen/playlist.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
