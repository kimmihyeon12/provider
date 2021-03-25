import 'package:providermovie/model/movie.dart';
import 'package:providermovie/repository/movie_repository.dart';
import 'package:flutter/cupertino.dart';

class MovieProvider extends ChangeNotifier{
  MovieRepository _movieRepository = MovieRepository();
  List<Movie> _movies =[];
  List<Movie> get movies => _movies;
  loadMovies() async{
    List<Movie> listMovies = await _movieRepository.loadMovies();
    _movies = listMovies;
    notifyListeners();
  }  
}
