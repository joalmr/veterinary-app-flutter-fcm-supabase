import 'package:flutter/material.dart';
import 'package:vet_app/components/childRegion.dart';
import 'package:vet_app/design/styles/styles.dart';

class VerOfertas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: 30.0, top: 25.0, bottom: 10.0),
          child: Text(
            'Promociones',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 5,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            itemBuilder: (BuildContext context, int index) {
              return ChildRegion(
                margin: EdgeInsets.all(10),
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  padding: EdgeInsets.all(5),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Desparasitación',
                              style: TextStyle(fontSize: 12),
                            ),
                            Text.rich(
                              TextSpan(
                                text: 'Creado: ',
                                style: TextStyle(fontSize: 10),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: '15-02-2021',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 8,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        flex: 3,
                        child: Text(
                          'Acá va la descripción..',
                          maxLines: 10,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          'Porcentaje',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          '50',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(width: 10),
                      InkWell(
                        onTap: () {},
                        borderRadius: BorderRadius.circular(5.0),
                        child: Container(
                          height: 38.0,
                          width: 38.0,
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
    );
  }
}
