import 'music.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<MusicList>> fetchMusics() async {
  final url = Uri.parse('https://api.kimrasng.kr/api/music-server/songs');

  final response = await http.get(url);

  if (response.statusCode == 200) {
    final dynamic responseData = jsonDecode(response.body);
    
    // API가 Map 형태로 반환하는 경우 처리
    if (responseData is Map<String, dynamic>) {
      // 'data' 키에 리스트가 있는지 확인
      if (responseData.containsKey('data') && responseData['data'] is List) {
        final List<dynamic> data = responseData['data'];
        return data.map((json) => MusicList.fromJson(json)).toList();
      }
      // 'songs' 키에 리스트가 있는지 확인
      else if (responseData.containsKey('songs') && responseData['songs'] is List) {
        final List<dynamic> data = responseData['songs'];
        return data.map((json) => MusicList.fromJson(json)).toList();
      }
      // Map의 values를 리스트로 변환
      else {
        final List<dynamic> data = responseData.values.toList();
        return data.map((json) => MusicList.fromJson(json)).toList();
      }
    }
    // 직접 List로 반환하는 경우
    else if (responseData is List) {
      return responseData.map((json) => MusicList.fromJson(json)).toList();
    }
    
    throw Exception('Unexpected response format');
  } else {
    throw Exception('Failed to load musics: ${response.statusCode}');
  }
}