// import 'package:flutter/material.dart';
// import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
// import 'package:print/practice/pdf_viewer.dart';
//
// class ShowPDF extends StatefulWidget {
//   @override
//   _ShowPDFState createState() => _ShowPDFState();
// }
//
// class _ShowPDFState extends State<ShowPDF> {
//   PDFDocument document;
//   bool spinner = true;
//
//   void viewPDF() async{
//     setState(() {
//       spinner = true;
//     });
//     document = await PDFDocument.fromURL(
//         'http://conorlastowka.com/book/CitationNeededBook-Sample.pdf');
//     setState(() {
//       spinner = false;
//     });
//   }
//
//   //---------------------------------------
//   @override
//   void initState() {
//     viewPDF();
//     super.initState();
//   }
//
//   //---------------------------------------
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('show pdf file'),
//         centerTitle: true,
//       ),
//       body: (spinner)
//           ? Center(
//               child: CircularProgressIndicator(),
//             )
//           : PDFViewer(
//               document: document,
//             ),
//     );
//   }
// }
