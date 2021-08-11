import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:vet_app/components/buttons.dart';
import 'package:vet_app/design/layout/main_layout.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/resources/utils/calcula_edad.dart';
import 'package:vet_app/src/registros/domain/get_attention_controller.dart';

import 'get_attention/detail.dart';

class GetAttention extends StatefulWidget {
  const GetAttention({Key? key}) : super(key: key);

  @override
  _GetAttentionState createState() => _GetAttentionState();
}

class _GetAttentionState extends State<GetAttention> {
  String? _directoryPath;

  void _selectFolder() {
    FilePicker.platform.getDirectoryPath().then((value) {
      setState(() => _directoryPath = value);
    });
    print(_directoryPath);
  }

  @override
  Widget build(BuildContext context) {
    return GetX<GetAttentionsController>(
        init: GetAttentionsController(),
        builder: (_) {
          return MainLayout(
            drawerActive: true,
            title: 'Detalle de atención',
            body: _.loadingPage.value
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    children: [
                      Card(
                        child: Container(
                          width: double.maxFinite,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.all(2.5),
                                  child: Column(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image(
                                          image: CachedNetworkImageProvider(_
                                              .petData.value!.result!.picture!),
                                          fit: BoxFit.cover,
                                          height: 100,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          top: 2.5,
                                          bottom: 10,
                                        ),
                                        child: Text(
                                          _.petData.value!.result!.name!,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(top: 10, left: 5),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      EasyRichText(
                                        'Tipo: ${_.petData.value!.result!.specieName}',
                                        defaultStyle: const TextStyle(
                                          color: Colors.black38,
                                          fontSize: 12,
                                        ),
                                        patternList: [
                                          EasyRichTextPattern(
                                            targetString: _.petData.value!
                                                .result!.specieName!,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      EasyRichText(
                                        'Raza: ${_.petData.value!.result!.breedName}',
                                        defaultStyle: const TextStyle(
                                          color: Colors.black38,
                                          fontSize: 12,
                                        ),
                                        patternList: [
                                          EasyRichTextPattern(
                                            targetString: _.petData.value!
                                                .result!.breedName!,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      EasyRichText(
                                        'Género: ${_.petData.value!.result!.genre.toString() == '1' ? 'Macho' : 'Hembra'}',
                                        defaultStyle: const TextStyle(
                                          color: Colors.black38,
                                          fontSize: 12,
                                        ),
                                        patternList: [
                                          EasyRichTextPattern(
                                            targetString: _.petData.value!
                                                        .result!.genre
                                                        .toString() ==
                                                    '1'
                                                ? 'Macho'
                                                : 'Hembra',
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      EasyRichText(
                                        'Edad: ${calculateAge(_.petData.value!.result!.birthdate)!}',
                                        defaultStyle: const TextStyle(
                                          color: Colors.black38,
                                          fontSize: 12,
                                        ),
                                        patternList: [
                                          EasyRichTextPattern(
                                            targetString: calculateAge(_.petData
                                                .value!.result!.birthdate)!,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      EasyRichText(
                                        'Peso: ${_.petData.value!.result!.weight}',
                                        defaultStyle: const TextStyle(
                                          color: Colors.black38,
                                          fontSize: 12,
                                        ),
                                        patternList: [
                                          EasyRichTextPattern(
                                            targetString: _
                                                .petData.value!.result!.weight
                                                .toString(),
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      EasyRichText(
                                        'Condición corporal: ${_.petData.value!.result!.status!}',
                                        defaultStyle: const TextStyle(
                                          color: Colors.black38,
                                          fontSize: 12,
                                        ),
                                        patternList: [
                                          EasyRichTextPattern(
                                            targetString: _
                                                .petData.value!.result!.status
                                                .toString(),
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: DefaultTabController(
                          length: 2,
                          initialIndex: 0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const TabBar(
                                indicatorColor: colorMain,
                                labelColor: colorMain,
                                labelStyle:
                                    TextStyle(fontWeight: FontWeight.bold),
                                unselectedLabelColor: Colors.black54,
                                unselectedLabelStyle:
                                    TextStyle(fontWeight: FontWeight.normal),
                                tabs: [
                                  Tab(text: 'Servicios'),
                                  Tab(text: 'Files'),
                                ],
                              ),
                              Expanded(
                                child: TabBarView(
                                  children: <Widget>[
                                    Container(
                                      child: ListView(
                                        children: [
                                          _.attention.value.result!
                                                      .attentionDetails !=
                                                  null
                                              ? detailAttention(_
                                                  .attention
                                                  .value
                                                  .result!
                                                  .attentionDetails)
                                              : SizedBox(height: 0)
                                        ],
                                      ),
                                    ),
                                    Container(
                                      child: Center(
                                        child: btnSecondary(
                                          text: 'Subir archivo',
                                          onPressed: () {
                                            _selectFolder();
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 80,
                                width: double.maxFinite,
                                color: Colors.grey[300],
                                padding: EdgeInsets.only(right: 20),
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text('Monto'),
                                      Text(
                                        _.attention.value.result!
                                            .attentionAmount!,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
          );
        });
  }
}
