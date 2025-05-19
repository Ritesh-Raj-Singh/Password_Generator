import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  double noofchar = 8;
  bool lightUpper = true;
  bool lightLower = true;
  bool lightNumber = true;
  bool lightChar = true;
  String password = 'Click generate';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Password Generator', style: TextStyle(color: Colors.black, fontSize: 25)),
              backgroundColor: Colors.lightBlueAccent,
            ),
            body: Column(
              children: <Widget>[
                Slider(
                  value: noofchar,
                  min: 8,
                  max: 32,
                  divisions: 24,
                  // secondaryTrackValue: _currentSliderSecondaryValue,
                  label: noofchar.round().toString(),
                  onChanged: (nvalue) {
                    setState(() {
                      noofchar = nvalue;
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
                    Text('Include uppercase letters', style: TextStyle(fontSize: 20, color: Colors.deepPurple)),
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
                    Text('Include numbers', style: TextStyle(fontSize: 20, color: Colors.deepPurple)),
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
                    Text('Include special characters', style: TextStyle(fontSize: 20, color: Colors.deepPurple)),
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
                  onPressed: () {
                    setState(() {
                    if(!(lightLower || lightUpper || lightNumber || lightChar)){
                      // dialog(context, password);
                      // setState(() {
                        // debugPrint('here');
                        showDialog(
                          context: context, 
                          builder: (BuildContext content){
                            return AlertDialog(
                              title: Text('No Password Generated'),
                              content: Text('Please select at least one type of elements to generate a valid password.'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    setState(() {
                                    Navigator.pop(context);
                                    });
                                  }, 
                                  child: Text('OK')
                                )
                              ],
                            );
                          }
                        );
                      // });
                    }
                    else {
                      // setState(() {
                        // debugPrint('there');
                        password = generate(lightLower, lightUpper, lightNumber, lightChar, noofchar);
                      // });
                    }
                    });
                  },
                  
                  // onPressed: () => dialog(context, password),
                    // do something
                  child: Text('Generate Password')
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Text('Generated Password:', style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Text(password),
                ),
                ElevatedButton(
                  onPressed: () {
                    Clipboard.setData(ClipboardData(text: password))
                        .then((_) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Copied to your clipboard !')));
                    });
                  },
                  child: const Text('Copy'),
                ),
              ],
            )
          );
        }
      ),
    );
  }

}

generate(bool lightLower, bool lightUpper, bool lightNumber, bool lightChar, double noofchar){

List all = [
  List.filled(26, '', growable: false), 
  List.filled(26, '', growable: false),
  List.filled(10, '', growable: false),
  List.filled(15, '', growable: false),
];
for(int i = 97; i < 123; i++) {
  all[0][i-97] = String.fromCharCode(i);
}
for(int i = 65; i < 90; i++) {
  all[1][i-65] = String.fromCharCode(i);
}
for(int i = 48; i < 58; i++) {
  all[2][i-48] = String.fromCharCode(i);
}
for(int i = 33; i < 48; i++) {
  all[3][i-33] = String.fromCharCode(i);
}
// generates a new Random object
final rrandom = Random();

var test = [];
if(lightLower) test.add(0);
if(lightUpper) test.add(1);
if(lightNumber) test.add(2);
if(lightChar) test.add(3);

String password = '';

// generate a random index based on the list length
// and use it to retrieve the element
for(int i = 0; i < noofchar; i++){
  var indx = test[rrandom.nextInt(test.length)];
  password += all[indx][rrandom.nextInt(all[indx].length)];
}
// debugPrint(password);

return password;
}


// below one is not used (change of code plan)
void dialog(BuildContext context, String password){
  var alert = AlertDialog(
    title: Text('Password Generated:'),
    content: Text(password),
    actions: [
      TextButton(
        onPressed: () {}, 
        child: Text('CANCEL')
      ),
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

  showDialog(
    context: context, 
    builder: (BuildContext context){
      return alert;
    }
  );
}