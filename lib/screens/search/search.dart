import 'package:travel_app/components/countryCard.dart';
import 'package:travel_app/data/countries.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<Widget> children;

  @override
  void initState() {
    super.initState();
    getCountryList("");
  }

  void getCountryList (String text) {
    List<Widget> newChildren = [];
    text = text.toLowerCase();

    countries.forEach((key, value) {
      if (key.toLowerCase().contains(text) || value.toLowerCase().contains(text)) {
        newChildren.add(
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: CountryCard(code: key, name: value),
          )
        );
      }
    });

    setState(() {
      children = newChildren;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
            hintText: "Find your destination...",
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.white70, fontSize: 18.0),
          ),
          style: TextStyle(color: Colors.white, fontSize: 18.0),
          onChanged: getCountryList,
        )
      ),
      body: GridView.count(
        childAspectRatio: 1.25,
        crossAxisCount: 2,
        children: children,
      )
    );
  }
}