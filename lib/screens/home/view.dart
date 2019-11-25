import 'package:flutter/material.dart';
import 'package:posts/helper/widgets.dart';
import 'package:posts/screens/details/view.dart';
import 'package:posts/screens/home/control.dart';
import 'package:posts/screens/home/model.dart';
import 'package:random_color/random_color.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: textIcon(fontSize: 32.0),
        ),
        body: FutureBuilder<List<PostModel>>(
          future: fetchData(),
          builder: (context, snapshot) {
            return snapshot.hasData
                ? ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: snapshot.data.length,
                    itemBuilder: (_, index) {
                      RandomColor _randomColor = RandomColor();
                      Color _color = _randomColor.randomColor(
                          colorHue: ColorHue.purple,
                          colorBrightness: ColorBrightness.dark,
                          colorSaturation: ColorSaturation.highSaturation
                      );
                      return postCard(context,snapshot.data[index],_color);
                    },
                  )
                : Center(child: CircularProgressIndicator());
          },
        ));
  }
}
