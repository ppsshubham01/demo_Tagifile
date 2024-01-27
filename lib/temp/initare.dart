//
//
// initiate
// http://192.168.1.142:8001/tf/core/api/service/dev/v1/personal/content/v1/upload/initiate/
// Get method


//     Header
// Accept:*/*
// Accept-Encoding:gzip, deflate
// Accept-Language:en-GB,en-US;q=0.9,en;q=0.8,gu;q=0.7
// Authorization:Token 1938157ea06eae6a70567e31a10c2fbb287bca5b
// Connection:keep-alive
// Content-Type:application/json
// Host:192.168.1.142:8001
// Origin:http://192.168.1.142:3000
// Referer:http://192.168.1.142:3000/
// User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36
//
//Preview
// data: {upload_tracker_key: "4baf391d-483f-4a9c-8ec2-a63b92f76e88", target_id: 37439}
// target_id: 37439
// upload_tracker_key: "4baf391d-483f-4a9c-8ec2-a63b92f76e88"
// msg: "Successfully created upload tracker."
// status: 200

// Response
// {
//     "status": 200,
//         "upload_tracker_key
//     "msg": "Successfully created upload tracker.",
//     "data": {": "7287d3a7-6ed0-4203-b6af-1cf351d7ff76",
//         "target_id": 36206
//     }
// }
//


// Upload
// http://192.168.1.142:8006/tf/core/api/service/dev/v1/personal/content/file/v1/upload/
// POST
// HEADERS
//
// Accept:application/json, text/plain, */*
// Accept-Encoding:gzip, deflate
// Accept-Language:en-GB,en-US;q=0.9,en;q=0.8,gu;q=0.7
// Authorization:Token 1938157ea06eae6a70567e31a10c2fbb287bca5b
// Connection:keep-alive
// Content-Length:123710
// Content-Type:multipart/form-data; boundary=----WebKitFormBoundaryHtZePkk8l8uelzBB
// Host:192.168.1.142:8006
// In_org:false
//
// pAYLOAD
// name: photo-1705318778520-3367daf5ace7.jpg
// B_size: 122779
// upload_to: 36206
// type: image/jpeg
// directory_path:
// file: (binary)
// org_id:
// org_owner_id:
//
// rESPONCE
//
// {"data":195864,"message":"OK","status":200}

// LISTcONTENT
// content_path: ""
// filter_by: ""
// only_dirs: false
// org_id: null
// page_range: {pg_from: 0, pg_to: 100}
// pg_from: 0
// pg_to: 100
// parent_id: 0
// sort_by: "NULL"
// sort_order: "NULL"



// thubNail

// http://192.168.1.142:8001/tf/core/api/service/dev/v1/personal/content/thumbnail/v1/get/256px/195914/
// Get method

// in this last one is content-id

// Content-Length:6442
// Content-Type:image/jpeg
// Authorization   : Token 1964569068594f476e89391f6bc86f5925e8c085

//Detailos for files jpd or else
// http://192.168.1.142:8001/tf/core/api/service/dev/v1/personal/content/file/v1/get/195723/
//
// Get method
//
// Content-Type:application/json
// Authorization:
// Token 1964569068594f476e89391f6bc86f5925e8c085
//
// Preview
//
// data: {is_directory: false, content_name: "lake.jpg", content_size: 278910, content_type: "image/jpeg",…}
// content_id: 195723
// content_name: "lake.jpg"
// content_parent_id: 37439
// content_path: "Tagifiles/"
// content_size: 278910
// content_thumbnails: []
// content_type: "image/jpeg"
// create_date: "2024-01-19T07:57:06.825433Z"
// in_org: false
// is_directory: false
// org_id: -1
// update_date: "2024-01-19T07:57:09.513936Z"
// msg: "Successfully fetched content!"
// status: 200
//
//
// Response
// {
// "status": 200,
// "msg": "Successfully fetched content!",
// "data": {
// "is_directory": false,
// "content_name": "lake.jpg",
// "content_size": 278910,
// "content_type": "image/jpeg",
// "content_id": 195723,
// "content_thumbnails": [],
// "content_parent_id": 37439,
// "content_path": "Tagifiles/",
// "create_date": "2024-01-19T07:57:06.825433Z",
// "update_date": "2024-01-19T07:57:09.513936Z",
// "in_org": false,
// "org_id": -1
// }
// }





























// <key>NSAllowsArbitraryLoads</key>
// <true/>
// <key>CFBundleURLTypes</key>
// <array>
// <dict>
// <key>CFBundleURLSchemes</key>
// <array>
// <!-- Replace 'com.example.myapp' with your app's bundle identifier -->
// <string>com.example.myapp</string>
// </array>
// </dict>
// </array>
// <key>UTExportedTypeDeclarations</key>
// <array>
// <!-- Add the following entry for sharing files -->
// <dict>
// <key>UTTypeIdentifier</key>
// <string>public.data</string>
// <key>UTTypeDescription</key>
// <string>All Files</string>
// <key>UTTypeConformsTo</key>
// <array>
// <string>public.item</string>
// </array>
// <key>UTTypeTagSpecification</key>
// <dict>
// <key>public.filename-extension</key>
// <array>
// <string>*</string>
// </array>
// </dict>
// </dict>
// </array>









//
//
// To achieve the desired effect of displaying a line in a `DialogBox` in Flutter that gradually decreases in length over a 5-second duration, you can use the `AnimatedBuilder` widget along with the `Tween` and `AnimationController` classes. Here's a simple example to get you started:
//
// ```dart
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: MyDialog(),
//     );
//   }
// }
//
// class MyDialog extends StatefulWidget {
//   @override
//   _MyDialogState createState() => _MyDialogState();
// }
//
// class _MyDialogState extends State<MyDialog> with TickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _animation;
//
//   @override
//   void initState() {
//     super.initState();
//
//     // Create AnimationController
//     _controller = AnimationController(
//       vsync: this,
//       duration: Duration(seconds: 5),
//     );
//
//     // Create Tween for the line length
//     Tween<double> _tween = Tween<double>(begin: 100.0, end: 0.0);
//
//     // Create Animation using Tween and AnimationController
//     _animation = _tween.animate(_controller);
//
//     // Start the animation
//     _controller.forward();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Line Animation Dialog'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             showDialog(
//               context: context,
//               builder: (BuildContext context) {
//                 return AlertDialog(
//                   content: MyAnimatedLine(animation: _animation),
//                 );
//               },
//             );
//           },
//           child: Text('Show Dialog'),
//         ),
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
// }
//
// class MyAnimatedLine extends StatelessWidget {
//   final Animation<double> animation;
//
//   MyAnimatedLine({required this.animation});
//
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: animation,
//       builder: (context, child) {
//         return Container(
//           height: 2.0, // Fixed height for the line
//           width: animation.value,
//           color: Colors.blue,
//         );
//       },
//     );
//   }
// }
// ```
//
// In this example:
//
// 1. `MyDialog` is a `StatefulWidget` that contains the `AnimationController` and initializes it in the `initState` method.
// 2. The `MyAnimatedLine` widget is responsible for building the line based on the current value of the animation. It uses an `AnimatedBuilder` to rebuild the widget when the animation value changes.
// 3. When the "Show Dialog" button is pressed, it triggers the display of an `AlertDialog` with the animated line.
//
// Feel free to customize the code according to your specific requirements.