import 'package:flutter/material.dart';
import 'package:travel_app/components/countryCard.dart';
import 'package:travel_app/components/loading.dart';
import 'package:travel_app/data/countries.dart';
import 'package:travel_app/models/countryData.dart';

class CountryInfo extends StatefulWidget {
  final String code;
  
  CountryInfo({ this.code });

  @override
  _CountryInfoState createState() => _CountryInfoState();
}

class _CountryInfoState extends State<CountryInfo> {
  CountryData data;

  String getFlagAssetPath (String code) {
    return "assets/flags/${code.toLowerCase()}.png";
  }

  Future<void> fetchData(String code) async {
    CountryData instance = new CountryData(code: code);
    await instance.getData();

    setState(() {
      data = instance;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchData(widget.code);
  }

  @override
  Widget build(BuildContext context) {
    return data == null ? Loading() : Scaffold(
      appBar: AppBar(
        title: Text(data.name),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FittedBox(
              child: Image.asset(getFlagAssetPath(data.code)),
              fit: BoxFit.fill
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(16, 0, 16, 12),
                    child: Text(
                      data.fullName, 
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  DataDisplay(category: "Travel Advisory", info: data.travelAdvise),
                  DataDisplay(category: "Currency", info: data.currency),
                  DataDisplay(category: "Languages", info: data.languages.toString()),
                ],
              ),
            ),
            NeighborCountries(data: data),
            SizedBox(height: 12)
          ],
        ),
      )
    );
  }
}

class NeighborCountries extends StatelessWidget {
  const NeighborCountries({
    Key key,
    @required this.data,
  }) : super(key: key);

  final CountryData data;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 12, 24, 6),
          child: Text("Neighboring Countries:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
        if (data.neighbors != null) SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(data.neighbors.length + 1, (index) {
              if (index == 0 || index == data.neighbors.length + 1) {
                return SizedBox(width: 12);
              } else {
                String code;
                String name = data.neighbors[index - 1];

                countries.forEach((key, value) {
                  if (value == name) {
                    code = key;
                  }
                });
                if (code != null) {
                  return CountryCard(code: code, name: name);
                }
              }
              return SizedBox(width: 0);
            })
          ),
        ),
      ],
    );
  }
}

class DataDisplay extends StatelessWidget {
  final String category;
  final String info;

  DataDisplay({this.category, this.info});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(category + ': ', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Container(
            width: 220,
            child: Text(
              info ?? "None",
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.end,
            )
          )
        ]
      ),
    );
  }
}