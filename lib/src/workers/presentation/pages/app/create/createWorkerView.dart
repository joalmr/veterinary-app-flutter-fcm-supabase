import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/components/buttons.dart';
import 'package:vet_app/config/variablesGlobal.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/resources/utils/datetimeFormat.dart';
import 'package:vet_app/src/workers/domain/workersController.dart';
import 'package:easy_rich_text/easy_rich_text.dart';

class CreaWorkerView extends StatelessWidget {
  const CreaWorkerView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final emailText = TextEditingController();
    return GetX<WorkersController>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Invitar administrador'),
          ),
          body: Padding(
            padding: EdgeInsets.only(left: 10, right: 10, top: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                EasyRichText(
                  "Invitar administrador a ${prefUser.vetName}",
                  defaultStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black38,
                  ),
                  patternList: [
                    EasyRichTextPattern(
                      targetString: '${prefUser.vetName}',
                      style: TextStyle(color: colorMain),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                TextFormField(
                  controller: emailText,
                  decoration: InputDecoration(
                      labelText: 'Email del administrador a invitar'),
                ),
                SizedBox(height: 15),
                SizedBox(
                  width: double.infinity,
                  child: btnPrimary(
                    text: 'Enviar invitación',
                    onPressed: () => _.setInvita(emailText.text),
                  ),
                ),
                SizedBox(height: 5),
                Divider(),
                Text("Invitaciones pendientes",style: TextStyle(fontWeight: FontWeight.bold),),
                Expanded(
                  child: ListView.builder(
                    itemCount: _.workersInvitation.length,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    itemBuilder: (BuildContext context, int index) {
                      final workerInvitation = _.workersInvitation[index];
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Fecha de invitación',
                                  style: TextStyle(
                                    fontSize: 10,
                                  ),
                                ),
                                Text(
                                  formatDate(workerInvitation.createdAt),
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(height: 5.0),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Establecimiento',
                                  style: TextStyle(
                                    fontSize: 10,
                                  ),
                                ),
                                Text(
                                  workerInvitation.establishmentName,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(height: 5.0),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Correo electrónico',
                                  style: TextStyle(
                                    fontSize: 10,
                                  ),
                                ),
                                Text(
                                  workerInvitation.email,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            InkWell(
                              onTap: () => _.deleteInvita(workerInvitation.id),
                              borderRadius: BorderRadius.circular(5.0),
                              child: Container(
                                height: 32.0,
                                width: 40.0,
                                decoration: BoxDecoration(
                                  color: colorRed,
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: Icon(
                                  Icons.delete_forever_rounded,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
