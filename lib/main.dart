import 'package:flutter/material.dart';
import './data/api.dart';
import './data/music.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
      appBar: AppBar(
        title: const Text('Music List'),
      ),
      body: FutureBuilder<List<MusicList>>(
        future: fetchMusics(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('에러: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('데이터가 없습니다.'));
          }

          final musics = snapshot.data!;

          return ListView.builder(
            itemCount: musics.length,
            itemBuilder: (context, index) {
              final music = musics[index];
              return ListTile(
                leading: CircleAvatar(
                  child: Text(music.id.toString()),
                ),
                title: Text(music.title),
                subtitle: Text(music.artist),
                onTap: () {
                  // TODO: 상세 페이지 or 재생 등
                },
              );
            },
          );
        },
      ),
    );
  }
}
