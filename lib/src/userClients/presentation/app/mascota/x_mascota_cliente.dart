// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import 'atender_mascota.dart';

// class MascotaCliente extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Get.to(AtenderMascota());
//         },
//         child: Image(
//           height: 30,
//           fit: BoxFit.cover,
//           image: AssetImage('assets/images/vote.png'),
//         ),
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SizedBox(
//             width: double.maxFinite,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 CircleAvatar(
//                   radius: 45,
//                   backgroundImage: AssetImage('assets/images/dog.jpg'),
//                 ),
//                 Text(
//                   'Pipo2',
//                   style: TextStyle(
//                     fontSize: 36,
//                     fontWeight: FontWeight.w200,
//                   ),
//                 ),
//                 Text(
//                   'Mestizo',
//                   style: TextStyle(
//                     fontSize: 22,
//                     fontWeight: FontWeight.w200,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.all(8.0),
//             child: Text(
//               'Historial',
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.w200),
//             ),
//           ),
//           for (var i = 0; i < 4; i++)
//             Container(
//               width: double.maxFinite,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(16),
//                 boxShadow: <BoxShadow>[
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.5),
//                     offset: Offset(1.1, 1.1),
//                     blurRadius: 5.5,
//                   ),
//                 ],
//               ),
//               margin: EdgeInsets.all(4),
//               padding: EdgeInsets.all(10),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text('Fecha ####'),
//                   Text('Serv ####'),
//                 ],
//               ),
//             )
//         ],
//       ),
//     );
//   }
// }
