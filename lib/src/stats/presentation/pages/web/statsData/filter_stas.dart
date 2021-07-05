import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:vet_app/components/buttons.dart';

class FilterStat extends StatelessWidget {
  const FilterStat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 40),
      padding: const EdgeInsets.all(20),
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(0),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Filtros',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                SizedBox(
                  width: 200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Text(
                      //   'Fecha desde',
                      //   style: TextStyle(fontSize: 12),
                      // ),
                      const SizedBox(height: 5),
                      // dateForm(),
                      DateTimePicker(
                        dateMask: 'dd-MM-yyyy',
                        firstDate: DateTime(2020),
                        lastDate: DateTime.now(),
                        dateLabelText: 'Fecha desde',
                        // onChanged: (val) => _.to.value = val,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                SizedBox(
                  width: 200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 5),
                      DateTimePicker(
                        dateMask: 'dd-MM-yyyy',
                        firstDate: DateTime(2020),
                        lastDate: DateTime.now(),
                        dateLabelText: 'Fecha hasta',
                        // onChanged: (val) => _.to.value = val,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 20),
                Container(
                  width: 200,
                  margin: const EdgeInsets.only(top: 5),
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
