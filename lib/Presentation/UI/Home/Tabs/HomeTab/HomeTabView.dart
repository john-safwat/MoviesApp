import 'package:flutter/material.dart';
import 'package:movies/Presentation/Theme/Theme.dart';
import 'package:movies/Presentation/UI/Home/Tabs/HomeTab/HomeTabViewModel.dart';
import 'package:provider/provider.dart';
import 'New Releses/New_Releses.dart';
import 'Popular/Popular_Movies.dart';
import 'Top Rated/Top_Rated.dart';

class HomeTab extends StatefulWidget {
  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  HomeTabViewModel viewModel = HomeTabViewModel();
  @override
  void initState() {
    super.initState();
    viewModel.getPoplarMovies();
    viewModel.getTopRatedMovies();
    viewModel.getNewReleaseMovies();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<HomeTabViewModel>(
        builder: (context, value, child) {
          // ia error happened show try again
          if (value.errorMessage != null) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/error.png' , height: 70,),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      value.errorMessage!,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(height: 20,),
                ElevatedButton(
                    onPressed: () {
                      value.getPoplarMovies();
                      value.getTopRatedMovies();
                      value.getNewReleaseMovies();
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(MyTheme.DarkGray)),
                    child: const Text(
                      'Try Again',
                      style: TextStyle(color: Colors.white),
                    ))
              ],
            );
          }
          //
          if (value.newReleaseMovies == null ||
              value.popularMovies == null ||
              value.topRatedMovies == null) {
            return const Center(
              child: CircularProgressIndicator(
                color: MyTheme.Gold,
              ),
            );
          } else {
            return SingleChildScrollView(
              child: Column(
                children: [
                  // popular movies
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.33,
                    child: Popular_Movies(Movies: value.popularMovies!),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // new release movies
                  Container(
                      color: MyTheme.Gray,
                      child: New_Releses(Movies: value.newReleaseMovies!)
                  ),
                  // top rated movies
                  Container(
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      color: MyTheme.Gray,
                      child: Top_Rated(Movies: value.topRatedMovies!)
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
