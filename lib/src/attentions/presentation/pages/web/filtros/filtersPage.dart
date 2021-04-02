import 'package:flutter/material.dart';
import 'package:vet_app/components/buttons.dart';
import 'package:vet_app/components/subheader.dart';
import 'package:vet_app/components/forms/dateForm.dart';
import 'package:vet_app/src/attentions/presentation/widgets/checkFiltro.dart';

class MiniStatAttention extends StatefulWidget {
  @override
  _MiniStatAttentionState createState() => _MiniStatAttentionState();
}

class _MiniStatAttentionState extends State<MiniStatAttention> {
  double _currentSliderValue = 500;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffF7F7FF),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30.0),
          subHeader(title: 'Filtros'),
          SizedBox(height: 10.0),
          Expanded(
            child: ListView(
              padding: EdgeInsets.only(left: 20, right: 10),
              children: [
                Text('Fecha desde'),
                dateForm(),
                SizedBox(height: 10),
                Text('Fecha hasta'),
                dateForm(),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Precio hasta'),
                    Text('$_currentSliderValue'),
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    trackShape: RoundedRectSliderTrackShape(),
                    trackHeight: 4.0,
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 8.0),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 12.0),
                    tickMarkShape: RoundSliderTickMarkShape(),
                    valueIndicatorShape: PaddleSliderValueIndicatorShape(),
                    valueIndicatorTextStyle: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  child: Slider(
                    value: _currentSliderValue,
                    min: 0,
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
                SizedBox(height: 10),
                Text('Nombre de usuario'),
                TextFormField(),
                SizedBox(height: 10),
                Text('Nombre de mascota'),
                TextFormField(),
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
            padding: EdgeInsets.all(10.0),
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
