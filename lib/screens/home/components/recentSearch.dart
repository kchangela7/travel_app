import 'package:travel_app/components/countryCard.dart';
import 'package:flutter/material.dart';


class RecentSearch extends StatelessWidget {
  const RecentSearch({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Recent Searches", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                FlatButton(
                  onPressed: () {},
                  child: Text(
                    "See All", 
                    style: TextStyle(fontSize: 16)
                  )
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SizedBox(width: 12),
                CountryCard(name: "United States", code: "US"),
                CountryCard(name: "Netherlands", code: "NL"),
                CountryCard(name: "Canada", code: "CA"),
                SizedBox(width: 12)
              ],
            ),
          )
        ],
      ),
    );
  }
}