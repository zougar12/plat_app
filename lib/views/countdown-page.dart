import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class DemoApp extends StatefulWidget {
  @override
  _DemoAppState createState() => _DemoAppState();
}

class _DemoAppState extends State<DemoApp> {

  CountDownController _controller = CountDownController();
  bool _isPause = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Timer'),
        centerTitle: true,
      ),
      body:new Stack(
      children: <Widget>[
        new Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(image: new AssetImage("lib/assets/images/plat1.jpeg"), fit: BoxFit.cover,),
          ),
        ),
        Center(
        
        child: CircularCountDownTimer(
            width: MediaQuery.of(context).size.width / 2,
            height: MediaQuery.of(context).size.height / 2,
            duration: 450,
            fillColor: Colors.blue,
            color: Colors.white.withOpacity(0.5),
          controller: _controller,
          backgroundColor: Colors.white.withOpacity(0.0),
          strokeWidth: 10.0,
          strokeCap: StrokeCap.round,
          isTimerTextShown: true,
          isReverse: false,
          onComplete: (){
              Alert(
                  context: context,
                  title: 'Done',
                style: AlertStyle(
                  isCloseButton: true,
                  isButtonVisible: false,
                  titleStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                  ),
                ),
                type: AlertType.success
              ).show();
          },
          textStyle: TextStyle(fontSize: 50.0,color: Colors.blue),
        ),
      )]),
       floatingActionButton: FloatingActionButton.extended(
          onPressed: (){
            setState(() {
              if(_isPause){
                _isPause = false;
                _controller.resume();
              }else{
                _isPause = true;
                _controller.pause();
              }
            });
          },
          icon: Icon(_isPause ? Icons.play_arrow : Icons.pause),
          label: Text(_isPause ? 'Resume' : 'Pause'),
      ),
    );
      
    
  }
}