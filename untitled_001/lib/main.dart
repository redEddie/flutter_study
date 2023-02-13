import 'package:flutter/material.dart';

void main() => runApp(MyApp());

// 1. 생짜로 그냥 텍스트 출력하는 예제
// class MyApp extends StatelessWidget{
//   @override
//   Widget build(BuildContext context){
//     return Center(
//       child: Text(
//         'Hello World Travel',
//         textDirection: TextDirection.ltr,
//       ),
//     );
//   }
// }

// 2. material 이용한 예제
// class MyApp extends StatelessWidget{
//   @override
//   Widget build(BuildContext context){
//     return MaterialApp(
//       title : "Hello World Travel Title",
//       home: Center(child:Text('Hello World Travel'))
//     );
//   }
// }

// 3.scaffold 이용한 예제
// class MyApp extends StatelessWidget{
//   @override
//   Widget build(BuildContext context){
//     return MaterialApp(
//         title : "Hello World Travel Title",
//         home: Scaffold(
//           appBar: AppBar(title:  Text("Hello World Travel App")),
//           body: Center(child: Text('Hello World Travel')),
//         )
//     );
//   }
// }

// 4. 예쁘게 꾸미기 위해 색깔을 집어넣음
// class MyApp extends StatelessWidget{
//   @override
//   Widget build(BuildContext context){
//     return MaterialApp(
//       title: "Hello World Travel Title",
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("Hellow World Travel App"),
//           backgroundColor: Colors.deepPurple,
//         ),
//         body: Center(
//           child: Text(
//             'Hello World Travel',
//             style: TextStyle(
//               fontSize: 26,
//               fontWeight: FontWeight.bold,
//               color: Colors.blue[800]
//             ),
//           )
//         )
//       )
//     );
//   }
// }

// // 5. 한줄말고 두줄 이상 쓸려면 column 과 children 이용
// class MyApp extends StatelessWidget{
//   @override
//   Widget build(BuildContext context){
//     return MaterialApp(
//       title: "Hello World Travel Title",
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("Hellow World Travel App"),
//           backgroundColor: Colors.deepPurple,
//         ),
//         body: Center(
//           child: Column(children: [
//           Text(
//             'Hello World Travel',
//             style: TextStyle(
//               fontSize: 26,
//               fontWeight: FontWeight.bold,
//               color: Colors.blue[800]),
//             ),
//           Text(
//             'Discover the World',
//             style: TextStyle(
//               fontSize: 20,
//               color: Colors.deepPurpleAccent),
//           )]))));
//   }
// }

// 6. 사진 넣기, 버튼 넣기
// class MyApp extends StatelessWidget{
//   @override
//   Widget build(BuildContext context){
//     return MaterialApp(
//       title: "Hello World Travel Title",
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("Hellow World Travel App"),
//           backgroundColor: Colors.deepPurple,
//         ),
//         body: Center(
//           child: Column(children: [
//             Text(
//               'Hello World Travel',
//               style: TextStyle(
//                 fontSize: 26,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.blue[800]),
//             ),
//             Text(
//               'Discover the World',
//               style: TextStyle(
//                 fontSize: 20,
//                 color: Colors.deepPurpleAccent),
//             ),
//             Image.network(
//               'http://images.freeimages.com/images/large-previews/eaa/the-beach-1464354.jpg',
//               height: 350,
//             ),
//             ElevatedButton(onPressed: ()=>true, child: Text('Contact Us')),
//           ]))));
//   }
// }

// 7. 응답하는 버튼 만들기, 꽤나 까다로움.
// #1 눌린 버튼이 alert를 불러오도록 #2 scaffold가 center위젯을 포함하도록. 거기에 알림창 뜸.
// class MyApp extends StatelessWidget{
//   @override
//   Widget build(BuildContext context){
//     return MaterialApp(
//         title: "Hello World Travel Title",
//         home: Scaffold(
//             appBar: AppBar(
//               title: Text("Hello World Travel App"),
//               backgroundColor: Colors.deepPurple,
//             ),
//             body: Builder(
//               builder: (context) => Center(
//                 child: Column(children: [
//                   Text(
//                     'Hello World Travel',
//                     style: TextStyle(
//                         fontSize: 26,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.blue[800]),
//                   ),
//                   Text('Discover the World', style: TextStyle(
//                         fontSize: 20, color: Colors.deepPurpleAccent),
//                   ),
//                   Image.network(
//                     'http://images.freeimages.com/images/large-previews/eaa/the-beach-1464354.jpg',
//                     height: 350,
//                   ),
//                   ElevatedButton(onPressed: ()=> contactUs(context), child: Text('Contact Us')),
//                 ])))));
//   }
//
//   void contactUs(BuildContext context){
//     showDialog(context: context, builder: (BuildContext context){
//       return AlertDialog(
//         title: Text('Contact Us'),
//         content: Text('Mail us at hello@world.com'),
//         actions: <Widget>[
//           TextButton(onPressed: ()=>Navigator.of(context).pop(), child: Text('Close'))
//         ],
//       );
//     },);
//   }
// }

// 8. 패딩, 스크롤기능 넣어 rotate되어도 랜더에러 발생하지 않게
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Hello World Travel Title",
        home: Scaffold(
            appBar: AppBar(
              title: Text("Hello World Travel App"),
              backgroundColor: Colors.deepPurple,),
            body: Builder(
                builder: (context) => SingleChildScrollView(
                    child: Padding(

                        padding: EdgeInsets.all(20),
                        child: Center(
                            child: Column(children: [
                              Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    'Hello World Travel',
                                    style: TextStyle(
                                        fontSize: 26,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue[800]),
                                  )),
                              Padding(
                                  padding: EdgeInsets.all(5),
                                  child: Text(
                                    'Discover the World',

                                    style: TextStyle(fontSize: 20, color:
                                    Colors.deepPurpleAccent),
                                  )),
                              Padding(
                                  padding: EdgeInsets.all(15),
                                  child: Image.network('https://images.freeimages.com/images/large-previews/eaa/the-beach-1464354.jpg',
                                    height: 350,
                                  )),
                              Padding(
                                  padding: EdgeInsets.all(15),
                                  child: ElevatedButton(

                                    child: Text('Contact Us'),
                                    onPressed: () => contactUs(context),
                                  )),
                            ])))))));
  }

  void contactUs(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Contact Us'),
          content: Text('Mail us at hello@world.com'),
          actions: <Widget>[
            TextButton(
              child: Text('Close'),
              onPressed: () => Navigator.of(context).pop(),
            )
          ],
        );
      },
    );
  }
}