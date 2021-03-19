import 'package:flutter/material.dart';
import 'package:vet_app/components/buttons.dart';
import 'package:vet_app/design/styles/styles.dart';

class CardEstablecimiento extends StatelessWidget {
  final ImageProvider<Object> image;

  final String name;
  final String ruc;
  final String email;
  final int aprobado;
  final int tipo;

  const CardEstablecimiento(
      {Key key,
      @required this.image,
      @required this.name,
      @required this.ruc,
      @required this.email,
      @required this.aprobado,
      @required this.tipo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 82.0,
                  width: 82.0,
                  decoration: BoxDecoration(
                    color: tipo == 1 ? colorGreen : colorBlue,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: Image(
                          fit: BoxFit.cover,
                          image: image,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      maxLines: 2,
                    ),
                    SizedBox(height: 5),
                    Text(
                      ruc,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 5),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.email_rounded,
                          size: 14,
                        ),
                        SizedBox(width: 10),
                        Text(
                          email,
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(
                          aprobado == 1
                              ? Icons.check_box_rounded
                              : Icons.indeterminate_check_box_rounded,
                          size: 14,
                        ),
                        SizedBox(width: 10),
                        Text(
                          aprobado == 1 ? 'Aprobado' : 'En espera',
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(
                          Icons.home_work_rounded,
                          size: 14,
                        ),
                        SizedBox(width: 10),
                        Text(
                          tipo == 1 ? 'Veterinaria' : 'Grooming',
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: btnAltern(
                text: 'Eliminar',
                color: colorRed,
                bold: true,
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
