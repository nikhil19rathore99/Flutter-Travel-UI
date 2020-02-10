import 'package:flutter/material.dart';

import '../places.dart';
import 'placescreen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _search = 0;

  Column _buildPopularPlaces() {
    List<Widget> popularPlaces = [];
    places.forEach((place) {
      popularPlaces.add(Container(
        height: 80.0,
        child: Center(
          child: ListTile(
            leading: Hero(
              tag: place.imageUrl,
              child: Image(
                image: AssetImage(place.imageUrl),
              ),
            ),
            title: Text(
              place.city,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0),
            ),
            subtitle: Text(
              '${place.properties} properties',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            trailing: InkResponse(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => PlaceScreen(place: place)));
              },
              child: Container(
                height: 50.0,
                width: 50.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Color(0xFFFAF6F1),
                ),
                child: Icon(
                  Icons.arrow_forward,
                  size: 15.0,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
      ));
    });

    return Column(children: popularPlaces);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 50.0),
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.menu),
                color: Colors.black,
                onPressed: () => print("pressed"),
              ),
            ],
          ),
          SizedBox(height: 30.0),
          Text(
            'Book unique homes\nand expereinces',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
          ),
          SizedBox(height: 40.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              FlatButton(
                padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  side: BorderSide(
                      color: _search == 0
                          ? Colors.transparent
                          : Color(0xFFD2D1D6)),
                ),
                color: _search == 0 ? Color(0xFFFFC05F) : null,
                child: Text(
                  'Flight',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
                onPressed: () {
                  setState(() {
                    _search = 0;
                  });
                },
              ),
              FlatButton(
                padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  side: BorderSide(
                      color: _search == 1
                          ? Colors.transparent
                          : Color(0xFFD2D1D6)),
                ),
                color: _search == 1 ? Color(0xFFFFC05F) : null,
                child: Text(
                  'Hotel',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
                onPressed: () {
                  setState(() {
                    _search = 1;
                  });
                },
              ),
            ],
          ),
          SizedBox(height: 30.0),
          TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Where",
              icon: Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Color(0xFFEEF8FF),
                ),
                child: Icon(
                  Icons.location_on,
                  size: 25.0,
                  color: Color(0xFF309DF1),
                ),
              ),
            ),
          ),
          Divider(height: 40.0),
          TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Check-in - Check-out",
              icon: Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Color(0xFFEEF8FF),
                ),
                child: Icon(
                  Icons.calendar_today,
                  size: 25.0,
                  color: Color(0xFF309DF1),
                ),
              ),
            ),
          ),
          Divider(height: 40.0),
          TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "1 Adult, 0 Childern, 2 Room",
              icon: Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Color(0xFFEEF8FF),
                ),
                child: Icon(
                  Icons.person,
                  size: 25.0,
                  color: Color(0xFF309DF1),
                ),
              ),
            ),
          ),
          Divider(height: 40.0),
          FlatButton(
            padding: EdgeInsets.symmetric(vertical: 25.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            color: Color(0xFF309DF1),
            child: Text(
              'Search',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            onPressed: () => print('search'),
          ),
          SizedBox(height: 30.0),
          Text(
            'Popular Places',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20.0),
          _buildPopularPlaces(),
        ],
      ),
    );
  }
}
