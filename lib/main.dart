import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


Future<Sound> fetchSound(text) async {
    final response = await http.get(Uri.parse('https://text-to-speech-for-28-languages.p.rapidapi.com/'));

  if (response.statusCode == 200){
    return Sound.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load Sound');
  }
}
class Sound{
  final String msg;
  final String lang;
  final String source;


 const Sound({required this.msg, required this.lang, required this.source});


  factory Sound.fromJson(Map<String, dynamic>json) {
    return Sound(
      msg: json['msg'],
      lang: json['lang'],
      source: json['source'],
  
    );
  }
}


void main() =>  runApp(MyApp());

class MyApp extends StatefulWidget {

final TextEditingController textEditingController = TextEditingController();

  MyApp({super.key});

@override
  State<MyApp> createState() =>  _MyAppState();
}

class _MyAppState extends State<MyApp>{
  late Future<Sound> futureSound;
  
  @override
  void initState() {
    super.initState();
    futureSound = fetchSound();
  }
   
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Padding(
        padding:  const EdgeInsets.all(35),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextFormField(
              controller: ,
            ),
            ElevatedButton(
              child: const Text("Speak"),
              onPressed: () => fetchSound(),
            )
          ],
        ),
      )    );

  }
  
}


  
  







  

  
















