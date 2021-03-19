import 'package:flutter/material.dart';
import 'package:vet_app/components/buttons.dart';
import 'package:vet_app/components/childRegion.dart';
import 'package:vet_app/components/subheader.dart';
import 'package:vet_app/design/styles/styles.dart';

class CreaAdmin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffF7F7FF),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30.0),
          subHeader(title: 'Invitar a nuevo administrador'),
          SizedBox(height: 10.0),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Email'),
                TextFormField(),
                SizedBox(height: 10.0),
                SizedBox(
                  width: double.infinity,
                  child: btnPrimary(
                    text: 'Enviar invitación',
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 5),
          Expanded(
            child: ListView.builder(
              itemCount: 2,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              itemBuilder: (BuildContext context, int index) {
                return ChildRegion(
                  margin: EdgeInsets.all(10),
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 1),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Fecha de invitación',
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                        Text('20-02-2021'),
                        SizedBox(height: 2.5),
                        Text(
                          'Establecimiento',
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                        Text(
                          'Vet Patita',
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 2.5),
                        Text(
                          'Correo electrónico',
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                        Text('juan@mail.com'),
                        SizedBox(height: 10),
                        InkWell(
                          onTap: () {},
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
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
