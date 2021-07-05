import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:vet_app/components/buttons.dart';
import 'package:vet_app/components/subheader.dart';

class MiniStatAttention extends StatefulWidget {
  @override
  _MiniStatAttentionState createState() => _MiniStatAttentionState();
}

class _MiniStatAttentionState extends State<MiniStatAttention> {
  double _currentSliderValue = 500;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffF7F7FF),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 30.0),
          subHeader(title: 'Filtros'),
          const SizedBox(height: 10.0),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.only(left: 20, right: 10),
              children: [
                // Text('Fecha desde'),
                // dateForm(),
                DateTimePicker(
                  dateMask: 'dd-MM-yyyy',
                  firstDate: DateTime(2020),
                  lastDate: DateTime.now(),
                  dateLabelText: 'Fecha desde',
                  // onChanged: (val) => _.to.value = val,
                ),

                const SizedBox(height: 10),
                const Text('Fecha hasta'),
                // dateForm(),
                DateTimePicker(
                  dateMask: 'dd-MM-yyyy',
                  firstDate: DateTime(2020),
                  lastDate: DateTime.now(),
                  dateLabelText: 'Fecha hasta',
                  // onChanged: (val) => _.to.value = val,
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Precio hasta'),
                    Text('$_currentSliderValue'),
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    trackShape: const RoundedRectSliderTrackShape(),
                    trackHeight: 4.0,
                    thumbShape:
                        const RoundSliderThumbShape(enabledThumbRadius: 8.0),
                    overlayShape:
                        const RoundSliderOverlayShape(overlayRadius: 12.0),
                    tickMarkShape: const RoundSliderTickMarkShape(),
                    valueIndicatorShape:
                        const PaddleSliderValueIndicatorShape(),
                    valueIndicatorTextStyle: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  child: Slider(
                    value: _currentSliderValue,
                    max: 500,
                    divisions: 50,
                    label: _currentSliderValue.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        _currentSliderValue = value;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  decoration:
                      const InputDecoration(labelText: 'Nombre de usuario'),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  decoration:
                      const InputDecoration(labelText: 'Nombre de mascota'),
                ),
                const SizedBox(height: 15),
                const Text('Especies'),
                // TODO: agregar onTapFn y checkBool
                // CheckFiltro(title: 'Perros'),
                // CheckFiltro(title: 'Gatos'),
                // SizedBox(height: 10),
                // Text('Servicios'),
                // SizedBox(height: 5),
                // CheckFiltro(title: 'Consulta'),
                // CheckFiltro(title: 'Cirugía'),
                // CheckFiltro(title: 'Grooming'),
                // CheckFiltro(title: 'Desparasitación'),
                // CheckFiltro(title: 'Vacuna'),
                // CheckFiltro(title: 'Examen'),
                // CheckFiltro(title: 'Otros servicios'),
                const SizedBox(height: 5),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              width: double.infinity,
              child: btnPrimary(
                text: 'Buscar',
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
