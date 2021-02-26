class Peliculas {
  List<Pelicula> items = new List();
  //es solo un constructor
  Peliculas();
  //le ponemos List<dynamic> para evitar que se rompa la app con el json
  Peliculas.fromJsonList(List<dynamic> jsonList) {
    //si está vacio, no funciona
    if (jsonList == null) return;

    for (var item in jsonList) {
      final pelicula = new Pelicula.fromJsonMap(item);
      items.add(pelicula);
    }
  }
}

class Pelicula {
  int voteCount;
  int id;
  bool video;
  double voteAverage;
  String title;
  double popularity;
  String posterPath;
  String originalLanguage;
  String originalTitle;
  List<int> genreIds;
  String backdropPath;
  bool adult;
  String overview;
  String releaseDate;

  Pelicula({
    this.voteCount,
    this.id,
    this.video,
    this.voteAverage,
    this.title,
    this.popularity,
    this.posterPath,
    this.originalLanguage,
    this.originalTitle,
    this.genreIds,
    this.backdropPath,
    this.adult,
    this.overview,
    this.releaseDate,
  });

  Pelicula.fromJsonMap(Map<String, dynamic> json) {
    voteCount = json['vote_count'];
    id = json['id'];
    video = json['video'];
    //lo dividimos entre 1 para asegurarnos que se convierta en un double
    voteAverage = json['vote_average'] / 1;
    title = json['title'];
    popularity = json['popularity'] / 1;
    posterPath = json['poster_path'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    genreIds = json['genre_ids'].cast<int>();
    backdropPath = json['backdrop_path'];
    adult = json['adult'];
    overview = json['overview'];
    releaseDate = json['release_date'];
  }

  getPosterImg() {
    if (posterPath == null) {
      return 'https://i0.wp.com/www.techjunkie.com/wp-content/uploads/2018/08/How-to-fix-the-Lenovo-webcam-not-working-issue1.jpg';
    }
    return 'https://image.tmdb.org/t/p/w500$posterPath';
  }

  getBackgorundImg() {
    if (posterPath == null) {
      return 'https://i0.wp.com/www.techjunkie.com/wp-content/uploads/2018/08/How-to-fix-the-Lenovo-webcam-not-working-issue1.jpg';
    }
    print("https://image.tmdb.org/t/p/w500$backdropPath");
    return 'https://image.tmdb.org/t/p/w500$backdropPath';
  }
}
