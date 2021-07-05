import 'package:flutter/material.dart';
import 'package:vet_app/design/styles/styles.dart';

Widget contStatClient({
  required BuildContext context,
  required double valor,
  required String titulo,
}) {
  return Container(
    height: 120,
    width: MediaQuery.of(context).size.width / 1.5,
    decoration: BoxDecoration(
      color: colorMain,
      borderRadius: BorderRadius.all(
        Radius.circular(16.0),
      ),
      boxShadow: <BoxShadow>[
        BoxShadow(
          color: colorMain.withOpacity(0.5),
          offset: const Offset(1.1, 1.1),
          blurRadius: 10.0,
        ),
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          valor > 999999.99
              ? '${(valor / 1000000).toStringAsFixed(2)}M'
              : valor > 9999.99
                  ? '${(valor / 1000).toStringAsFixed(2)}k'
                  : valor.toStringAsFixed(0),
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w200,
            letterSpacing: 0.0,
            color: Colors.white,
          ),
        ),
        Text(
          titulo,
          textAlign: TextAlign.left,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            // fontSize: 16.5,
            letterSpacing: 0.0,
            color: Colors.white,
          ),
        )
      ],
    ),
  );
}
