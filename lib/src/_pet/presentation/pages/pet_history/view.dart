import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/design/layout/main_layout.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/resources/utils/calcula_edad.dart';
import 'package:vet_app/resources/utils/datetime_format.dart';

import '../../../domain/logic.dart';
import '../icon_row.dart';

class PetHistoryPage extends StatelessWidget {
  // final PetHistoryLogic logic = Get.put(PetHistoryLogic());

  @override
  Widget build(BuildContext context) {
    return GetX<PetHistoryLogic>(
      init: PetHistoryLogic(),
      builder: (_) {
        return MainLayout(
          title: 'Historial',
          body: _.loadingPage.value
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MediaQuery.of(context).size.width > 900
                        ? IconButton(
                            onPressed: () => Get.back(),
                            icon: Icon(Icons.arrow_back),
                          )
                        : SizedBox(height: 0),
                    Card(
                      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image(
                              height: 80,
                              width: 80,
                              image: CachedNetworkImageProvider(
                                  _.petData.value.result!.picture!),
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 5),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 5),
                                Row(
                                  children: [
                                    Text(
                                      _.petData.value.result!.name!,
                                      style: Get.textTheme.subtitle1!
                                          .apply(fontWeightDelta: 2),
                                    ),
                                    SizedBox(width: 5),
                                    Icon(
                                      Icons.pets_rounded,
                                      size: 18,
                                      color: colorMain,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5),
                                Text(
                                    'Edad: ${calculateAge(_.petData.value.result!.birthdate)}'),
                                Text(
                                    'Tipo: ${_.petData.value.result!.specieName!}'),
                                Text(
                                    'Raza: ${_.petData.value.result!.breedName!}'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: _.petHistory.value.result!.length,
                        itemBuilder: (context, index) {
                          final history = _.petHistory.value.result![index];
                          return Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            margin: EdgeInsets.all(4),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      'Fecha: ${formatDateTime(history.attentionDate!).split(' ')[0]}'),
                                  Text(
                                      'Hora: ${formatDateTime(history.attentionDate!).split(' ')[1]}'),
                                  Text(
                                      'Condición corporal: ${history.bodyCondition!}'),
                                  // Text(history.establishment!),
                                  // Text(history.establishmentLogo!),
                                  Text('Peso: ${history.weight!.toString()}'),
                                  ExpansionTile(
                                    title: iconRow(history.details),
                                    //petHistory.value.result!.first.details
                                    childrenPadding: EdgeInsets.all(2),
                                    tilePadding: EdgeInsets.zero,
                                    expandedAlignment: Alignment.topLeft,
                                    children: [
                                      detailRow(history.details),
                                      SizedBox(height: 10),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Total',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(history.amount!.toString()),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
        );
        // return Scaffold(
        //   appBar: AppBar(
        //     title: Text('Historial'),
        //   ),
        //   body: _.loadingPage.value
        //       ? Center(
        //           child: CircularProgressIndicator(),
        //         )
        //       : Column(
        //           children: [
        //             Card(
        //               margin: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        //               child: Row(
        //                 crossAxisAlignment: CrossAxisAlignment.start,
        //                 children: [
        //                   ClipRRect(
        //                     borderRadius: BorderRadius.circular(10.0),
        //                     child: Image(
        //                       height: 80,
        //                       width: 80,
        //                       image: CachedNetworkImageProvider(
        //                           _.petData.value.result!.picture!),
        //                       fit: BoxFit.cover,
        //                     ),
        //                   ),
        //                   SizedBox(width: 5),
        //                   Expanded(
        //                     child: Column(
        //                       crossAxisAlignment: CrossAxisAlignment.start,
        //                       children: [
        //                         SizedBox(height: 5),
        //                         Row(
        //                           children: [
        //                             Text(
        //                               _.petData.value.result!.name!,
        //                               style: Get.textTheme.subtitle1!
        //                                   .apply(fontWeightDelta: 2),
        //                             ),
        //                             SizedBox(width: 5),
        //                             Icon(
        //                               Icons.pets_rounded,
        //                               size: 18,
        //                               color: colorMain,
        //                             ),
        //                           ],
        //                         ),
        //                         SizedBox(height: 5),
        //                         Text(
        //                             'Edad: ${calculateAge(_.petData.value.result!.birthdate)}'),
        //                         Text(
        //                             'Tipo: ${_.petData.value.result!.specieName!}'),
        //                         Text(
        //                             'Raza: ${_.petData.value.result!.breedName!}'),
        //                       ],
        //                     ),
        //                   ),
        //                 ],
        //               ),
        //             ),
        //             Expanded(
        //               child: ListView.builder(
        //                 itemCount: _.petHistory.value.result!.length,
        //                 itemBuilder: (context, index) {
        //                   final history = _.petHistory.value.result![index];
        //                   return Card(
        //                     shape: RoundedRectangleBorder(
        //                       borderRadius: BorderRadius.circular(16.0),
        //                     ),
        //                     margin: EdgeInsets.all(4),
        //                     child: Padding(
        //                       padding: const EdgeInsets.symmetric(
        //                           horizontal: 8.0, vertical: 12.0),
        //                       child: Column(
        //                         crossAxisAlignment: CrossAxisAlignment.start,
        //                         children: [
        //                           Row(
        //                             mainAxisAlignment:
        //                                 MainAxisAlignment.spaceBetween,
        //                             children: [
        //                               Text(
        //                                 'Total',
        //                                 style: TextStyle(
        //                                     fontWeight: FontWeight.bold),
        //                               ),
        //                               Text(history.amount!.toString()),
        //                             ],
        //                           ),
        //                         ],
        //                       ),
        //                     ),
        //                   );
        //                 },
        //               ),
        //             ),
        //           ],
        //         ),
        // );
      },
    );
  }
}
