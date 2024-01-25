// import 'dart:io';
//
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
//
// class FileSaver {
//   Future<void> saveFile() async {
//     // Use file_picker to let the user select a save directory.
//     var directory = await FilePicker.platform.getDirectoryPath();
//
//     if (directory != null) {
//       // Ask the user for a filename.
//       String? fileName = await showDialog<String>(
//         context: context,
//         builder: (BuildContext context) {
//           TextEditingController fileNameController = TextEditingController();
//           return AlertDialog(
//             title: Text('Enter filename'),
//             content: TextField(
//               controller: fileNameController,
//               decoration: InputDecoration(labelText: 'Filename'),
//             ),
//             actions: <Widget>[
//               TextButton(
//                 child: Text('Cancel'),
//                 onPressed: () => Navigator.of(context).pop(),
//               ),
//               TextButton(
//                 child: Text('Save'),
//                 onPressed: () => Navigator.of(context).pop(fileNameController.text),
//               ),
//             ],
//           );
//         },
//       );
//
//       if (fileName != null && fileName.isNotEmpty) {
//         File newFile = File('${directory}/$fileName.txt'); // Example with .txt extension
//         await newFile.writeAsString('Your content goes here');
//       }
//     }
//   }
// }
