import 'package:flutter/material.dart';
import 'package:vet_app/design/styles/styles.dart';

class ShowWorkerView extends StatelessWidget {
  const ShowWorkerView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 4,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Nombre',
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                  Text(
                    'Juan Perez',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 5.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Correo electrónico',
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                  Text(
                    'juan@mail.com',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 5.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Establecimiento',
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                  Text(
                    'Vet Patita',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 5.0),
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
        );
      },
    );
  }
}
