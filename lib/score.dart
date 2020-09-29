import 'dart:convert';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'socerrmatch.dart';


class ApiScore {
  final String url= "https://api-football-v1.p.rapidapi.com/v2/predictions/157462";
  static const headers ={
    "x-rapidapi-host": "api-football-v1.p.rapidapi.com",
    "x-rapidapi-key": "5022ef2cf0msh568fae8667f34bap12de0fjsn38911ac51e0b",
    "useQueryString": true
  };
  Future <List<SoccerMatch>> getallmatches()async{
    Response response =await get(url,headers: headers);
    var body;
    if(response.statusCode == 200){
      body =jsonDecode(response.body);
      List<dynamic> matchesList = body['response'];
      print("Api service: ${body}"); // to debug
      List<SoccerMatch> matches = matchesList
          .map((dynamic item) => SoccerMatch.fromJson(item))
          .toList();

      return matches;
    }
  }
}