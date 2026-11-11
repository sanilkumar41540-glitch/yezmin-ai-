  import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(const YesminApp());
}

class YesminApp extends StatelessWidget {
  const YesminApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF050505),
        primaryColor: Colors.cyanAccent,
      ),
      home: const YesminHome(),
    );
  }
}

class YesminHome extends StatefulWidget {
  const YesminHome({super.key});

  @override
  State<YesminHome> createState() => _YesminHomeState();
}

class _YesminHomeState extends State<YesminHome> {
  // 1. YouTube തുറക്കാനുള്ള ഫംഗ്ഷൻ
  Future<void> _openYouTube() async {
    final Uri url = Uri.parse('https://www.youtube.com');
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      _showError("YouTube തുറക്കാൻ സാധിച്ചില്ല.");
    }
  }

  // 2. കോൾ ചെയ്യാനുള്ള ഫംഗ്ഷൻ (ഉദാഹരണത്തിന് 100 എന്ന നമ്പറിലേക്ക്)
  Future<void> _makeCall() async {
    final status = await Permission.phone.request();
    if (status.isGranted) {
      final Uri url = Uri.parse('tel:100'); // ഇവിടെ നിങ്ങളുടെ നമ്പർ കൊടുക്കാം
      if (!await launchUrl(url)) {
        _showError("കോൾ ചെയ്യാൻ സാധിച്ചില്ല.");
      }
    } else {
      _showError("ഫോൺ കോൾ ചെയ്യാൻ അനുമതി (Permission) ആവശ്യമാണ്.");
    }
  }

  void _showError(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('YESMIN AI', style: TextStyle(color: Colors.cyanAccent, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ഗ്ലോയിംഗ് AI കോർ
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.cyanAccent.withOpacity(0.5),
                    blurRadius: 40,
                    spreadRadius: 10,
                  ),
                ],
                border: Border.all(color: Colors.cyanAccent, width: 2),
              ),
              child: const Center(
                child: Icon(Icons.mic, size: 60, color: Colors.cyanAccent),
              ),
            ),
            const SizedBox(height: 50),
            const Text("YESMIN കമാൻഡുകൾ", style: TextStyle(color: Colors.grey, fontSize: 16)),
            const SizedBox(height: 20),
            
            // YouTube ബട്ടൺ
            ElevatedButton.icon(
              onPressed: _openYouTube,
              icon: const Icon(Icons.play_arrow),
              label: const Text('YouTube തുറക്കുക'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
            ),
            const SizedBox(height: 20),
            
            // കോൾ ബട്ടൺ
            ElevatedButton.icon(
              onPressed: _makeCall,
              icon: const Icon(Icons.call),
              label: const Text('കോൾ ചെയ്യുക (100)'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
 import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(const YesminApp());
}

class YesminApp extends StatelessWidget {
  const YesminApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF050505),
        primaryColor: Colors.cyanAccent,
      ),
      home: const YesminHome(),
    );
  }
}

class YesminHome extends StatefulWidget {
  const YesminHome({super.key});

  @override
  State<YesminHome> createState() => _YesminHomeState();
}

class _YesminHomeState extends State<YesminHome> {
  // 1. YouTube തുറക്കാനുള്ള ഫംഗ്ഷൻ
  Future<void> _openYouTube() async {
    final Uri url = Uri.parse('https://www.youtube.com');
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      _showError("YouTube തുറക്കാൻ സാധിച്ചില്ല.");
    }
  }

  // 2. കോൾ ചെയ്യാനുള്ള ഫംഗ്ഷൻ (ഉദാഹരണത്തിന് 100 എന്ന നമ്പറിലേക്ക്)
  Future<void> _makeCall() async {
    final status = await Permission.phone.request();
    if (status.isGranted) {
      final Uri url = Uri.parse('tel:100'); // ഇവിടെ നിങ്ങളുടെ നമ്പർ കൊടുക്കാം
      if (!await launchUrl(url)) {
        _showError("കോൾ ചെയ്യാൻ സാധിച്ചില്ല.");
      }
    } else {
      _showError("ഫോൺ കോൾ ചെയ്യാൻ അനുമതി (Permission) ആവശ്യമാണ്.");
    }
  }

  void _showError(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('YESMIN AI', style: TextStyle(color: Colors.cyanAccent, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ഗ്ലോയിംഗ് AI കോർ
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.cyanAccent.withOpacity(0.5),
                    blurRadius: 40,
                    spreadRadius: 10,
                  ),
                ],
                border: Border.all(color: Colors.cyanAccent, width: 2),
              ),
              child: const Center(
                child: Icon(Icons.mic, size: 60, color: Colors.cyanAccent),
              ),
            ),
            const SizedBox(height: 50),
            const Text("YESMIN കമാൻഡുകൾ", style: TextStyle(color: Colors.grey, fontSize: 16)),
            const SizedBox(height: 20),
            
            // YouTube ബട്ടൺ
            ElevatedButton.icon(
              onPressed: _openYouTube,
              icon: const Icon(Icons.play_arrow),
              label: const Text('YouTube തുറക്കുക'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
            ),
            const SizedBox(height: 20),
            
            // കോൾ ബട്ടൺ
            ElevatedButton.icon(
              onPressed: _makeCall,
              icon: const Icon(Icons.call),
              label: const Text('കോൾ ചെയ്യുക (100)'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}               padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
























 Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: .center,
          children: [
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
