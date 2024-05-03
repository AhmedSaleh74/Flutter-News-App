import 'package:dio/dio.dart';
import 'package:untitled4/models/articalModel.dart';

class NewService {
  final dio = Dio();
  // NewService(this.dio);
  Future<List<ArticelModel>> getNews({
    required String category,
}) async {
    try{
      final response = await dio.get(
          'https://newsapi.org/v2/top-headlines?country=us&apiKey=64cc2b11fb6f4fc8b221957a6217151c&category=$category');
      Map<String, dynamic> jsonData = response.data;
      List<dynamic> articles = jsonData['articles'];
      List<ArticelModel> articleList = [];
      for (var article in articles) {
        ArticelModel articlemodel = ArticelModel(
          img: article['urlToImage'],
          title: article['title'],
          subtitle: article['description'],
        );
        articleList.add(articlemodel);
      }
      return articleList;
    }catch(e){
      return [];
    }
  }

}