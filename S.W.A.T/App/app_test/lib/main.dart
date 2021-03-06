import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'api_call_season.dart';

void main() async {
  if (debug) print('Retrieving All Pre-data..');
  await setupData(); //ignore the 'Future' warning

  runApp(MyApp());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.white, //top bar color
    statusBarIconBrightness: Brightness.dark, //top bar icons
    systemNavigationBarColor: Colors.white, //bottom bar color
    systemNavigationBarIconBrightness: Brightness.dark, //bottom bar icons
  ));
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}

int team;
String teamlogo;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Arena',
      home: TeamSelect(),
      routes: <String, WidgetBuilder>{
        '/Baseapp': (context) => Baseapp(),
        '/TeamSelect': (context) => TeamSelect(),
      },
    );
  }
}

class TeamSelect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        brightness: Brightness.light,
        title: Text(
          "  Leaderboard :",
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: Colors.grey[800]),
        ),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      body: Center(
          child: ListView(
              padding: const EdgeInsets.only(
                  bottom: 10, top: 25, left: 15, right: 15),
              children: [
            Padding(
              padding:
                  const EdgeInsets.only(top: 0, bottom: 5, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Rank",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey[900],
                    ),
                  ),
                  Text(
                    "Points",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey[900],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.pinkAccent,
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black87,
                    offset: Offset(0.0, 2.0),
                    spreadRadius: -7.0,
                    blurRadius: 10.0,
                  )
                ],
              ),
              width: 315.0,
              height: 50.0,
              child: Padding(
                padding: const EdgeInsets.only(left: 25.0, right: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      teamStatsOfTeams[0].posTable.toString(),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[900],
                      ),
                    ),
                    Hero(
                      tag: teamsOfTheSeason[0].name,
                      child: FlatButton(
                        child: Image.network(
                          teamsOfTheSeason[0].imageUrl,
                          height: 40,
                        ),
                        color: Colors.transparent,
                        shape: CircleBorder(),
                        onPressed: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(builder: (context) => Baseapp()),
                          );
                          team = 0;
                          teamlogo = teamsOfTheSeason[0].imageUrl;
                        },
                      ),
                    ),
                    Text(
                      ((teamStatsOfTeams[0].wins * 3) +
                              teamStatsOfTeams[0].draws)
                          .toString(),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[900],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.pinkAccent,
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black87,
                    offset: Offset(0.0, 2.0),
                    spreadRadius: -7.0,
                    blurRadius: 10.0,
                  )
                ],
              ),
              width: 315.0,
              height: 50.0,
              child: Padding(
                padding: const EdgeInsets.only(left: 25.0, right: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      teamStatsOfTeams[1].posTable.toString(),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[900],
                      ),
                    ),
                    Hero(
                      tag: teamsOfTheSeason[1].name,
                      child: FlatButton(
                        child: Image.network(
                          teamsOfTheSeason[1].imageUrl,
                          height: 40,
                        ),
                        color: Colors.transparent,
                        shape: CircleBorder(),
                        onPressed: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(builder: (context) => Baseapp()),
                          );
                          team = 1;
                          teamlogo = teamsOfTheSeason[1].imageUrl;
                        },
                      ),
                    ),
                    Text(
                      ((teamStatsOfTeams[1].wins * 3) +
                              teamStatsOfTeams[1].draws)
                          .toString(),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[900],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.pinkAccent,
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black87,
                    offset: Offset(0.0, 2.0),
                    spreadRadius: -7.0,
                    blurRadius: 10.0,
                  )
                ],
              ),
              width: 315.0,
              height: 50.0,
              child: Padding(
                padding: const EdgeInsets.only(left: 25.0, right: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      teamStatsOfTeams[2].posTable.toString(),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[900],
                      ),
                    ),
                    Hero(
                      tag: teamsOfTheSeason[2].name,
                      child: FlatButton(
                        child: Image.network(
                          teamsOfTheSeason[2].imageUrl,
                          height: 40,
                        ),
                        color: Colors.transparent,
                        shape: CircleBorder(),
                        onPressed: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(builder: (context) => Baseapp()),
                          );
                          team = 2;
                          teamlogo = teamsOfTheSeason[2].imageUrl;
                        },
                      ),
                    ),
                    Text(
                      ((teamStatsOfTeams[2].wins * 3) +
                              teamStatsOfTeams[2].draws)
                          .toString(),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[900],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.pinkAccent,
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black87,
                    offset: Offset(0.0, 2.0),
                    spreadRadius: -7.0,
                    blurRadius: 10.0,
                  )
                ],
              ),
              width: 315.0,
              height: 50.0,
              child: Padding(
                padding: const EdgeInsets.only(left: 25.0, right: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      teamStatsOfTeams[3].posTable.toString(),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[900],
                      ),
                    ),
                    Hero(
                      tag: teamsOfTheSeason[3].name,
                      child: FlatButton(
                        child: Image.network(
                          teamsOfTheSeason[3].imageUrl,
                          height: 40,
                        ),
                        color: Colors.transparent,
                        shape: CircleBorder(),
                        onPressed: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(builder: (context) => Baseapp()),
                          );
                          team = 3;
                          teamlogo = teamsOfTheSeason[3].imageUrl;
                        },
                      ),
                    ),
                    Text(
                      ((teamStatsOfTeams[3].wins * 3) +
                              teamStatsOfTeams[3].draws)
                          .toString(),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[900],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.pinkAccent,
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black87,
                    offset: Offset(0.0, 2.0),
                    spreadRadius: -7.0,
                    blurRadius: 10.0,
                  )
                ],
              ),
              width: 315.0,
              height: 50.0,
              child: Padding(
                padding: const EdgeInsets.only(left: 25.0, right: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      teamStatsOfTeams[4].posTable.toString(),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[900],
                      ),
                    ),
                    Hero(
                      tag: teamsOfTheSeason[4].name,
                      child: FlatButton(
                        child: Image.network(
                          teamsOfTheSeason[4].imageUrl,
                          height: 40,
                        ),
                        color: Colors.transparent,
                        shape: CircleBorder(),
                        onPressed: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(builder: (context) => Baseapp()),
                          );
                          team = 4;
                          teamlogo = teamsOfTheSeason[4].imageUrl;
                        },
                      ),
                    ),
                    Text(
                      ((teamStatsOfTeams[4].wins * 3) +
                              teamStatsOfTeams[4].draws)
                          .toString(),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[900],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.pinkAccent,
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black87,
                    offset: Offset(0.0, 2.0),
                    spreadRadius: -7.0,
                    blurRadius: 10.0,
                  )
                ],
              ),
              width: 315.0,
              height: 50.0,
              child: Padding(
                padding: const EdgeInsets.only(left: 25.0, right: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      teamStatsOfTeams[5].posTable.toString(),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[900],
                      ),
                    ),
                    Hero(
                      tag: teamsOfTheSeason[5].name,
                      child: FlatButton(
                        child: Image.network(
                          teamsOfTheSeason[5].imageUrl,
                          height: 40,
                        ),
                        color: Colors.transparent,
                        shape: CircleBorder(),
                        onPressed: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(builder: (context) => Baseapp()),
                          );
                          team = 5;
                          teamlogo = teamsOfTheSeason[5].imageUrl;
                        },
                      ),
                    ),
                    Text(
                      ((teamStatsOfTeams[5].wins * 3) +
                              teamStatsOfTeams[5].draws)
                          .toString(),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[900],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.pinkAccent,
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black87,
                    offset: Offset(0.0, 2.0),
                    spreadRadius: -7.0,
                    blurRadius: 10.0,
                  )
                ],
              ),
              width: 315.0,
              height: 50.0,
              child: Padding(
                padding: const EdgeInsets.only(left: 25.0, right: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      teamStatsOfTeams[6].posTable.toString(),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[900],
                      ),
                    ),
                    Hero(
                      tag: teamsOfTheSeason[6].name,
                      child: FlatButton(
                        child: Image.network(
                          teamsOfTheSeason[6].imageUrl,
                          height: 40,
                        ),
                        color: Colors.transparent,
                        shape: CircleBorder(),
                        onPressed: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(builder: (context) => Baseapp()),
                          );
                          team = 6;
                          teamlogo = teamsOfTheSeason[6].imageUrl;
                        },
                      ),
                    ),
                    Text(
                      ((teamStatsOfTeams[6].wins * 3) +
                              teamStatsOfTeams[6].draws)
                          .toString(),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[900],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.pinkAccent,
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black87,
                    offset: Offset(0.0, 2.0),
                    spreadRadius: -7.0,
                    blurRadius: 10.0,
                  )
                ],
              ),
              width: 315.0,
              height: 50.0,
              child: Padding(
                padding: const EdgeInsets.only(left: 25.0, right: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      teamStatsOfTeams[7].posTable.toString(),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[900],
                      ),
                    ),
                    Hero(
                      tag: teamsOfTheSeason[7].name,
                      child: FlatButton(
                        child: Image.network(
                          teamsOfTheSeason[7].imageUrl,
                          height: 40,
                        ),
                        color: Colors.transparent,
                        shape: CircleBorder(),
                        onPressed: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(builder: (context) => Baseapp()),
                          );
                          team = 7;
                          teamlogo = teamsOfTheSeason[7].imageUrl;
                        },
                      ),
                    ),
                    Text(
                      ((teamStatsOfTeams[7].wins * 3) +
                              teamStatsOfTeams[7].draws)
                          .toString(),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[900],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.pinkAccent,
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black87,
                    offset: Offset(0.0, 2.0),
                    spreadRadius: -7.0,
                    blurRadius: 10.0,
                  )
                ],
              ),
              width: 315.0,
              height: 50.0,
              child: Padding(
                padding: const EdgeInsets.only(left: 25.0, right: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      teamStatsOfTeams[8].posTable.toString(),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[900],
                      ),
                    ),
                    Hero(
                      tag: teamsOfTheSeason[8].name,
                      child: FlatButton(
                        child: Image.network(
                          teamsOfTheSeason[8].imageUrl,
                          height: 40,
                        ),
                        color: Colors.transparent,
                        shape: CircleBorder(),
                        onPressed: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(builder: (context) => Baseapp()),
                          );
                          team = 8;
                          teamlogo = teamsOfTheSeason[8].imageUrl;
                        },
                      ),
                    ),
                    Text(
                      ((teamStatsOfTeams[8].wins * 3) +
                              teamStatsOfTeams[8].draws)
                          .toString(),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[900],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.pinkAccent,
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black87,
                    offset: Offset(0.0, 2.0),
                    spreadRadius: -7.0,
                    blurRadius: 10.0,
                  )
                ],
              ),
              width: 315.0,
              height: 50.0,
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      teamStatsOfTeams[9].posTable.toString(),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[900],
                      ),
                    ),
                    Hero(
                      tag: teamsOfTheSeason[9].name,
                      child: FlatButton(
                        child: Image.network(
                          teamsOfTheSeason[9].imageUrl,
                          height: 40,
                        ),
                        color: Colors.transparent,
                        shape: CircleBorder(),
                        onPressed: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(builder: (context) => Baseapp()),
                          );
                          team = 9;
                          teamlogo = teamsOfTheSeason[9].imageUrl;
                        },
                      ),
                    ),
                    Text(
                      ((teamStatsOfTeams[9].wins * 3) +
                              teamStatsOfTeams[9].draws)
                          .toString(),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[900],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.pinkAccent,
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black87,
                    offset: Offset(0.0, 2.0),
                    spreadRadius: -7.0,
                    blurRadius: 10.0,
                  )
                ],
              ),
              width: 315.0,
              height: 50.0,
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      teamStatsOfTeams[10].posTable.toString(),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[900],
                      ),
                    ),
                    Hero(
                      tag: teamsOfTheSeason[10].name,
                      child: FlatButton(
                        child: Image.network(
                          teamsOfTheSeason[10].imageUrl,
                          height: 40,
                        ),
                        color: Colors.transparent,
                        shape: CircleBorder(),
                        onPressed: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(builder: (context) => Baseapp()),
                          );
                          team = 10;
                          teamlogo = teamsOfTheSeason[10].imageUrl;
                        },
                      ),
                    ),
                    Text(
                      ((teamStatsOfTeams[10].wins * 3) +
                              teamStatsOfTeams[10].draws)
                          .toString(),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[900],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.pinkAccent,
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black87,
                    offset: Offset(0.0, 2.0),
                    spreadRadius: -7.0,
                    blurRadius: 10.0,
                  )
                ],
              ),
              width: 315.0,
              height: 50.0,
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      teamStatsOfTeams[11].posTable.toString(),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[900],
                      ),
                    ),
                    Hero(
                      tag: teamsOfTheSeason[11].name,
                      child: FlatButton(
                        child: Image.network(
                          teamsOfTheSeason[11].imageUrl,
                          height: 40,
                        ),
                        color: Colors.transparent,
                        shape: CircleBorder(),
                        onPressed: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(builder: (context) => Baseapp()),
                          );
                          team = 11;
                          teamlogo = teamsOfTheSeason[11].imageUrl;
                        },
                      ),
                    ),
                    Text(
                      ((teamStatsOfTeams[11].wins * 3) +
                              teamStatsOfTeams[11].draws)
                          .toString(),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[900],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.pinkAccent,
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black87,
                    offset: Offset(0.0, 2.0),
                    spreadRadius: -7.0,
                    blurRadius: 10.0,
                  )
                ],
              ),
              width: 315.0,
              height: 50.0,
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      teamStatsOfTeams[12].posTable.toString(),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[900],
                      ),
                    ),
                    Hero(
                      tag: teamsOfTheSeason[12].name,
                      child: FlatButton(
                        child: Image.network(
                          teamsOfTheSeason[12].imageUrl,
                          height: 40,
                        ),
                        color: Colors.transparent,
                        shape: CircleBorder(),
                        onPressed: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(builder: (context) => Baseapp()),
                          );
                          team = 12;
                          teamlogo = teamsOfTheSeason[12].imageUrl;
                        },
                      ),
                    ),
                    Text(
                      ((teamStatsOfTeams[12].wins * 3) +
                              teamStatsOfTeams[12].draws)
                          .toString(),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[900],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.pinkAccent,
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black87,
                    offset: Offset(0.0, 2.0),
                    spreadRadius: -7.0,
                    blurRadius: 10.0,
                  )
                ],
              ),
              width: 315.0,
              height: 50.0,
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      teamStatsOfTeams[13].posTable.toString(),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[900],
                      ),
                    ),
                    Hero(
                      tag: teamsOfTheSeason[13].name,
                      child: FlatButton(
                        child: Image.network(
                          teamsOfTheSeason[13].imageUrl,
                          height: 40,
                        ),
                        color: Colors.transparent,
                        shape: CircleBorder(),
                        onPressed: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(builder: (context) => Baseapp()),
                          );
                          team = 13;
                          teamlogo = teamsOfTheSeason[13].imageUrl;
                        },
                      ),
                    ),
                    Text(
                      ((teamStatsOfTeams[13].wins * 3) +
                              teamStatsOfTeams[13].draws)
                          .toString(),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[900],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.pinkAccent,
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black87,
                    offset: Offset(0.0, 2.0),
                    spreadRadius: -7.0,
                    blurRadius: 10.0,
                  )
                ],
              ),
              width: 315.0,
              height: 50.0,
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      teamStatsOfTeams[14].posTable.toString(),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[900],
                      ),
                    ),
                    Hero(
                      tag: teamsOfTheSeason[14].name,
                      child: FlatButton(
                        child: Image.network(
                          teamsOfTheSeason[14].imageUrl,
                          height: 40,
                        ),
                        color: Colors.transparent,
                        shape: CircleBorder(),
                        onPressed: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(builder: (context) => Baseapp()),
                          );
                          team = 14;
                          teamlogo = teamsOfTheSeason[14].imageUrl;
                        },
                      ),
                    ),
                    Text(
                      ((teamStatsOfTeams[14].wins * 3) +
                              teamStatsOfTeams[14].draws)
                          .toString(),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[900],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.pinkAccent,
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black87,
                    offset: Offset(0.0, 2.0),
                    spreadRadius: -7.0,
                    blurRadius: 10.0,
                  )
                ],
              ),
              width: 315.0,
              height: 50.0,
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      teamStatsOfTeams[15].posTable.toString(),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[900],
                      ),
                    ),
                    Hero(
                      tag: teamsOfTheSeason[15].name,
                      child: FlatButton(
                        child: Image.network(
                          teamsOfTheSeason[15].imageUrl,
                          height: 40,
                        ),
                        color: Colors.transparent,
                        shape: CircleBorder(),
                        onPressed: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(builder: (context) => Baseapp()),
                          );
                          team = 15;
                          teamlogo = teamsOfTheSeason[15].imageUrl;
                        },
                      ),
                    ),
                    Text(
                      ((teamStatsOfTeams[15].wins * 3) +
                              teamStatsOfTeams[15].draws)
                          .toString(),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[900],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.pinkAccent,
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black87,
                    offset: Offset(0.0, 2.0),
                    spreadRadius: -7.0,
                    blurRadius: 10.0,
                  )
                ],
              ),
              width: 315.0,
              height: 50.0,
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      teamStatsOfTeams[16].posTable.toString(),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[900],
                      ),
                    ),
                    Hero(
                      tag: teamsOfTheSeason[16].name,
                      child: FlatButton(
                        child: Image.network(
                          teamsOfTheSeason[16].imageUrl,
                          height: 40,
                        ),
                        color: Colors.transparent,
                        shape: CircleBorder(),
                        onPressed: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(builder: (context) => Baseapp()),
                          );
                          team = 16;
                          teamlogo = teamsOfTheSeason[16].imageUrl;
                        },
                      ),
                    ),
                    Text(
                      ((teamStatsOfTeams[16].wins * 3) +
                              teamStatsOfTeams[16].draws)
                          .toString(),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[900],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.pinkAccent,
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black87,
                    offset: Offset(0.0, 2.0),
                    spreadRadius: -7.0,
                    blurRadius: 10.0,
                  )
                ],
              ),
              width: 315.0,
              height: 50.0,
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      teamStatsOfTeams[17].posTable.toString(),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[900],
                      ),
                    ),
                    Hero(
                      tag: teamsOfTheSeason[17].name,
                      child: FlatButton(
                        child: Image.network(
                          teamsOfTheSeason[17].imageUrl,
                          height: 40,
                        ),
                        color: Colors.transparent,
                        shape: CircleBorder(),
                        onPressed: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(builder: (context) => Baseapp()),
                          );
                          team = 17;
                          teamlogo = teamsOfTheSeason[17].imageUrl;
                        },
                      ),
                    ),
                    Text(
                      ((teamStatsOfTeams[17].wins * 3) +
                              teamStatsOfTeams[17].draws)
                          .toString(),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[900],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.pinkAccent,
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black87,
                    offset: Offset(0.0, 2.0),
                    spreadRadius: -7.0,
                    blurRadius: 10.0,
                  )
                ],
              ),
              width: 315.0,
              height: 50.0,
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      teamStatsOfTeams[18].posTable.toString(),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[900],
                      ),
                    ),
                    Hero(
                      tag: teamsOfTheSeason[18].name,
                      child: FlatButton(
                        child: Image.network(
                          teamsOfTheSeason[18].imageUrl,
                          height: 40,
                        ),
                        color: Colors.transparent,
                        shape: CircleBorder(),
                        onPressed: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(builder: (context) => Baseapp()),
                          );
                          team = 18;
                          teamlogo = teamsOfTheSeason[18].imageUrl;
                        },
                      ),
                    ),
                    Text(
                      ((teamStatsOfTeams[18].wins * 3) +
                              teamStatsOfTeams[18].draws)
                          .toString(),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[900],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.pinkAccent,
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black87,
                    offset: Offset(0.0, 2.0),
                    spreadRadius: -7.0,
                    blurRadius: 10.0,
                  )
                ],
              ),
              width: 315.0,
              height: 50.0,
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      teamStatsOfTeams[19].posTable.toString(),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[900],
                      ),
                    ),
                    Hero(
                      tag: teamsOfTheSeason[19].name,
                      child: FlatButton(
                        child: Image.network(
                          teamsOfTheSeason[19].imageUrl,
                          height: 40,
                        ),
                        color: Colors.transparent,
                        shape: CircleBorder(),
                        onPressed: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(builder: (context) => Baseapp()),
                          );
                          team = 19;
                          teamlogo = teamsOfTheSeason[19].imageUrl;
                        },
                      ),
                    ),
                    Text(
                      ((teamStatsOfTeams[19].wins * 3) +
                              teamStatsOfTeams[19].draws)
                          .toString(),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[900],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ])),
    );
  }
}

class Baseapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: ListView(
        padding: EdgeInsets.only(bottom: 15, top: 0, left: 25, right: 25),
        children: [
          SizedBox(height: 40.0),
          Hero(
            tag: teamsOfTheSeason[team].name,
            child: FlatButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TeamSelect()),
                );
              },
              child: Image.network(
                teamlogo,
                height: 80,
              ),
              color: Colors.transparent,
              shape: CircleBorder(),
            ),
          ),
          SizedBox(height: 15),
          Text(
            teamsOfTheSeason[team].name,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Comfortaa',
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Colors.grey[800],
            ),
          ),
          SizedBox(height: 20.0),
          Container(
            decoration: BoxDecoration(
              color: Colors.greenAccent,
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black87,
                  offset: Offset(0.0, 7.0),
                  spreadRadius: -7.0,
                  blurRadius: 10.0,
                )
              ],
            ),
            width: 330.0,
            height: 540.0,
            child: ListView(
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.only(bottom: 15, top: 0, left: 10, right: 10),
              children: [
                SizedBox(height: 7.0),
                Text('Premier League',
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 22.0,
                      fontFamily: 'Comfortaa',
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[800],
                    )),
                SizedBox(height: 2.0),
                Text('2019 - 2020',
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey[800],
                        fontFamily: 'Comfortaa')),
                SizedBox(height: 25.0),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.tealAccent[700],
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black87,
                        offset: Offset(0.0, 2.0),
                        spreadRadius: -7.0,
                        blurRadius: 10.0,
                      )
                    ],
                  ),
                  width: 315.0,
                  height: 60.0,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Matches",
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 30,
                            fontFamily: 'Comfortaa',
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Text(
                          (teamStatsOfTeams[team].matchesPlayed).toString(),
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 30,
                            fontFamily: 'Comfortaa',
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 15.0),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.tealAccent[700],
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black87,
                        offset: Offset(0.0, 2.0),
                        spreadRadius: -7.0,
                        blurRadius: 10.0,
                      )
                    ],
                  ),
                  width: 315.0,
                  height: 60.0,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Won",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 30,
                            fontFamily: 'Comfortaa',
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Text(
                          teamStatsOfTeams[team].wins.toString(),
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 30,
                            fontFamily: 'Comfortaa',
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 15.0),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.tealAccent[700],
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black87,
                        offset: Offset(0.0, 2.0),
                        spreadRadius: -7.0,
                        blurRadius: 10.0,
                      )
                    ],
                  ),
                  width: 315.0,
                  height: 60.0,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Lost",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 30,
                            fontFamily: 'Comfortaa',
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Text(
                          teamStatsOfTeams[team].losses.toString(),
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 30,
                            fontFamily: 'Comfortaa',
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 15.0),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.tealAccent[700],
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black87,
                        offset: Offset(0.0, 2.0),
                        spreadRadius: -7.0,
                        blurRadius: 10.0,
                      )
                    ],
                  ),
                  width: 315.0,
                  height: 60.0,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Draws",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 30,
                            fontFamily: 'Comfortaa',
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Text(
                          teamStatsOfTeams[team].draws.toString(),
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 30,
                            fontFamily: 'Comfortaa',
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 15.0),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.tealAccent[700],
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black87,
                        offset: Offset(0.0, 2.0),
                        spreadRadius: -7.0,
                        blurRadius: 10.0,
                      )
                    ],
                  ),
                  width: 315.0,
                  height: 60.0,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Scored",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 30,
                            fontFamily: 'Comfortaa',
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Text(
                          teamStatsOfTeams[team].scoredRatio.toStringAsFixed(2),
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 30,
                            fontFamily: 'Comfortaa',
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 15.0),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.tealAccent[700],
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black87,
                        offset: Offset(0.0, 2.0),
                        spreadRadius: -7.0,
                        blurRadius: 10.0,
                      )
                    ],
                  ),
                  width: 315.0,
                  height: 60.0,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Conceded",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 30,
                            fontFamily: 'Comfortaa',
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Text(
                          teamStatsOfTeams[team].concedRatio.toStringAsFixed(2),
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 30,
                            fontFamily: 'Comfortaa',
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 45.0),
          SizedBox(height: 10.0),
          Container(
            decoration: BoxDecoration(
              color: Colors.pinkAccent,
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black87,
                  offset: Offset(0.0, 7.0),
                  spreadRadius: -7.0,
                  blurRadius: 10.0,
                )
              ],
            ),
            width: 315.0,
            height: 135.0,
            child: Column(
              children: <Widget>[
                SizedBox(height: 10.0),
                Text("Upcoming Match",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: 'Comfortaa',
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    )),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Image.network(
                      teamStatsOfTeams[team].upcomingMatch.homeTeam.imageUrl,
                      height: 60,
                    ),
                    Text(
                      "- VS -",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.w200),
                    ),
                    Image.network(
                      teamStatsOfTeams[team].upcomingMatch.awayTeam.imageUrl,
                      height: 60,
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Text(
                  teamStatsOfTeams[team].upcomingMatch.dateTime.toString(),
                  style: TextStyle(fontSize: 10),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
