import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/components/buttons.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/src/workers/domain/workersController.dart';

class ShowWorkerView extends StatelessWidget {
  const ShowWorkerView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<WorkersController>(
      builder: (_) {
        return
        _.carga.value
              ? Center(child: CircularProgressIndicator())
              : _.workers.length == 0
                ? Center(
                    child: Text('No tiene administradores'),
                  )
                : 
         ListView.builder(
          itemCount: _.workers.length,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          itemBuilder: (BuildContext context, int index) {
            final worker = _.workers[index];
            return Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                        'Nombre',
                        style: TextStyle(
                          fontSize: 10,
                        ),
                      ),
                      Text(
                        worker.name,
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
                        worker.email,
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
                        worker.establishment,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 5.0),
                  InkWell(
                    onTap: (){
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Eliminar'),
                          content: Text(
                              'Seguro que desea eliminar al administrador?'),
                          actions: <Widget>[
                            btnAltern(
                              text: 'Sí, eliminar',
                              bold: true,
                              color: colorRed,
                              onPressed: () {
                                _.deleteWorker(worker.id);
                                Get.back();
                              },
                            ),
                            btnAltern(
                              text: 'Cancelar',
                              bold: true,
                              onPressed: () => Get.back(),
                            ),
                          ],
                        ),
                      );
                    },
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
        );
      },
    );
  }
}
