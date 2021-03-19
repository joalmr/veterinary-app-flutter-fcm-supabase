import 'package:flutter/material.dart';
import 'package:vet_app/components/childRegion.dart';
import 'package:vet_app/design/styles/styles.dart';

class VetCard extends StatelessWidget {
  final ImageProvider<Object> image;
  final String name;
  final String ruc;
  final String email;
  final int aprobado;
  final int tipo;

  const VetCard(
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
    return ChildRegion(
      margin: EdgeInsets.all(10),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {},
        child: Container(
          width: 280,
          padding: EdgeInsets.all(20),
          child: Column(
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
                    padding: EdgeInsets.all(5.0),
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
              SizedBox(height: 10),
              Text(
                name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
              SizedBox(height: 5),
              Text(
                ruc,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 10,
                ),
              ),
              SizedBox(height: 5),
              Divider(),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.alternate_email_rounded),
                  SizedBox(width: 10),
                  Text(email),
                ],
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Icon(
                    aprobado == 1
                        ? Icons.check_box_rounded
                        : Icons.indeterminate_check_box_rounded,
                  ),
                  SizedBox(width: 10),
                  Text(aprobado == 1 ? 'Aprobado' : 'En espera'),
                ],
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Icon(Icons.home_work_rounded),
                  SizedBox(width: 10),
                  Text(tipo == 1 ? 'Veterinaria' : 'Grooming'),
                ],
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: InkWell(
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
                      size: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
