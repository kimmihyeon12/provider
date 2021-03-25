import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providermovie/model/movie.dart';
import 'package:providermovie/provider/movie_provider.dart';

class MovieListWidget extends StatefulWidget {
  @override
  _MovieListWidgetState createState() => _MovieListWidgetState();
}

class _MovieListWidgetState extends State<MovieListWidget> {
  PageController _pageController;
  int initialPage = 1;
  MovieProvider _movieProvider;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }


  Widget _makeMovieOne(Movie movie) {
    return Column(
      children: [
        Expanded(child: Container(
          child: Image.network(movie.postUrl)
        )),
        Text(movie.title, style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.star, size: 20, color: Colors.yellow[700],),
            Text(movie.rating.toString())
          ],
        )
      ],
    );
  }


  Widget _makeListView(List<Movie> movies) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 25),
      child: AspectRatio(
        aspectRatio: 0.85,
        child: PageView.builder(
            itemBuilder: (context, index) => Container(
                  // color: Colors.blueAccent,
                  margin: EdgeInsets.all(25),
                  child: _makeMovieOne(movies[index]),
                )),
      ),
    );

    // return PageView.builder(
    //   itemCount: movies.length,
    //   itemBuilder: (BuildContext context, int index) {
    //     return Container(
    //       margin: EdgeInsets.all(10),
    //       color:Colors.blueAccent
    //       // child: Text(movies[index].title),
    //     );
    //   },
    //   // separatorBuilder: (BuildContext context, int index){
    //   //   return Divider();
    //   },
    // );
  }

  @override
  Widget build(BuildContext context) {
    _movieProvider = Provider.of<MovieProvider>(context, listen: false);
    _movieProvider.loadMovies();

    return Scaffold(
      appBar: AppBar(
        title: Text('Movie Provider'),
        centerTitle: true,
      ),
      body: Consumer<MovieProvider>(
        builder: (context, provider, widget) {
          if (provider.movies != null && provider.movies.length > 0) {
            return _makeListView(provider.movies);
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
