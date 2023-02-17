// 1. stateless 인 예시

// import 'package:flutter/material.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget{
//     @override
//     Widget build(BuildContext context){
//         return MaterialApp(
//             title: 'Measures Converter',
//             home: Scaffold(
//                 appBar: AppBar(title: Text('Measures Converter'),),
//                 body: Center(child: Text('Measures Converter'),),
//             ),
//         );
//     }
// }


// // 2. statefulwidge으로 바꾸기
//
// import 'package:flutter/material.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatefulWidget {
//     @override
//     MyAppState createState() => MyAppState();
// }
//
// class MyAppState extends State<MyApp>{
//     @override
//     Widget build(BuildContext context){
//         return MaterialApp(
//             title: 'Measures Converter',
//             home: Scaffold(
//                 appBar: AppBar(title: Text('Measures Converter'),),
//                 body: Center(child: Text('Measures Converter'),),
//             ),
//         );
//     }
// }


// 3. textfield에서 사용자입력 받기(onchanged 메서드), 숫자 입력하면 그대로 출력

// import 'package:flutter/material.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatefulWidget {
//     @override
//     MyAppState createState() => MyAppState();
// }
//
// class MyAppState extends State<MyApp> {
//     double _numberFrom = 0.0;
//
//     @override
//     void initState() {
//         _numberFrom = 0;
//         super.initState();
//     }
//
//     @override
//     Widget build(BuildContext context) {
//         return MaterialApp(
//             title: 'Measures Converter',
//             home: Scaffold(
//                 appBar: AppBar(
//                     title: Text('Measures Converter'),
//                 ),
//                 body: Center(
//                     child: Column(
//                         children: [
//                             TextField(
//                                 onChanged: (text) {
//                                     var rv = double.tryParse(text);
//                                     if (rv != null) {
//                                         setState(() {
//                                             _numberFrom = rv;
//                                         });
//                                     }
//                                 },
//                             ),
//                             Text((_numberFrom == null) ? '' : _numberFrom.toString())
//                         ],
//                     ),
//                 ),
//             ),
//         );
//     }
// }


// 4. dropdown menu 만들기(버튼의 존재와 사용자선택에 따라 응답하는 거와 별개라 빈칸바꾸는 함수도 만듦)
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
    @override
    MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
    String _startMeasure = 'meters';
    final List<String> _measures = [    'meters',    'kilometers',    'grams',    'kilograms',    'feet',    'miles',    'pounds(lbs)',    'ounces',  ];
    double _numberFrom = 0.0;

    @override
    void initState() {
        super.initState();
        _numberFrom = 0;
    }

    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            title: 'Measures Converter',
            home: Scaffold(
                appBar: AppBar(
                    title: Text('Measures Converter'),
                ),
                body: Center(
                    child: Column(
                        children: [
                            DropdownButton(
                                value: _startMeasure,
                                items: _measures
                                    .map((String value) {
                                    return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                    );
                                })
                                    .toList(),
                                onChanged: (value) {
                                    setState(() {
                                      _startMeasure = value;
                                    });
                                },
                            ),
                            TextField(
                                onChanged: (text) {
                                    var rv = double.tryParse(text);
                                    if (rv != null) {
                                        setState(() {
                                            _numberFrom = rv;
                                        });
                                    }
                                },
                            ),
                            Text((_numberFrom == null) ? '' : _numberFrom.toString())
                        ],
                    ),
                ),
            ),
        );
    }
}
