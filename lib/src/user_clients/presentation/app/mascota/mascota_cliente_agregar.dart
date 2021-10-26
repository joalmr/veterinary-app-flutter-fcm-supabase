import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:select_dialog/select_dialog.dart';
import 'package:vet_app/components/buttons.dart';
import 'package:vet_app/components/snackbar.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/resources/utils/datetime_format.dart';
import 'package:vet_app/src/home/presentation/pages/web/dashboard/widgets/tab_select.dart';
import 'package:vet_app/src/user_clients/data/model/breed_model.dart';
import 'package:vet_app/src/user_clients/data/model/request/pet.dart';
import 'package:vet_app/src/user_clients/domain/user_clients_controller.dart';

class MascotaClienteAgregar extends StatefulWidget {
  @override
  _MascotaClienteAgregarState createState() => _MascotaClienteAgregarState();
}

class _MascotaClienteAgregarState extends State<MascotaClienteAgregar> {
  final petNameController = TextEditingController();
  final petBreedController = TextEditingController();
  int _especie = 1;
  int _raza = 0;
  int _sexo = 0;
  DateTime? _fecha;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ClientsController>(
      builder: (_) {
        return Scaffold(
            appBar: AppBar(
              title: Text('Agregar mascota'),
            ),
            body: Center(
              child: Container(
                width: context.width < 900 ? double.maxFinite : 800,
                child: ListView(
                  padding: EdgeInsets.all(8),
                  children: [
                    Text('Tipo mascota'),
                    Container(
                      margin: EdgeInsets.only(left: 0.0, top: 5, bottom: 5),
                      child: Row(
                        children: [
                          InkWell(
                            borderRadius: BorderRadius.circular(20.0),
                            onTap: () {
                              setState(() {
                                _especie = 2;
                                _raza = 0;
                                petBreedController.text = '';
                                _.getBreeds(_especie);
                              });
                            },
                            child: tabSelect(
                              selected: _especie == 2,
                              text: 'Perro',
                            ),
                          ),
                          InkWell(
                            borderRadius: BorderRadius.circular(20.0),
                            onTap: () {
                              setState(() {
                                _especie = 1;
                                _raza = 0;
                                petBreedController.text = '';
                                _.getBreeds(_especie);
                              });
                            },
                            child: tabSelect(
                              selected: _especie == 1,
                              text: 'Gato',
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Text('Raza'),
                    TextFormField(
                      controller: petBreedController,
                      enableInteractiveSelection: false,
                      autofocus: false,
                      readOnly: true,
                      decoration: InputDecoration(
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child:
                              Icon(Icons.keyboard_arrow_down, color: colorMain),
                        ),
                      ),
                      onTap: () {
                        SelectDialog.showModal<Breed>(
                          context,
                          label: 'Razas',
                          titleStyle: Get.textTheme.subtitle1,
                          showSearchBox: true,
                          emptyBuilder: (context) =>
                              Center(child: Text('No se encontró')),
                          errorBuilder: (context, exception) =>
                              Center(child: Text('Oops!')),
                          items: _.razas,
                          selectedValue: _.razaSeleccionada,
                          searchBoxDecoration: InputDecoration(
                              hintText: 'Buscar raza',
                              prefixIcon: Icon(Icons.search, color: colorMain)),
                          onFind: (String filter) => _.getDataRaza(filter),
                          // items: List.generate(
                          //     _.razas.length, (index) => _.razas[index]),
                          itemBuilder: (BuildContext context, Breed item,
                              bool isSelected) {
                            return Container(
                              decoration: !isSelected
                                  ? null
                                  : BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: colorMain),
                              child: ListTile(
                                selected: isSelected,
                                title: Text(
                                  item.name!,
                                  style: isSelected
                                      ? Get.textTheme.subtitle2!
                                          .copyWith(color: Colors.white)
                                      : Get.textTheme.subtitle2,
                                ),
                              ),
                            );
                          },
                          // onChange: (selected) {},
                          onChange: (selected) {
                            setState(() {
                              _raza = selected.id!;
                            });
                            petBreedController.text = selected.name!;
                          },
                        );
                      },
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: petNameController,
                      textCapitalization: TextCapitalization.words,
                      decoration: InputDecoration(labelText: 'Nombre'),
                    ),
                    SizedBox(height: 10),
                    DateTimePicker(
                        dateMask: 'dd-MM-yyyy',
                        firstDate: DateTime(DateTime.now().year - 45),
                        lastDate: DateTime.now(),
                        dateLabelText: 'Fecha de nacimiento',
                        onChanged: (val) {
                          setState(() {
                            _fecha = toDateBasic(val);
                          });
                        }),
                    SizedBox(height: 10),
                    Text('Sexo'),
                    Container(
                      margin: EdgeInsets.only(left: 0.0, top: 5, bottom: 15),
                      child: Row(
                        children: [
                          InkWell(
                            borderRadius: BorderRadius.circular(20.0),
                            onTap: () {
                              setState(() => _sexo = 1);
                            },
                            child: tabSelect(
                              selected: _sexo == 1,
                              text: 'Macho',
                            ),
                          ),
                          InkWell(
                            borderRadius: BorderRadius.circular(20.0),
                            onTap: () {
                              setState(() => _sexo = 0);
                            },
                            child: tabSelect(
                              selected: _sexo == 0,
                              text: 'Hembra',
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    btnPrimary(
                      text: 'Crear mascota',
                      onPressed: () {
                        if (petNameController.text.isEmpty || _raza == 0) {
                          snackBarMessage(
                            type: TypeSnackBarName.ERROR,
                            message: 'Complete los datos',
                            seconds: 7,
                          );
                        } else {
                          final addpet = PetModelReq(
                            name: petNameController.text,
                            birthdate: _fecha,
                            genre: _sexo,
                            specie: _especie,
                            breed: _raza,
                            userId: _.userId.value,
                          );
                          _.addPet(addpet);
                        }
                      },
                    ),
                  ],
                ),
              ),
            ));
      },
    );
  }
}
