import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/resources/utils/datetime_format.dart';
import 'package:vet_app/src/registros/domain/attentions_controller.dart';
import 'package:vet_app/src/registros/presentation/pages/app/widgets/card_atencion.dart';

import 'get_attentions.dart';

class AtencionesView extends StatelessWidget {
  const AtencionesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<AttentionsController>(
      builder: (_) {
        return ListView.builder(
          itemCount: _.listaReg.length,
          padding: const EdgeInsets.only(left: 10, right: 10),
          itemBuilder: (BuildContext context, int index) {
            final reg = _.listaReg[index];
            return CardAtencion(
              image: CachedNetworkImageProvider(
                  reg.petPicture!), //AssetImage('assets/images/dog.jpg'),
              petName: reg.petName!,
              petBreed: reg.petBreed!,
              date: formatDate(reg.attentionDate!),
              time: formatTime(reg.attentionDate!),
              userName: reg.userName!,
              onTap: () {
                Get.to(GetAttention());
              },
            );
          },
        );
      },
    );
  }
}
