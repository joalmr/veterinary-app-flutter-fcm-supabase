import 'dart:io';
import 'establishmentApi.dart';
import 'model/establishmentModelLite.dart';
import 'model/establishmet.dart';
import 'model/serviceModel.dart';
import 'request/establishmentRequest.dart';
import 'request/priceEstRequest.dart';

class EstablishmentRepository {
  final _repository = EstablishmentApi();

  Future<List<ServiceVetModel>> getServiceVet() => _repository.getServiceVet();

  Future<List<dynamic>> setNew(EstablecimientoEntity establecimiento) =>
      _repository.setNew(establecimiento);

  Future<void> deleteEstablishmetn(String establecimientoId) =>
      _repository.deleteEstablishmetn(establecimientoId);

  Future<String> setEmployee(
          String establecimientoId, int typeId, String name, String code) =>
      _repository.setEmployee(establecimientoId, typeId, name, code);

  Future<String> setPrices(
          String establecimientoId, PriceEstablecimientoEntity precios) =>
      _repository.setPrices(establecimientoId, precios);

  Future<String> setSchedule(String establecimientoId, horarios) =>
      _repository.setSchedule(establecimientoId, horarios);

  Future<String> setDescription(String establecimientoId, String description) =>
      _repository.setDescription(establecimientoId, description);

  Future<List<EstablecimientoModelLite>> getAll() => _repository.getAll();

  Future<EstablecimientoModelLite> getFirst() => _repository.getFirst();

  Future<EstablishmentModal> getById(String idVet) =>
      _repository.getById(idVet);

  Future<void> setLogo(String establecimientoId, File image) =>
      _repository.setLogo(establecimientoId, image);
}
