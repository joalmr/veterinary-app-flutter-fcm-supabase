import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/resources/utils/datetime_format.dart';
import 'package:vet_app/src/registros/domain/attentions_controller.dart';
import 'package:vet_app/src/registros/presentation/pages/app/atenciones/get_attention.dart';
import 'package:vet_app/src/registros/presentation/pages/app/widgets/card_atencion.dart';

class Registered extends StatefulWidget {
  @override
  _RegisteredState createState() => _RegisteredState();
}

int selected = 1;

class _RegisteredState extends State<Registered> {
  @override
  Widget build(BuildContext context) {
    return GetX<AttentionsController>(
      builder: (_) {
        return SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 30.0, top: 25.0, bottom: 10.0),
                child: Text(
                  'Registro de atenciones',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                child: _.listaReg.isEmpty
                    ? Center(
                        child: Text('No tiene registros'),
                      )
                    : ListView.builder(
                        itemCount: _.listaReg.length,
                        padding: EdgeInsets.only(left: 10, right: 10),
                        itemBuilder: (BuildContext context, int index) {
                          final reg = _.listaReg[index];
                          return CardAtencion(
                            image: CachedNetworkImageProvider(reg
                                .petPicture!), //AssetImage('assets/images/dog.jpg'),
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
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
}
