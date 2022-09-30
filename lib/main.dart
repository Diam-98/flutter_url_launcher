import 'package:flutter/material.dart';
import 'package:flutter_url_launcher/data.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "My URL App Launcher"
          ),
        ),
        body: const HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  void _launchURL(String url) async {
    if(!await launch(url)) throw "Impossible d'ouvrir cette url : $url";
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: data.map((item) {
        return Card(
          child: ListTile(
            onTap: () => _launchURL(item['url']),
            leading: CircleAvatar(
              backgroundColor: Colors.grey.shade100,
              child: FaIcon(
                item['icon'],
                color: item['color'],
              ),
            ),
            title: Text(item['name']),
            subtitle: Text(item['url']),
            trailing: IconButton(
              onPressed: () => _launchURL(item['url']),
              icon: const Icon(
               Icons.arrow_forward,
                size: 25,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}

