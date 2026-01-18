import 'music.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<MusicList>> fetchMusics() async {
  final url = Uri.parse('https://api.kimrasng.kr/api/music-server/songs');

  final response = await http.get(url);

  if (response.statusCode == 200) {
    final dynamic responseData = jsonDecode(response.body);
    
    if (responseData is Map<String, dynamic>) {
      if (responseData.containsKey('data') && responseData['data'] is List) {
        final List<dynamic> data = responseData['data'];
        return data.map((json) => MusicList.fromJson(json)).toList();
      }
      else if (responseData.containsKey('songs') && responseData['songs'] is List) {
        final List<dynamic> data = responseData['songs'];
        return data.map((json) => MusicList.fromJson(json)).toList();
      }
      else {
        final List<dynamic> data = responseData.values.toList();
        return data.map((json) => MusicList.fromJson(json)).toList();
      }
    }
    else if (responseData is List) {
      return responseData.map((json) => MusicList.fromJson(json)).toList();
    }
    
    throw Exception('Unexpected response format');
  } else {
    throw Exception('Failed to load musics: ${response.statusCode}');
  }
}