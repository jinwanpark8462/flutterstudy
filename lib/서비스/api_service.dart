import 'dart:convert';

import 'package:fproject/%EB%AA%A8%EB%8D%B8/webtoon_detail.dart';
import 'package:fproject/%EB%AA%A8%EB%8D%B8/webtoon_episode_model.dart';
import 'package:fproject/%EB%AA%A8%EB%8D%B8/webtoon_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl =
      "https://webtoon-crawler.nomadcoders.workers.dev";
  static const String today = "today";

  static Future<List<WebtoonModel>> getTodaysToons() async {
    List<WebtoonModel> webtoonInstances = [];

    final url = Uri.parse('$baseUrl/$today');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final webtoons = jsonDecode(response.body);
      for (var webtoon in webtoons) {
        final instance = WebtoonModel.fromJson(webtoon);
        webtoonInstances.add(instance);
      }
      return webtoonInstances;
    }
    throw Error();
  }

  static Future<Webtoondetail> getToonbyid(String id) async {
    final url = Uri.parse('$baseUrl/%id');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final webtoon = jsonDecode(response.body);
      return Webtoondetail.fromJson(webtoon);
    }
    throw Error();
  }

  static Future<List<webtoonepisode>> getLatestEpisodebyid(String id) async {
    List<webtoonepisode> epinstance = [];
    final url = Uri.parse('$baseUrl/%id/episodes');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final episodes = jsonDecode(response.body);
      for (var ep in episodes) {
        epinstance.add(webtoonepisode.fromJson(ep));
      }
      return epinstance;
    }
    throw Error();
  }
}
