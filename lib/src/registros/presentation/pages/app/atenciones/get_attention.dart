import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:vet_app/design/layout/main_layout.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/resources/utils/calcula_edad.dart';
import 'package:vet_app/src/registros/domain/get_attention_controller.dart';

class GetAttention extends StatelessWidget {
  const GetAttention({Key? key}) : super(key: key);

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
                      //
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
                                      color: colorBrown1,
                                    ),
                                    Container(
                                      color: colorBrown2,
                                    ),
                                  ],
                                ),
                              ),
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
