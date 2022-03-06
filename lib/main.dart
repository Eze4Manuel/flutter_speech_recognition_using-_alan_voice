import 'package:alan_voice/alan_voice.dart';
import 'package:flutter/material.dart';
import 'package:external_app_launcher/external_app_launcher.dart';

void main() {
  runApp(
    const MaterialApp(
      home: AlanSpeech(),
    ),
  );
}

class AlanSpeech extends StatefulWidget {
  const AlanSpeech({Key? key}) : super(key: key);

  @override
  _AlanSpeechState createState() => _AlanSpeechState();
}

class _AlanSpeechState extends State<AlanSpeech> {

  _MyHomePageState() {
    AlanVoice.addButton("92326eb5570070aca38065b8253b53da2e956eca572e1d8b807a3e2338fdd0dc/stage",
        buttonAlign: AlanVoice.BUTTON_ALIGN_LEFT
    );

    AlanVoice.onCommand.add((command) async {
      if(command.data['command'] == 'youtube' ){
        await LaunchApp.openApp(
          androidPackageName: 'com.google.android.youtube',
          appStoreLink: 'https://play.google.com/store/apps/details?id=com.google.android.youtube&hl=en&gl=US',
          // openStore: false
        );
      }
      debugPrint("got new command ${command}");
      debugPrint("got new command ${command.data['command']}");
    });
  }

  @override
  initState() {
    _MyHomePageState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Alan Speech recognition')),
        ),
        body: const Center(
          child: Text(
            'Speech Recognition',
            style: TextStyle(
                fontSize: 20
            ),
          ),
        ));
  }
}