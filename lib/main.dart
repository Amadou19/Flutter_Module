import 'package:flutter/material.dart';

import 'hybrid_message_data_api.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in a Flutter IDE). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final HostMessageDataApi? hostApi;
  final FlutterMessageDataApi? flutterApi;
  final MessageData? messageData;

  const MyHomePage({super.key, this.hostApi, this.flutterApi, this.messageData});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late HostMessageDataApi hostApi;
  MessageData? messageData;

  @override
  void initState() {
    super.initState();
    messageData = widget.messageData;
    hostApi = widget.hostApi ?? HostMessageDataApi();

    FlutterMessageDataApi.setup(FlutterMessageDataApiHandler((messageData) {
      setState(() {
        this.messageData = messageData;
      });
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text("Appbar"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('Add text to message Bouton'),
              onPressed: () {
                messageData = MessageData(
                  title: "${messageData?.title} a",
                  subtitle: "${messageData?.subtitle} b",
                );
                hostApi.finishDisplayMessage(messageData!);
              },
            )
          ],
        ),
      ),
    );
  }
}

class FlutterMessageDataApiHandler extends FlutterMessageDataApi {
  final Function(MessageData messageData) callback;

  FlutterMessageDataApiHandler(this.callback);

  @override
  void displayMessage(MessageData messageData) {
    callback(messageData);
  }
}
