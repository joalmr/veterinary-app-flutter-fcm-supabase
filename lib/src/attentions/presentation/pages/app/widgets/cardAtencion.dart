import 'package:flutter/material.dart';
import 'package:vet_app/design/styles/styles.dart';

class CardAtencion extends StatelessWidget {
  final ImageProvider<Object> image;
  final String petName;
  final String petBreed;
  final String date;
  final String time;
  final String userName;

  const CardAtencion({
    @required this.image,
    @required this.petName,
    @required this.petBreed,
    @required this.date,
    @required this.time,
    @required this.userName,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(10),
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                height: 50.0,
                width: 50.0,
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: Image(
                      fit: BoxFit.cover,
                      image: image,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      petName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      petBreed,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12.0,
                      ),
                    ),
                    Text(
                      userName,
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: colorMain,
                        fontSize: 12.0,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    date,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12.0,
                    ),
                  ),
                  Text(
                    time,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
