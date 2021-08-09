import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/src/registros/domain/get_attention_controller.dart';

class GetAttention extends StatelessWidget {
  const GetAttention({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GetAttentionsController>(
        init: GetAttentionsController(),
        builder: (_) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Detalle de atención'),
            ),
            body: Column(
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
                            padding: const EdgeInsets.all(2.5),
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image(
                                    image: AssetImage('assets/images/dog.jpg'),
                                    fit: BoxFit.cover,
                                    height: 100,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 2.5, bottom: 10),
                                  child: Text(
                                    'Name',
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
                            padding: const EdgeInsets.only(top: 10, left: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                EasyRichText(
                                  'Tipo: Gato',
                                  defaultStyle: const TextStyle(
                                    color: Colors.black38,
                                    fontSize: 12,
                                  ),
                                  patternList: [
                                    EasyRichTextPattern(
                                      targetString: 'Gato',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                EasyRichText(
                                  'Raza: Gato Mestizo de pelo corto',
                                  defaultStyle: const TextStyle(
                                    color: Colors.black38,
                                    fontSize: 12,
                                  ),
                                  patternList: [
                                    EasyRichTextPattern(
                                      targetString:
                                          'Gato Mestizo de pelo corto',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                EasyRichText(
                                  'Género: Macho',
                                  defaultStyle: const TextStyle(
                                    color: Colors.black38,
                                    fontSize: 12,
                                  ),
                                  patternList: [
                                    EasyRichTextPattern(
                                      targetString: 'Macho',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                EasyRichText(
                                  'Edad: 7 años 4 meses',
                                  defaultStyle: const TextStyle(
                                    color: Colors.black38,
                                    fontSize: 12,
                                  ),
                                  patternList: [
                                    EasyRichTextPattern(
                                      targetString: '7 años 4 meses',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                EasyRichText(
                                  'Peso: 9.88 Kg.',
                                  defaultStyle: const TextStyle(
                                    color: Colors.black38,
                                    fontSize: 12,
                                  ),
                                  patternList: [
                                    EasyRichTextPattern(
                                      targetString: '9.88 Kg.',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                EasyRichText(
                                  'Condición corporal: Sobrepeso',
                                  defaultStyle: const TextStyle(
                                    color: Colors.black38,
                                    fontSize: 12,
                                  ),
                                  patternList: [
                                    EasyRichTextPattern(
                                      targetString: 'Sobrepeso',
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
                          labelStyle: TextStyle(fontWeight: FontWeight.bold),
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
