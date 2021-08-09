import 'package:flutter/material.dart';
import 'package:vet_app/design/styles/styles.dart';

class CardAtencion extends StatelessWidget {
  final ImageProvider<Object> image;
  final String petName;
  final String petBreed;
  final String date;
  final String time;
  final String userName;
  final Function() onTap;

  const CardAtencion({
    required this.image,
    required this.petName,
    required this.petBreed,
    required this.date,
    required this.time,
    required this.userName,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              SizedBox(
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
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      petName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      petBreed,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12.0,
                      ),
                    ),
                    Text(
                      userName,
                      style: const TextStyle(
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
                children: [
                  Text(
                    date,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12.0,
                    ),
                  ),
                  Text(
                    time,
                    style: const TextStyle(
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
