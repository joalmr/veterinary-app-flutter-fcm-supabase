import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:vet_app/components/buttons.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/src/stats/domain/stats_controller.dart';

class FilterStatView extends StatelessWidget {
  const FilterStatView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StatsController>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Flitro de estadísticas'),
          ),
          body: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 10),
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
              const SizedBox(width: 10),
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
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: btnPrimary(
                  text: 'Buscar',
                  onPressed: _.ejecStats,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
