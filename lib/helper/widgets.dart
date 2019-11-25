import 'package:flutter/material.dart';
import 'package:gradient_text/gradient_text.dart';
import 'package:posts/screens/details/model.dart';
import 'package:posts/screens/details/view.dart';
import 'package:posts/screens/home/model.dart';
import 'package:random_color/random_color.dart';




Widget postCard(context, PostModel postModel, Color color) {
  return InkWell(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailsScreen(
                    postModel: postModel,
                  )));
    },
    child: Container(
      margin: EdgeInsets.symmetric(vertical: 4.0),
      padding: EdgeInsets.symmetric(vertical: 4.0,horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 5.0,
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CircleAvatar(
                backgroundColor: color,
                child: Text('${postModel.id}'),
              ),
              SizedBox(
                width: 16.0,
              ),
              Flexible(
                child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '${postModel.title}',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Text(
                      '${postModel.body}',
                      style: TextStyle(
                        fontSize: 24.0,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Divider(
            height: 24.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Icon(Icons.favorite_border),
              Icon(Icons.comment),
              Icon(Icons.share),
            ],
          )
        ],
      ),
    ),
  );
}

Widget commentCard({CommentModel commentModel,Color color }) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 4.0),
    padding: EdgeInsets.symmetric(vertical: 8.0,horizontal: 16.0),
    decoration: BoxDecoration(
      color: Colors.white70,
      boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 5.0,
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            CircleAvatar(
              backgroundColor: color,
              child: Text('${commentModel.email[0]}'),
            ),
            SizedBox(
              width: 8.0,
            ),
            Text(
              '${commentModel.email}',
              style: TextStyle(fontWeight: FontWeight.w300),
            ),
          ],
        ),
        SizedBox(
          height: 8.0,
        ),
        Text(
          '${commentModel.name}',
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
        Text(
          '${commentModel.body}',
        ),
        Divider(
          height: 16.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Icon(Icons.favorite_border),
            Icon(Icons.comment),
            Icon(Icons.share),
          ],
        ),
      ],
    ),
  );
}

Widget textIcon ({double fontSize})=> GradientText("FAKE POSTS",
    gradient: LinearGradient(
        colors: [Colors.redAccent, Colors.deepPurpleAccent, Colors.blueAccent]),
    style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
    textAlign: TextAlign.center);
