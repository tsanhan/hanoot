
import './auth.dart';
import './text_to_image.dart';
import 'package:speech_recognition/speech_recognition.dart';
import 'package:flutter/material.dart';



import './stt.dart';

class TestServices extends StatefulWidget {

  @override
  _TestServicesState createState() => _TestServicesState();
}

class _TestServicesState extends State<TestServices> {
  
  //region SpeechRecognition 
  SpeechRecognition _speechRecognition;
  bool _isAvailable = false;
  bool _isListening = false;

  String resultText = '';

  @override
  void initState() {
    // TODO: implement initState
    initSpeachRecognizer();
    super.initState();

  }

  void initSpeachRecognizer(){
    _speechRecognition = SpeechRecognition();
    _speechRecognition.setAvailabilityHandler((bool result) => setState(() => _isAvailable = result));
    _speechRecognition.setRecognitionStartedHandler(() => setState(() => _isListening = true));
    _speechRecognition.setRecognitionResultHandler((String speech) => setState(() => resultText = speech));
    _speechRecognition.setRecognitionCompleteHandler(() => setState(() => _isListening = false));
    _speechRecognition.activate().then((result) => setState(() =>  _isAvailable = result));
  }
  //
  
  final AuthService _auth = AuthService();
  final TextToImage _textToImage = TextToImage();

  
  @override
  Widget build(BuildContext context) {
  return  SafeArea (
        child: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
           children: <Widget>[
        
            RaisedButton(
              child: Text("Sign in anon"),
              onPressed: ()async{
                var userData = await _auth.signInAnon();
                if(userData == null){
                  print("error signing in");
                }else{
                  print("signed in");
                  print(userData);

                }
              },),
            RaisedButton(
              child: Text("Sign Out"),
              onPressed: ()async{
                var userData = await _auth.signOut();
                if(userData == null){
                  print("error signing in");
                }else{
                  print("signed out");
                  print(userData);

                }
              },),
            RaisedButton(
          child: Text("Text To Image"),
          onPressed: () async {
            var textToImageString = await _textToImage.textToImage("חלב");
            if(textToImageString == null){
              print("error Text To Image");
            }else{
              print("Text To Image!!!");
              print(textToImageString);

            }
          },),
            
            Container(
              
              child: SingleChildScrollView(
                  child: Column(
                  
                  children: <Widget>[
                    FloatingActionButton(
                      child: Icon(Icons.cancel),
                      onPressed: (){
                        if(_isListening)
                        _speechRecognition.cancel().then((result) => setState(() {
                          _isListening = result;
                          resultText = '';}));
                      }),
                    FloatingActionButton(
                      child: Icon(Icons.mic),
                      
                      onPressed:  (){
                        if(_isAvailable && !_isListening)
                        _speechRecognition.listen(locale: "en_US").then((result) => print('$result'));
                      }),
                    FloatingActionButton(
                      child: Icon(Icons.stop),
                      onPressed:  (){
                        if(_isListening)
                        _speechRecognition.stop().then((result) => setState(() => _isListening = result));
                      }),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.cyanAccent[100]
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8
                      ),
                      child: Text(resultText),)
                  ],
                
                ),
              ),
            )
            // RaisedButton(
            //     child: Text("speech rec"),
            //     onPressed: (){ 
                  
            //     },
            //   ),  
              
           ]

        ),
    );
      
  }
}