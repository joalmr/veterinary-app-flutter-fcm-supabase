import 'package:flutter/material.dart';
import 'package:vet_app/components/buttons.dart';
import 'package:vet_app/components/forms/dateForm.dart';

class FilterStat extends StatelessWidget {
  const FilterStat({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 30, right: 30, bottom: 40),
      padding: EdgeInsets.all(20),
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Filtros',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Container(
                  width: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Fecha desde',
                        style: TextStyle(fontSize: 12),
                      ),
                      SizedBox(height: 5),
                      dateForm(),
                    ],
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  width: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Fecha hasta',
                        style: TextStyle(fontSize: 12),
                      ),
                      SizedBox(height: 5),
                      dateForm(),
                    ],
                  ),
                ),
                SizedBox(width: 20),
                Container(
                  width: 200,
                  child: SizedBox(
                    width: double.infinity,
                    child: btnPrimary(
                      text: 'Buscar',
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
