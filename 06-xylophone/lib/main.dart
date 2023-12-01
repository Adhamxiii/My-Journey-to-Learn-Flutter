import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(const XylophoneApp());

class XylophoneApp extends StatefulWidget {
  const XylophoneApp({Key? key}) : super(key: key);

  @override
  State<XylophoneApp> createState() => _XylophoneAppState();
}

class _XylophoneAppState extends State<XylophoneApp> {
  Future<void> playSound(int noteNum) async {
    AudioPlayer player = AudioPlayer();
    await player.play(AssetSource('note$noteNum.wav'));
  }

  Expanded buildKey({required Color color, required int noteNum}) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(backgroundColor: color),
        onPressed: () {
          setState(() {
            playSound(noteNum);
          });
        },
        child: const Text(''),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildKey(color: Colors.red, noteNum: 1),
              buildKey(color: Colors.orange, noteNum: 2),
              buildKey(color: Colors.yellow, noteNum: 3),
              buildKey(color: Colors.green, noteNum: 4),
              buildKey(color: Colors.teal, noteNum: 5),
              buildKey(color: Colors.blue, noteNum: 6),
              buildKey(color: Colors.purple, noteNum: 7),
            ],
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
