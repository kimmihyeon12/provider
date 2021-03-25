class Movie {
  String title;
  String overview;
  String posterPath;
  double rating;
 
  Movie({this.title, this.overview, this.posterPath, this.rating});

  factory Movie.fromJson(Map<String, dynamic> json){
    return Movie(
      title: json["title"] as String,
      overview:  json["overview"] as String,
      posterPath: json["poster_path"] as String,
      rating: json["vote_average"].toDouble()
    );
  }

  String get postUrl => "https://image.tmdb.org/t/p/w500${this.posterPath}";
}
