import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/components/buttons.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/src/stats/domain/stats_controller.dart';

class FilterStat extends StatelessWidget {
  const FilterStat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StatsController>(
      builder: (_) {
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
                          const Text(
                            'Fecha desde',
                            style: TextStyle(fontSize: 12),
                          ),
                          const SizedBox(height: 5),
                          TextFormField(
                              controller: _.fechaIn,
                              enableInteractiveSelection: false,
                              readOnly: true,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(
                                  Icons.calendar_today,
                                  color: colorMain,
                                ),
                              ),
                              onTap: () async {
                                _.selectIn(context);
                              }),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    SizedBox(
                      width: 200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Fecha hasta',
                            style: TextStyle(fontSize: 12),
                          ),
                          const SizedBox(height: 5),
                          TextFormField(
                              controller: _.fechaOut,
                              enableInteractiveSelection: false,
                              readOnly: true,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(
                                  Icons.calendar_today,
                                  color: colorMain,
                                ),
                              ),
                              onTap: () async {
                                _.selectOut(context);
                              }),
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
                          onPressed: _.ejecStatsWeb,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
