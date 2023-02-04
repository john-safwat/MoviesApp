import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Models/Categories_Models/Categorie.dart';
import '../Models/Movie_Details_Model/Movie_Details_Response.dart';
import '../Models/Popular_Movies_Models/Popular_Movie_Response.dart';

class Api_Constants {
  static const String Api_key = 'b25aa4a5a9acd36eb000e5df6c32a270' ;
  static const String BaseUrl  = 'api.themoviedb.org';
}

class Api_Manager {
  Future<PopularMovieResponse> Get_Popular_Movies () async {
    Uri url = Uri.https(
      Api_Constants.BaseUrl ,
      '/3/movie/popular',
      {
        'api_key' : Api_Constants.Api_key ,
        'language' : 'en-US',
      }
    );
    var response = await http.get(url);
    return PopularMovieResponse.fromJson(jsonDecode(response.body));
  }

  Future<PopularMovieResponse> Get_Top_Rated_Movies () async {
    Uri url = Uri.https(
      Api_Constants.BaseUrl,
      '/3/movie/top_rated',
      {
        'api_key' : Api_Constants.Api_key ,
        'language' : 'en-US',
      }
    );
    var response = await http.get(url);
    return PopularMovieResponse.fromJson(jsonDecode(response.body));
  }

  Future<MovieDetailsResponse> Get_Movie_Details(String id)async{
    Uri url = Uri.https(
        Api_Constants.BaseUrl,
        "/3/movie/${id}",
        {
          'api_key' : Api_Constants.Api_key ,
          'language' : 'en-US',
        }
    );
    var response = await http.get(url);
    return MovieDetailsResponse.fromJson(jsonDecode(response.body));
  }

  Future<PopularMovieResponse> Get_Similar_Movies (String id) async {
    Uri url = Uri.https(
        Api_Constants.BaseUrl ,
        '/3/movie/${id}/similar',
        {
          'api_key' : Api_Constants.Api_key ,
          'language' : 'en-US',
        }
    );
    var response = await http.get(url);
    return PopularMovieResponse.fromJson(jsonDecode(response.body));
  }

  Future<PopularMovieResponse> Search (String query) async {
    Uri url = Uri.https(
        Api_Constants.BaseUrl ,
        '/3/search/movie',
        {
          'api_key' : Api_Constants.Api_key ,
          'language' : 'en-US',
          'query' : query ,
        }
    );
    var response = await http.get(url);
    return PopularMovieResponse.fromJson(jsonDecode(response.body));
  }

  Future<Categorie> Catigories() async {
    Uri url = Uri.https(
        Api_Constants.BaseUrl ,
        '/3/genre/movie/list',
        {
          'api_key' : Api_Constants.Api_key ,
          'language' : 'en-US',
        }
    );
    var response = await http.get(url);
    return Categorie.fromJson(jsonDecode(response.body));
  }

  Future<PopularMovieResponse> Categorie_Data(String ganra) async {
    Uri url = Uri.https(
        Api_Constants.BaseUrl ,
        '/3/discover/movie',
        {
          'api_key' : Api_Constants.Api_key ,
          'language' : 'en-US',
          'with_genres' : ganra ,
        }
    );
    var response = await http.get(url);
    return PopularMovieResponse.fromJson(jsonDecode(response.body));
  }


}