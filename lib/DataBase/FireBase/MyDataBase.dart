import 'package:cloud_firestore/cloud_firestore.dart';
import '../Api/Models/Popular_Movies_Models/Results.dart';


class MyDataBase {

  static CollectionReference<Movie> getCollection(){
    var collectionRef = FirebaseFirestore.instance.collection('WatchList').withConverter(
        fromFirestore: (snapshot, options) => Movie.fromFireStore(snapshot.data()),
        toFirestore: (value, options) => value.toFireStore(),
    );
    return collectionRef;
  }

  static Future<void> insertMovieData(Movie movie) async {
    var ref =  getCollection() ;
    var doc = ref.doc();
    movie.DataBaseID = doc.id;
    return doc.set(movie);
  }

  static Stream<QuerySnapshot<Movie>> getMovies(){
    return getCollection().snapshots();
  }

  static Future<List<Movie>> getMoviesToCompare(){
    var ref = getCollection();
    return ref.get().then((value) => value.docs.map((doc) => doc.data()).toList());
  }

  static deletemovie(String movie) async{
    var cardoc = getCollection().doc(movie).delete();
  }

}