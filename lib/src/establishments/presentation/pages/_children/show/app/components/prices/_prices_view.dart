import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/src/establishments/data/model/establishmet.dart';

import '../../widgets/price_show.dart';
import 'edit_prices_view.dart';

class PricesView extends StatelessWidget {
  final Prices prices;
  const PricesView({Key? key, required this.prices}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(
              left: 10.0,
              bottom: 5.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Precios',
                  style: Get.textTheme.subtitle2!.apply(fontWeightDelta: 2),
                ),
                IconButton(
                  splashRadius: 20,
                  iconSize: 18,
                  icon: const Icon(
                    Icons.edit,
                  ),
                  onPressed: () {
                    Get.to(EditPricesView());
                  },
                ),
              ],
            ),
          ),
          Wrap(
            children: [
              precio(
                'Consulta',
                double.parse(prices.consultation!.from!).toStringAsFixed(2),
              ),
              precio(
                'Grooming',
                // prices.grooming.from.toString(),
                double.parse(prices.grooming!.from!).toStringAsFixed(2),
              ),
              precio(
                'Desparasitación',
                // prices.deworming.from.toString(),
                double.parse(prices.deworming!.from!).toStringAsFixed(2),
              ),
              precio(
                'Vacunas',
                // prices.vaccination.from.toString(),
                double.parse(prices.vaccination!.from!).toStringAsFixed(2),
              ),
            ],
          )
        ],
      ),
    );
  }
}
