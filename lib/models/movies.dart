


class movies{


  int?id;
  String?overview;
  String?poster_path;
  String?title;
  num?vote_average;
  String?release_date;
  movies({this.id,this.title,this.overview,this.poster_path,this.vote_average,this.release_date});

factory movies.fromMap(Map<String,dynamic>map)
{
  return  movies(
    title: map ["title"],
    overview: map ["overview"],
    poster_path: map ["poster_path"],
    id: map ["id"],
    release_date: map ["release_date"],
    vote_average: map ["vote_average"],
  );
}

  Map<String,dynamic>toMap()
  {
    return {
      "id":this.id,
      "overview":this.overview,
      "poster_path":this.poster_path,
      "title":this.title,
      "vote_average":this.vote_average,
      "release_date":this.release_date,
    };

  }
}