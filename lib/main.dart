import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Assignment #3 Hello User',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Assignment #3 Hello User'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late String username = "";
  late bool is_logining = false;

  void _loginUser() {
    setState(() {
      is_logining = true;
    });

    getUserInfo().then((value) {
      setState(() {
        is_logining = false;
      });

      setState(() {
        username = value ?? "";
      });
    });
  }

  String greetText() {
    if (is_logining) {
      return "Logging in...";
    } else if (username.isEmpty) {
      return "Login fails";
    } else {
      return "Hello $username";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              greetText(),
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _loginUser,
        tooltip: 'login',
        child: const Icon(Icons.login),
      ),
    );
  }
}

int index = 0;
final usernameList = ['Peter', 'Jacob', 'Steve', null];
Future<String?> getUserInfo() async {
  index = index % usernameList.length;
  return Future.delayed(
      const Duration(seconds: 3), () => usernameList[index++]);
}
