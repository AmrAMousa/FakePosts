import 'package:flutter/material.dart';
import 'package:posts/helper/widgets.dart';
import 'package:posts/screens/details/control.dart';
import 'package:posts/screens/details/model.dart';
import 'package:posts/screens/home/model.dart';
import 'package:random_color/random_color.dart';

class DetailsScreen extends StatefulWidget {
  final PostModel postModel;

  const DetailsScreen({this.postModel});

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios),
        title: textIcon(fontSize: 32.0),
      ),
      body: SafeArea(
          child: FutureBuilder<List<CommentModel>>(
        future: fetchData(widget.postModel.id),
        builder: (context, snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: snapshot.data.length + 1,
                  itemBuilder: (_, index) {
                    RandomColor _randomColor = RandomColor();
                    Color _color = _randomColor.randomColor(
                        colorHue: ColorHue.red,
                        colorSaturation: ColorSaturation.highSaturation
                    );
                    return index == 0
                        ? postCard(context, widget.postModel,_color)
                        : commentCard(commentModel: snapshot.data[index - 1],color: _color);
                  },
                )
              : Center(child: CircularProgressIndicator());
        },
      )),
    );
  }
}
