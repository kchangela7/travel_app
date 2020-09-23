import 'package:travel_app/screens/home/components/visits.dart';
import 'package:travel_app/screens/search/search.dart';
import 'package:flutter/material.dart';

import 'components/recentSearch.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        overflow: Overflow.visible,
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Image(image: AssetImage('assets/travel_home.png')),
                Visits(),
                RecentSearch(),
                ExploreButton(),
              ],
            ),
          ),
          HeaderText()
        ]
      )
    );
  }
}

class HeaderText extends StatelessWidget {
  const HeaderText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 180),
        Center(
          child: Text(
            "Travelers", 
            style: TextStyle(color: Colors.white, fontSize: 64, letterSpacing: 1, fontWeight: FontWeight.w500)
          )
        )
      ],
    );
  }
}

class ExploreButton extends StatelessWidget {
  const ExploreButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8),
      child: RaisedButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => Search()));
        },
        padding: EdgeInsets.symmetric(horizontal: 120, vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        color: Colors.blue,
        child: Text("Explore", style: TextStyle(color: Colors.white, fontSize: 24))
      ),
    );
  }
}