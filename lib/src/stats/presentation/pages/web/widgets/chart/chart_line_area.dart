// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:vet_app/design/styles/styles.dart';

// class ChartLineArea extends StatelessWidget {
//   // final List<double> data;

//   // const ChartLineArea({Key key, this.data}) : super(key: key);

//   final List<double> data = [55.0, 90.0, 50.0, 40.0, 35.0, 55.0, 70.0, 100.0];
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.only(top: 20),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(5),
//       ),
//       child: ClipPath(
//         clipper: ChartClipper(
//           data: data,
//           maxValue: data.reduce(max),
//         ),
//         child: Container(
//           decoration: BoxDecoration(
//             borderRadius:
//                 const BorderRadius.vertical(bottom: Radius.circular(5)),
//             gradient: LinearGradient(
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//               colors: [
//                 colorMain[400]!,
//                 colorMain,
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class ChartClipper extends CustomClipper<Path> {
//   final double maxValue;
//   final List<double> data;

//   ChartClipper({required this.maxValue, required this.data});

//   @override
//   Path getClip(Size size) {
//     final double sectionWidth = size.width / (data.length - 1);

//     final Path path = Path();
//     // path.lineTo(0, size.height);
//     // path.relativeMoveTo(0, size.height);
//     path.moveTo(0, size.height);

//     for (var i = 0; i < data.length; i++) {
//       path.lineTo(
//           i * sectionWidth, size.height - size.height * (data[i] / maxValue));
//     }

//     path.lineTo(size.width, size.height);

//     return path;
//   }

//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
// }
