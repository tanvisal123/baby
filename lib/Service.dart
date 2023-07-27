import 'package:http/http.dart'as http;
import 'package:newapi1/model.dart';
class Newsapi{

  Future<NewsModel?> getapi ()async{
    String url = "https://newsapi.org/v2/everything?q=tesla&from=2023-05-24&sortBy=publishedAt&apiKey=0ed714a2609e49a68234977e853bb564";
    final response = await http.get(Uri.parse(url));
    if(response.statusCode==200){
      final json = response.body;
      final result = newsModelFromJson(json);
      print(result);
      return result;
    }
  }
}