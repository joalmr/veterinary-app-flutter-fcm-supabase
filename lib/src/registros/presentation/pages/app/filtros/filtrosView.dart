import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/components/buttons.dart';
import 'package:vet_app/resources/utils/datetimeFormat.dart';
import 'package:vet_app/src/registros/domain/attentionsController.dart';
import 'package:vet_app/src/registros/presentation/widgets/checkFiltro.dart';

class FiltroAtenciones extends StatefulWidget {
  @override
  _FiltroAtencionesState createState() => _FiltroAtencionesState();
}

class _FiltroAtencionesState extends State<FiltroAtenciones> {
  // double _currentSliderValue = 500;

  @override
  Widget build(BuildContext context) {
    return GetX<AttentionsController>(
      builder: (_){
        return Scaffold(
          appBar: AppBar(
            title: Text('Filtro de atenciones'),
          ),
          body: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.only(left: 20, right: 10),
                    children: [
                      SizedBox(height: 5),
                      DateTimePicker(
                        dateMask: 'dd-MM-yyyy',
                        initialDate: toDateBasic(_.from.value),
                        initialValue: _.from.value,
                        firstDate: DateTime(2020),
                        lastDate: DateTime.now(),
                        dateLabelText: 'Fecha desde',
                        onChanged: (val) => _.from.value = val,
                      ),
                      SizedBox(height: 10),
                      DateTimePicker(
                        dateMask: 'dd-MM-yyyy',
                        initialDate: toDateBasic(_.to.value),
                        initialValue: _.to.value,
                        firstDate: DateTime(2020),
                        lastDate: DateTime.now(),
                        dateLabelText: 'Fecha hasta',
                        onChanged: (val) => _.to.value = val,
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Nombre de usuario'),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Nombre de mascota'),
                      ),
                      SizedBox(height: 10),
                      Text('Especies'),
                      CheckFiltro(title: 'Perros'),
                      CheckFiltro(title: 'Gatos'),
                      SizedBox(height: 10),
                      Text('Servicios'),
                      SizedBox(height: 5),
                      CheckFiltro(title: 'Consulta'),
                      CheckFiltro(title: 'Cirugía'),
                      CheckFiltro(title: 'Grooming'),
                      CheckFiltro(title: 'Desparasitación'),
                      CheckFiltro(title: 'Vacuna'),
                      CheckFiltro(title: 'Examen'),
                      CheckFiltro(title: 'Otros servicios'),
                      SizedBox(height: 5),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 10,
                    right: 10,
                    top: 10,
                    bottom: 15,
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    child: btnPrimary(
                      text: 'Buscar',
                      onPressed: () {
                        _.getAll();
                        Get.back();
                      },
                    ),
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
