import 'model/establishmentModel.dart';
import 'establishmentEntity.dart';

abstract class EstablishmentInterface {
  Future<int> setNew(EstablecimientoEntity establecimiento);
  Future<List<EstablecimientoModel>> getAll();
  Future<EstablecimientoModel> getById(String idVet);
  Future<EstablecimientoModel> getFirst();
}
