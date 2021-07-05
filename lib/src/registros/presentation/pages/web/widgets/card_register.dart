import 'package:flutter/material.dart';
import 'package:vet_app/components/buttons.dart';
import 'package:vet_app/components/card_container.dart';

Widget cardRegister({
  required String date,
  required List<Icon> icons,
  required ImageProvider<Object> petImage,
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
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 5,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Text(
                  date,
                  style: const TextStyle(
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      petName,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(petYo),
                    Text(
                      petBreed,
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      petSpecie,
                      style: const TextStyle(
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.person,
                  size: 16,
                ),
                const SizedBox(width: 5),
                Text(petLover),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: Text('S/ $amount'),
            ),
          ),
          Expanded(
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
