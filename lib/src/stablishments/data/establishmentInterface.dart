import 'entity/priceEstEntity.dart';
import 'model/establishmentModel.dart';
import 'entity/establishmentEntity.dart';
import 'model/serviceModel.dart';

abstract class EstablishmentInterface {
  Future<List<ServiceVetModel>> getServiceVet();
  Future<List<dynamic>> setNew(EstablecimientoEntity establecimiento);
  Future<String> setPrices(
    String establecimientoId,
    PriceEstablecimientoEntity precios,
  );
  Future<String> setSchedule(
    String establecimientoId,
    horarios,
  );
  Future<String> setDescription(
    String establecimientoId,
    String description,
  );
  Future<List<EstablecimientoModel>> getAll();
  Future<EstablecimientoModel> getById(String idVet);
  Future<EstablecimientoModel> getFirst();
}
