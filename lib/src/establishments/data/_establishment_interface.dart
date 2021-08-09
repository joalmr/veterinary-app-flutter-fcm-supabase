import 'dart:io';
import 'model/data_map_model.dart';
import 'model/establishment_model_lite.dart';
import 'model/establishmet.dart';
import 'model/service_model.dart';
import 'request/establishment_request.dart';
import 'request/price_est_request.dart';

abstract class EstablishmentInterface {
  Future<List<ServiceVetModel>> getServiceVet();
  Future<List<dynamic>> setNew(EstablecimientoEntity establecimiento);
  Future<void> deleteEstablishmetn(String establecimientoId);
  Future<String> setEmployee(
    String establecimientoId,
    int typeId,
    String name,
    String code,
  );
  Future<List<Employee>> getAllEmployees(
    String establecimientoId,
  );
  Future<Employee> getEmployee(
    String establecimientoId,
    String employeeId,
  );
  Future<String> updateEmployee(
    String establecimientoId,
    String employeeId,
    int typeId,
    String name,
    String code,
  );
  Future<String> deleteEmployee(
    String establecimientoId,
    String employeeId,
  );
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
  Future<List<EstablecimientoModelLite>> getAll();
  Future<EstablecimientoModelLite> getFirst();
  Future<EstablishmentModal> getById(String idVet);
  Future<String> setLogo(String establecimientoId, File image);
  Future<String> setSlides(String establecimientoId, File image);
  Future<String> updateBase(
      EstablecimientoEntity datosBase, String establecimientoId);
  Future<DataMapModel> getLatLngByPlaceId(String placeId);
  Future<String> deleteSlide(
    String establecimientoId,
    String slide,
  );
}
