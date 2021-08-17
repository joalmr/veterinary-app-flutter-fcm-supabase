import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/config/variables_global.dart';
import 'package:vet_app/design/layout/main_layout.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/resources/utils/calcula_edad.dart';
import 'package:vet_app/resources/utils/datetime_format.dart';

import '../../../domain/logic.dart';
import '../icon_row.dart';

class PetHistoryPage extends StatelessWidget {
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
                    context.width >= 900
                        ? Padding(
                            padding: const EdgeInsets.only(
                              left: 30.0,
                              right: 30.0,
                              top: 25.0,
                              bottom: 10.0,
                            ),
                            child: Text(
                              'Historial',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                              ),
                            ),
                          )
                        : SizedBox(height: 0),
                    SizedBox(
                      width: MediaQuery.of(context).size.width > 900
                          ? 600
                          : double.maxFinite,
                      child: Card(
                        margin:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 12),
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
                                  Text('Peso: ${history.weight!.toString()}'),
                                  history.details == null
                                      ? SizedBox(height: 0)
                                      : ExpansionTile(
                                          title: iconRow(history.details),
                                          childrenPadding: EdgeInsets.all(2),
                                          tilePadding: EdgeInsets.zero,
                                          expandedAlignment: Alignment.topLeft,
                                          children: [
                                            detailRow(history.details,
                                                history.establishmentId),
                                            SizedBox(height: 10),
                                          ],
                                        ),
                                  history.establishmentId != prefUser.vetId
                                      ? SizedBox(height: 0)
                                      : Row(
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
      },
    );
  }
}
