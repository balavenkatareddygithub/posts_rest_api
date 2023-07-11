import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'model_class.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);


  @override

  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   //ScrollController scrollController =ScrollController();
  List<Posts>postList=[];

   Future<List<Posts>>getPostsApi()async{
    final Response response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data = jsonDecode(response.body.toString());
    if(response.statusCode==200){
      for(Map<String, dynamic> index in data){
        postList.add(Posts.fromJson(index));
      }
      return postList;
    }else{
      return postList;
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("POSTS REST API",style: TextStyle(fontSize: 22),),
        centerTitle: true,
      ),
      body:Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getPostsApi(),
                builder: (context,snapshot){
                if(!snapshot.hasData){
                  return const Text('loading...');
                }else{
                  return ListView.builder(
                   // controller:scrollController,
                    itemCount: postList.length,
                      itemBuilder:(context,index){
                      return Card(
                        child: Padding(
                          padding:const EdgeInsets.all(8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment:CrossAxisAlignment.start,
                            children: [
                              ListTile(leading:CircleAvatar(child: Text(postList[index].id.toString()),),),
                             const Text('TITLE',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                          const SizedBox(height: 10,),
                          Text(postList[index].title.toString()),
                              const SizedBox(height: 10,),
                              const Text('DESCRIPTION',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                             const SizedBox(height: 10,),
                              Text(postList[index].body.toString()),
                            ],
                          ),
                        ),
                      );
                      });
                }
                }),
          )
        ],
      ) ,

    );
  }
}
