import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:vet_app/design/styles/styles.dart';

import 'check_register.dart';

class CardRegister extends StatelessWidget {
  const CardRegister({Key? key}) : super(key: key);

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
                duration: const Duration(milliseconds: 400),
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Nombre',
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              FadeInLeft(
                from: 50,
                duration: const Duration(milliseconds: 400),
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Apellido',
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              FadeInLeft(
                from: 50,
                duration: const Duration(milliseconds: 400),
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Correo electrónico',
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              FadeInLeft(
                from: 50,
                duration: const Duration(milliseconds: 400),
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Contraseña',
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              FadeInLeft(
                from: 50,
                duration: const Duration(milliseconds: 400),
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Repetir contraseña',
                    ),
                  ),
                ),
              ),
              const CheckRegister(
                title: 'Acepto los ',
                link: 'Terminos y Condiciones',
                tipo: 'tyc',
              ),
              const CheckRegister(
                title: 'Acepto las ',
                link:
                    'Políticas de Privacidad y Protección de Datos Personales',
                tipo: 'pyp',
              ),
              FadeInLeft(
                from: 50,
                duration: const Duration(milliseconds: 700),
                child: Container(
                  height: 45,
                  width: double.maxFinite,
                  margin: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    gradient: const LinearGradient(
                      colors: [
                        colorGreen,
                        colorMain,
                      ],
                    ),
                  ),
                  child: InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(5),
                    child: const SizedBox.expand(
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
                duration: const Duration(milliseconds: 550),
                child: const Align(
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
              const SizedBox(height: 10.0),
            ],
          ),
        ),
      ),
    );
  }
}
