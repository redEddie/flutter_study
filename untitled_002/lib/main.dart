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
//     String? _startMeasure = 'meters'; //아니 스트링 앞에 ? 붙이는거 당황쓰..
//     final List<String> _measures = [    'meters',    'kilometers',    'grams',    'kilograms',    'feet',    'miles',    'pounds(lbs)',    'ounces',  ];
//     double _numberFrom = 0.0;
//
//     @override
//     void initState() {
//         super.initState();
//         _numberFrom = 0;
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
//                             DropdownButton(
//                                 value: _startMeasure,
//                                 items: _measures.map((String value) {
//                                     return DropdownMenuItem<String>(
//                                         value: value,
//                                         child: Text(value),
//                                     );
//                                 }).toList(),
//                                 onChanged: (value) {
//                                     setState(() {
//                                         _startMeasure = value;
//                                     });
//                                 },
//                             ),
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


// 5. 전체적인 UI. css 마냥 스타일 함수처럼 해놓고 재활용하기: textstyle widget
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
//     String? _convertedMeasure = 'kilometers';
//     String? _startMeasure = 'meters'; //아니 스트링 앞에 ? 붙이는거 당황쓰..
//     final List<String> _measures = [    'meters',    'kilometers',    'grams',    'kilograms',    'feet',    'miles',    'pounds(lbs)',    'ounces',  ];
//     double _numberFrom = 0.0;
//
//     @override
//     void initState() {
//         super.initState();
//         _numberFrom = 0;
//     }
//
//     @override
//     final TextStyle inputStyle = TextStyle( //이거시 inputstlye 위젯
//         fontSize: 20,
//         color: Colors.blue[900],
//     );
//     final TextStyle labelStyle = TextStyle(
//         fontSize: 24,
//         color: Colors.grey[700],
//     );
//     Widget build(BuildContext context) {
//         return MaterialApp(
//             title: 'Measures Converter',
//             home: Scaffold(
//                 appBar: AppBar(
//                     title: Text('Measures Converter'),
//                 ),
//                 body: Container(
//                     padding: EdgeInsets.symmetric(horizontal: 20),
//                     child: SingleChildScrollView(
//                         child: ConstrainedBox(
//                             constraints: BoxConstraints(minHeight: 700.0),
//                             child: IntrinsicHeight(
//                                 child: Column(
//                                     children: [
//                                         Spacer(),
//                                         Text(
//                                             'Value',
//                                             style: labelStyle,
//                                         ),
//                                         Spacer(),
//                                         TextField(
//                                             style: inputStyle,
//                                             decoration: InputDecoration(
//                                                 hintText: "Please insert the measure to be converted",
//                                             ),
//                                             onChanged: (text) {
//                                                 var rv = double.tryParse(text);
//                                                 if (rv != null) {
//                                                     setState(() {
//                                                         _numberFrom = rv;
//                                                     });
//                                                 }
//                                             },
//                                         ),
//                                         Spacer(),
//                                         Text(
//                                             'From',
//                                             style: labelStyle,
//                                         ),
//                                         DropdownButton(
//                                             isExpanded: true,
//                                             items: _measures.map((String value) {
//                                                 return DropdownMenuItem<String>(
//                                                     value: value,
//                                                     child: Text(value, style: inputStyle,),
//                                                 );
//                                             }).toList(),
//                                             onChanged: (value) {//선택한 옵션이 달라지면~
//                                                 setState(() {
//                                                     _startMeasure = value;
//                                                 });
//                                             },
//                                             value: _startMeasure,
//                                         ),
//                                         Spacer(),
//                                         Text('To', style: labelStyle,),
//                                         DropdownButton(
//                                             isExpanded: true,
//                                             items: _measures.map((String value) {
//                                                 return DropdownMenuItem<String>(
//                                                     value: value,
//                                                     child: Text(value, style: inputStyle,),
//                                                 );
//                                             }).toList(),
//                                             onChanged: (value) {//선택한 옵션이 달라지면~
//                                                 setState(() {
//                                                     _convertedMeasure = value;
//                                                 });
//                                             },
//                                             value: _convertedMeasure,
//                                         ),
//                                         Spacer(flex: 2,),
//                                         ElevatedButton(onPressed: ()=>true,
//                                             child: Text('Convert', style:inputStyle),),
//                                         Spacer(flex:2,),
//                                         Text((_numberFrom == null) ? '' : _numberFrom.toString(), style: labelStyle),
//                                         Spacer(flex:8,),
//                                     ],
//                                 ),
//                             ),
//                         ),
//                     ),
//                 ),
//             ),
//         );
//     }
// }


// 6. 앱이 동작하기 위한 '비즈니스 로직' 추가
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
    @override
    MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
    String? _convertedMeasure = 'kilometers';
    String? _startMeasure = 'meters'; //아니 스트링 앞에 ? 붙이는거 당황쓰..
    final List<String> _measures = [    'meters',    'kilometers',    'grams',    'kilograms',    'feet',    'miles',    'pounds(lbs)',    'ounces',  ];
    double _numberFrom = 0.0;

    @override //비즈니스 로직
    final Map<String, int> _measuresMap = {
        'meters' : 0, 'kilometers' : 1, 'grams' : 2, 'kilograms' : 3, 'feet' : 4, 'miles' : 5, 'pounds (lbs)' : 6, 'ounces' : 7,
    };

    @override
    final dynamic _formulas = {
        '0' : [1, 0.001, 0, 0, 3.28004, 0.000621317, 0, 0],
        '1' : [1000, 1, 0, 0, 3280.04, 0.621317, 0, 0],
        '2' : [0, 0, 1, 0.001, 0, 0, 0.00220462, 0.035277],
        '3' : [0, 0, 1000, 1, 0, 0, 2.20462, 35.277],
        '4' : [0.3048, 0.0003048, 0, 0, 1, 0.000189394, 0, 0],
        '5' : [1609.34, 1.60934, 0, 0, 5280, 1, 0, 0],
        '6' : [0, 0, 453.592, 0.453592, 0, 0, 1, 16],
        '7' : [0, 0, 28.3495, 0.0283495, 3.28084, 0, 0.0625, 1],
    };

    @override //
    void initState() {
        super.initState();
        _numberFrom = 0;
    }

    @override //이거시 inputstlye 위젯
    final TextStyle inputStyle = TextStyle(
        fontSize: 20,
        color: Colors.blue[900],
    );
    final TextStyle labelStyle = TextStyle(
        fontSize: 24,
        color: Colors.grey[700],
    );
    Widget build(BuildContext context) {
        return MaterialApp(
            title: 'Measures Converter',
            home: Scaffold(
                appBar: AppBar(
                    title: Text('Measures Converter'),
                ),
                body: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: SingleChildScrollView(
                        child: ConstrainedBox(
                            constraints: BoxConstraints(minHeight: 700.0),
                            child: IntrinsicHeight(
                                child: Column(
                                    children: [
                                        Spacer(),
                                        Text(
                                            'Value',
                                            style: labelStyle,
                                        ),
                                        Spacer(),
                                        TextField(
                                            style: inputStyle,
                                            decoration: InputDecoration(
                                                hintText: "Please insert the measure to be converted",
                                            ),
                                            onChanged: (text) {
                                                var rv = double.tryParse(text);
                                                if (rv != null) {
                                                    setState(() {
                                                        _numberFrom = rv;
                                                    });
                                                }
                                            },
                                        ),
                                        Spacer(),
                                        Text(
                                            'From',
                                            style: labelStyle,
                                        ),
                                        DropdownButton(
                                            isExpanded: true,
                                            items: _measures.map((String value) {
                                                return DropdownMenuItem<String>(
                                                    value: value,
                                                    child: Text(value, style: inputStyle,),
                                                );
                                            }).toList(),
                                            onChanged: (value) {//선택한 옵션이 달라지면~
                                                setState(() {
                                                    _startMeasure = value;
                                                });
                                            },
                                            value: _startMeasure,
                                        ),
                                        Spacer(),
                                        Text('To', style: labelStyle,),
                                        DropdownButton(
                                            isExpanded: true,
                                            items: _measures.map((String value) {
                                                return DropdownMenuItem<String>(
                                                    value: value,
                                                    child: Text(value, style: inputStyle,),
                                                );
                                            }).toList(),
                                            onChanged: (value) {//선택한 옵션이 달라지면~
                                                setState(() {
                                                    _convertedMeasure = value;
                                                });
                                            },
                                            value: _convertedMeasure,
                                        ),
                                        Spacer(flex: 2,),
                                        ElevatedButton(
                                            onPressed: (){
                                                if (_startMeasure?.isEmpty == true || _convertedMeasure?.isEmpty == true || _numberFrom == 0) {
                                                    return;
                                                }
                                                else{
                                                    convert(_numberFrom, _startMeasure, _convertedMeasure);
                                                }
                                            },
                                            child: Text('Convert', style:inputStyle),
                                        ),
                                        Spacer(flex:2,),
                                        Text((_resultMessage == null) ? '' : _resultMessage, style: labelStyle),
                                        Spacer(flex:8,),
                                    ],
                                ),
                            ),
                        ),
                    ),
                ),
            ),
        );
    }

    String _resultMessage = '';

    @override
    void convert(double value, String? from, String? to){
        int nFrom = _measuresMap[from]!;
        int nTo = _measuresMap[to]!;
        var multiplier = _formulas[nFrom.toString()][nTo];
        double result = value * multiplier;

        if (result==0){
            _resultMessage = 'This conversion cannot be performed';
        } else{
            _resultMessage = '${_numberFrom.toString()} $_startMeasure are ${result.toString()} $_convertedMeasure';
        }
        setState(() {
          _resultMessage = _resultMessage;
        });
    }
}