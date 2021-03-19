import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:vet_app/design/styles/styles.dart';

import 'checkFiltro.dart';

class CardRegister extends StatelessWidget {
  const CardRegister({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 30),
        child: FadeIn(
          child: Column(
            children: [
              FadeInLeft(
                from: 50,
                duration: Duration(milliseconds: 400),
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Nombre',
                    ),
                  ),
                ),
              ),
              FadeInLeft(
                from: 50,
                duration: Duration(milliseconds: 400),
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Apellido',
                    ),
                  ),
                ),
              ),
              FadeInLeft(
                from: 50,
                duration: Duration(milliseconds: 400),
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Correo electrónico',
                    ),
                  ),
                ),
              ),
              FadeInLeft(
                from: 50,
                duration: Duration(milliseconds: 400),
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Contraseña',
                    ),
                  ),
                ),
              ),
              FadeInLeft(
                from: 50,
                duration: Duration(milliseconds: 400),
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Repetir contraseña',
                    ),
                  ),
                ),
              ),
              CheckRegister(
                title: 'Acepto los ',
                link: 'Terminos y Condiciones',
                tipo: 'tyc',
              ),
              CheckRegister(
                title: 'Acepto las ',
                link:
                    'Políticas de Privacidad y Protección de Datos Personales',
                tipo: 'pyp',
              ),
              FadeInLeft(
                from: 50,
                duration: Duration(milliseconds: 700),
                child: Container(
                  height: 45,
                  width: double.maxFinite,
                  margin: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    gradient: LinearGradient(
                      colors: [
                        colorGreen,
                        colorMain,
                      ],
                    ),
                  ),
                  child: InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(5),
                    child: SizedBox.expand(
                      child: Center(
                        child: Text(
                          'Registrar',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              FadeInLeft(
                from: 50,
                duration: Duration(milliseconds: 550),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Ya tengo una cuenta',
                      style: TextStyle(color: colorMain),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.0),
            ],
          ),
        ),
      ),
    );
  }
}
