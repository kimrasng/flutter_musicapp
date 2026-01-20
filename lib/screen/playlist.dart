import 'package:flutter/material.dart';
import '../data/api.dart';
import '../data/music.dart';

class Playlist extends StatelessWidget {
  const Playlist({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder<List<MusicList>>(
        future: fetchMusics(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return snapshot.hasError
                ? Center(child: Text('오류: ${snapshot.error}'))
                : const Center(child: CircularProgressIndicator());
          }

          final items = snapshot.data!;
          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final m = items[index];
              return ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.network(
                    m.imgurl,
                    width: 48,
                    height: 48,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(m.title),
                subtitle: Text(m.artist),
              );
            },
          );
        },
      ),
    );
  }
}
