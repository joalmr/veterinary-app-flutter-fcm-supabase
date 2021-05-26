import 'package:flutter/material.dart';
import 'package:vet_app/components/buttons.dart';

class CirugiaView extends StatefulWidget {
  @override
  _CirugiaViewState createState() => _CirugiaViewState();
}

class _CirugiaViewState extends State<CirugiaView> {
  bool anamnesis = false;
  bool recomendaciones = false;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cirugía'),),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 8),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Anamnesis', style: TextStyle(fontWeight: FontWeight.bold),),
                    IconButton(icon: Icon(
                      ! anamnesis 
                      ? Icons.add_circle_rounded
                      : Icons.remove_circle_rounded
                    ), onPressed: (){
                      setState(() {
                        anamnesis = !anamnesis;
                      });
                    }),
                  ],
                ),
                anamnesis 
                ? TextFormField(
                  maxLines: 5,
                )
                : SizedBox(height: 0),
                // SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Recomendaciones', style: TextStyle(fontWeight: FontWeight.bold),),
                    IconButton(icon: Icon(
                      ! recomendaciones 
                      ? Icons.add_circle_rounded
                      : Icons.remove_circle_rounded), onPressed: (){
                      setState(() {
                        recomendaciones = !recomendaciones;
                      });
                    }),
                  ],
                ),
                recomendaciones 
                ? TextFormField(
                  maxLines: 5,
                )
                : SizedBox(height: 0),
                
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10, left: 10, right: 10,  bottom: 5),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Monto cirugía',
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  width: double.maxFinite,
                  child: btnPrimary(text: 'Guardar', onPressed: (){})
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}