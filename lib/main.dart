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

  //
  _MyHomePageState() {

    // Adds alan voice button using your API_KEY instance and specifies
    // the position of our button

    AlanVoice.addButton(' YOUR API_KEY goes here ',
        buttonAlign: AlanVoice.BUTTON_ALIGN_LEFT
    );

    // sets a command to be performed on speech match

    AlanVoice.onCommand.add((command) async {
      if(command.data['command'] == 'youtube' ){

        // Launches the application when a match occurs

        await LaunchApp.openApp(
          androidPackageName: 'com.google.android.youtube',
          appStoreLink: 'https://play.google.com/store/apps/details?id=com.google.android.youtube&hl=en&gl=US',
          // openStore: false
        );
      }

      // debugs the output to the console

      debugPrint("got new command ${command}");
      debugPrint("got new command ${command.data['command']}");
    });
  }

  @override
  initState() {
    // Initializes alan voice button to listen to speech
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