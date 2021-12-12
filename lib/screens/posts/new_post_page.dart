
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:soja/screens/home/home.dart';
import 'package:soja/screens/posts/post.dart';
import 'package:soja/shared/constants.dart';

class NewPostPage extends StatelessWidget {

  PostService postService = new PostService();
  String title = "";
  String content = "";
  String error = "";
  String game = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Create a Post'),),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        child: Column(
          children: <Widget> [
            Text("Title", style: TextStyle(fontSize: 20),),
          TextFormField(
            decoration: textInputDecoration.copyWith(hintText: 'Title'),
            onChanged: (val) {
                title = val;
            },
        ),
          Text('Content', style: TextStyle(fontSize: 20),),
          TextFormField(
              decoration: textInputDecoration.copyWith(hintText: 'Content'),
            maxLines: 3,
            onChanged: (val) {
                content = val;
            },
          ),
          Text("Game", style: TextStyle(fontSize: 20),),
          TextFormField(
            decoration: textInputDecoration.copyWith(hintText: 'Game'),
            onChanged: (val) {
              game = val;
            },
          ),
          FlatButton(

            onPressed: ()=> {
                if(title.isEmpty || content.isEmpty || game.isEmpty) {
                  error = "Please fill in all fields!"
                } else
                  {
                    postService.updatePostData(title, content, game)
                        .then((value) => print("Posted Successfully"))

                        .catchError((error) => print("Could oot post")),
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Home())),
                  },
          }, child: Text('Post',
            style: TextStyle(color: Colors.purple, fontSize: 20,),),
          ),
      ]
      ),
      ),
    );
  }
}