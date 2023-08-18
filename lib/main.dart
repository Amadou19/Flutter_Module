import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';
import 'hybrid_message_data_api.dart';
import 'package:firebase_core/firebase_core.dart';

//void main() => runApp(const MyApp());
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

  // Cause a crash
  //throw StateError('This is a Dart exception.');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
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
                //throw StateError('This is a Dart exception.');
                //FirebaseCrashlytics.instance.crash();
                messageData = MessageData(
                  title: "${messageData?.title} A",
                  subtitle: "${messageData?.subtitle} C",
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
