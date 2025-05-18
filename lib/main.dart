import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  double currentSliderPrimaryValue = 8;
  bool lightUpper = true;
  bool lightLower = true;
  bool lightNumber = true;
  bool lightChar = true;
  String password = '';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Password Generator', style: TextStyle(color: Colors.black, fontSize: 25)),
          backgroundColor: Colors.lightBlueAccent,
        ),
        body: Expanded(
          child: Column(
            children: <Widget>[
              Slider(
                value: currentSliderPrimaryValue,
                min: 8,
                max: 32,
                divisions: 24,
                // secondaryTrackValue: _currentSliderSecondaryValue,
                label: currentSliderPrimaryValue.round().toString(),
                onChanged: (nvalue) {
                  setState(() {
                    currentSliderPrimaryValue = nvalue;
                  });
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Include lowercase letters', style: TextStyle(fontSize: 20, color: Colors.deepPurple)),
                  Switch(
                    // This bool value toggles the switch.
                    value: lightLower,
                    // overlayColor: overlayColor,
                    // trackColor: trackColor,
                    thumbColor: const WidgetStatePropertyAll<Color>(Colors.black),
                    onChanged: (bool value) {
                      // This is called when the user toggles the switch.
                      setState(() {
                        lightLower = value;
                      });
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Include lowercase letters', style: TextStyle(fontSize: 20, color: Colors.deepPurple)),
                  Switch(
                    // This bool value toggles the switch.
                    value: lightUpper,
                    // overlayColor: overlayColor,
                    // trackColor: trackColor,
                    thumbColor: const WidgetStatePropertyAll<Color>(Colors.black),
                    onChanged: (bool value) {
                      // This is called when the user toggles the switch.
                      setState(() {
                        lightUpper = value;
                      });
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Include lowercase letters', style: TextStyle(fontSize: 20, color: Colors.deepPurple)),
                  Switch(
                    // This bool value toggles the switch.
                    value: lightNumber,
                    // overlayColor: overlayColor,
                    // trackColor: trackColor,
                    thumbColor: const WidgetStatePropertyAll<Color>(Colors.black),
                    onChanged: (bool value) {
                      // This is called when the user toggles the switch.
                      setState(() {
                        lightNumber = value;
                      });
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Include lowercase letters', style: TextStyle(fontSize: 20, color: Colors.deepPurple)),
                  Switch(
                    // This bool value toggles the switch.
                    value: lightChar,
                    // overlayColor: overlayColor,
                    // trackColor: trackColor,
                    thumbColor: const WidgetStatePropertyAll<Color>(Colors.black),
                    onChanged: (bool value) {
                      // This is called when the user toggles the switch.
                      setState(() {
                        lightChar = value;
                      });
                    },
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () =>
                  
                  // do something
                  showDialog<String>(
                    context: context, 
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Password Generated:'),
                        content: Text(password),
                        actions: [
                          TextButton(
                            onPressed: () {}, 
                            child: Text('COPY')
                          ),
                          TextButton(
                            onPressed: () {}, 
                            child: Text('RESET'),
                          )
                        ],
                      );
                    }
                  ),
                child: Text('Generate Password')
              ),
              // TextField(
              //   showCursor: false, 
              //   readOnly: true,
                
              // )
            ],
          ),
        )
      ),
    );
  }
}
