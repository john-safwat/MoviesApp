import 'package:flutter/material.dart';
import 'package:movies/Presentation/Theme/Theme.dart';
import 'package:movies/Presentation/UI/Home/Tabs/HomeTab/HomeTabViewModel.dart';
import 'package:provider/provider.dart';
import '../../../../../../DataBase/Api/ApiManager/Api_Manager.dart';
import 'Top_Rated.dart';

class Top_Rated_Widget extends StatefulWidget {
  @override
  State<Top_Rated_Widget> createState() => _Top_Rated_WidgetState();
}

class _Top_Rated_WidgetState extends State<Top_Rated_Widget> {
  HomeTabViewModel viewModel =  HomeTabViewModel();
  @override
  void initState() {
    super.initState();
    viewModel.getTopRatedMovies();
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        color: MyTheme.Gray,
        child: Consumer<HomeTabViewModel>(
          builder: (context, value, child) {
            if(value.errorMessage != null){
              return Column(
                children: [
                  Text(
                      value.errorMessage!,
                      style:const TextStyle(color: Colors.white),
                    ),
                  ElevatedButton(
                    onPressed: (){
                      viewModel.getTopRatedMovies();
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(MyTheme.DarkGray)
                    ),
                    child:const Text(
                      "TryAgain",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              );
            }
            if(value.topRatedMovies == null){
              return const Center(
                child: CircularProgressIndicator(color: MyTheme.Gold,),
              );
            }else{
              return Top_Rated(Movies: value.topRatedMovies!);
            }
          },
        )
      ),
    );
  }
}
