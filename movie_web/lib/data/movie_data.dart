import 'dart:convert';

import 'package:movie_web/model/movie_model.dart';
import 'package:http/http.dart' as http; 
import '../env.dart';

class MovieData{
  final String baseUrl = 'https://api.themoviedb.org/3/movie';
  final String bearerToken = ACCESS_TOKEN;

  Future<List<MovieModel>> fetchTopRatedMovie() async{
    final response = await http.get(
      Uri.parse(('$baseUrl/top_rated?language=en-US&page=1')),
      headers: {
        'Authorization' : 'Bearer $bearerToken',
        'accept': 'application/json'
      }
    );
    if(response.statusCode == 200){
      return ((jsonDecode(response.body)['results']) as List)
          .map((e) => MovieModel.fromJson(e))
          .toList();
    }
    else{
      throw Exception("Failed to load movie data");
    }
  }

}