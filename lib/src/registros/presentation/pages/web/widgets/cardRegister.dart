import 'package:flutter/material.dart';
import 'package:vet_app/components/buttons.dart';
import 'package:vet_app/components/cardContainer.dart';

Widget cardRegister({
  required String date,
  required List<Icon> icons,
  required petImage,
  required String petName,
  required String petYo,
  required String petBreed,
  required String petSpecie,
  required String petLover,
  required String amount,
  required void Function()? onPressed,
}) {
  return cardContainer(
    child: Container(
      padding: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 5,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Text(
                  date,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                Wrap(
                  children: icons,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Card(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image(
                      height: 50,
                      width: 50,
                      fit: BoxFit.cover,
                      image: petImage,
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      petName,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(petYo),
                    Text(
                      petBreed,
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      petSpecie,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.person,
                  size: 16,
                ),
                SizedBox(width: 5),
                Text(petLover),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Text('S/ $amount'),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: btnPrimary(
                text: 'Ver',
                onPressed: onPressed,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
