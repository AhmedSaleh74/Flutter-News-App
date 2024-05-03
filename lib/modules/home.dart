import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled4/modules/List_Tile.dart';
import 'package:untitled4/modules/category_model.dart';
import '../models/articalModel.dart';
import '../services/newsServices.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'News',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              'Cloud',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.orangeAccent,
              ),
            ),
          ],
        ),
      ),
      body:const CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers:[
          SliverToBoxAdapter(child:CatModel(),),
          SliverToBoxAdapter(child: SizedBox(height: 25.0,),),
          NewsListViewBuilder(category: 'general',),
        ],
      ) ,

      // body: const Column(
      //   children: [
      //     CatModel(),
      //     SizedBox(
      //       height: 25.0,
      //     ),
      //     NewsTile(),
      //   ],
      // ),
    );
  }
}

class NewsListViewBuilder extends StatelessWidget {
  const NewsListViewBuilder({super.key , required this.category});
  final String category;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create:(context){return Future();},
      child: Consumer<Future>(builder: (BuildContext context, Future data, Widget? child) {
        return FutureBuilder<List<ArticelModel>>(
          future: data.future,
          builder: (context , snapshot){
            if(snapshot.hasData){
              return NewsListView(articels: snapshot.data ?? [],);
            }
            else if(snapshot.hasError){
              return const SliverToBoxAdapter(child: Text('Oops There Was an Error , Try Later'),);
            }
            else{
              return  const SliverToBoxAdapter(child: Center(child: CircularProgressIndicator()));
            }
          },
        );
      },),);
  }
}

class Future extends ChangeNotifier {
  var future = NewService().getNews(
    category:'general',
  );
}
