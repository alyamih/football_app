import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class ApiRepository {
  final String apiToken = '69e53c5199934934b3548a7758234388';

  Future<List<dynamic>> fetchTodayMatches() async {
    String today = DateFormat('yyyy-MM-dd').format(DateTime.now());
    String today2 = DateFormat('yyyy-MM-dd').format(DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day + 1));
    final response = await http.get(
      Uri.parse(
          'http://api.football-data.org/v4/matches?dateFrom=$today&dateTo=$today2'),
      headers: {'X-Auth-Token': apiToken},
    );

    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      return result['matches'] ?? [];
    } else {
      throw Exception(
          'Failed to load today\'s matches. Try enter the screen again');
    }
  }

  Future<List<dynamic>> fetchCalendarMatches(
      String firstDay, String seconDay) async {
    final response = await http.get(
      Uri.parse(
          'http://api.football-data.org/v4/matches?dateFrom=$firstDay&dateTo=$seconDay'),
      headers: {'X-Auth-Token': apiToken},
    );

    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      return result['matches'] ?? [];
    } else {
      throw Exception(
          'Failed to load today\'s matches. Try enter the screen again');
    }
  }

  Future<List<dynamic>> fetchMatches() async {
    final response = await http.get(
      Uri.parse('http://api.football-data.org/v4/matches'),
      headers: {'X-Auth-Token': apiToken},
    );

    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      return result['matches'] ?? [];
    } else {
      throw Exception('Failed to load matches. Try enter the screen again');
    }
  }
}

// //before let's add the http package
// import 'dart:convert';

// import 'package:football_app/model/models.dart';
// import 'package:football_app/pages/home_page.dart';
// import 'package:http/http.dart' as http;
// import 'package:http/http.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class SoccerApi {
//   final String apiUrl =
//       "https://v3.football.api-sports.io/fixtures?season=2024";

//   static const headers = {
//     'x-rapidapi-host': "v3.football.api-sports.io",
//     'x-rapidapi-key': "59e59ee6171e8f9a4960bed9e46c4003"
//   };
//   //ff4d48ce8bb0149c54244bf23b9414e7
//   Future<List<SoccerMatch>> getAllMatches() async {
//     Response res = await get(Uri.parse(apiUrl), headers: headers);
//     var body;

//     if (res.statusCode == 200) {
//       List<SoccerMatch> matches = [];
//       body = jsonDecode(res.body);
//       List<dynamic> matchesList = body['response'];
//       for (var item in matchesList) {
//         SoccerMatch match = SoccerMatch.fromJson(item);
//         matches.add(match);
//       }
//       print("Api service: $body");
//       addToSP(matches);
//       print(matches);
//       return matches;
//     } else {
//       return [];
//     }
//   }

//   Future<void> addToSP(List<SoccerMatch>? matches) async {
//     final prefs = await SharedPreferences.getInstance();

//     if (matches != null) {
//       prefs.setString('matches', jsonEncode(matches));
//     }
//   }

//   void getSP() async {
//     final prefs = await SharedPreferences.getInstance();
//     final List<dynamic> jsonData =
//         jsonDecode(prefs.getString('matches') ?? '[]');

//     matchesList = jsonData.map<SoccerMatch>((jsonList) {
//       {
//         return SoccerMatch.fromJson(jsonList);
//       }
//     }).toList();
//   }
// }
