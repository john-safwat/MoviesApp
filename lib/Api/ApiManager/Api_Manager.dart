import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies/Api/Models/Popular_Movies_Models/Popular_Movie_Response.dart';

class Api_Constants {
  static const String Api_key = 'b25aa4a5a9acd36eb000e5df6c32a270' ;
  static const String BaseUrl  = 'api.themoviedb.org';
  static const String Popular_Movies  = '/3/movie/popular';
}

class Api_Manager {
  static Future<PopularMovieResponse> Get_Popular_Movies () async {
    Uri url = Uri.https(
      Api_Constants.BaseUrl ,
      Api_Constants.Popular_Movies ,
      {
        'api_key' : Api_Constants.Api_key ,
        'language' : 'en-US',
      }
    );
    var response = await http.get(url);
    return PopularMovieResponse.fromJson(jsonDecode(response.body));
  }
}
