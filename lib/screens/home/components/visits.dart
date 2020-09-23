import 'package:flutter/material.dart';

class Visits extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(26, 26, 26, 0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              VisitsItem(title: "Countries Visited", number: 12),
              VisitsItem(title: "Want to Visit", number: 20),
              VisitsItem(title: "Total Countries", number: 251)
            ],
          ),
          Divider(height: 60, thickness: 2)
        ],
      ),
    );
  }
}

class VisitsItem extends StatelessWidget {
  final String title;
  final int number;

  VisitsItem({ this.title, this.number });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 100,
          child: Text(
            title, 
            textAlign: TextAlign.center, 
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)
          )
        ),
        SizedBox(height: 18),
        Text(number.toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.blue))
      ],
    );
  }
}