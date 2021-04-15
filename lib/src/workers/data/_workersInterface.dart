import 'model/workerModel.dart';

abstract class WorkersInterface {
  Future<List<WorkersModal>> getWorkers();
}
