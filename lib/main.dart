import 'package:flutter/material.dart';
import 'package:newapi1/Service.dart';
import 'package:newapi1/model.dart';
void main(){
  runApp(myapp());
}
class myapp extends StatelessWidget {
  const myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
 //List<NewsModel> newlist =[];
 NewsModel ?newsModel;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   getAllData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News Api")
      ),
      body: ListView.builder(
          itemCount: newsModel?.articles.length,
          itemBuilder: (BuildContext context,index){
        return ListTile(
          leading: CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage("${newsModel?.articles[index].urlToImage}"),
          ),
          title: Text("${newsModel?.articles[index].title}"),
        );
      }),
    );
  }
  Future <void>getAllData()async{
    final alldata= await Newsapi().getapi();
    setState(() {
      newsModel = alldata;
    });
  }
}

