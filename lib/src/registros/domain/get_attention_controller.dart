import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:vet_app/components/snackbar.dart';
import 'package:vet_app/config/variables_global.dart';
import 'package:vet_app/src/_pet/data/model/pet_client.dart';
import 'package:vet_app/src/_pet/data/pet_repository.dart';
import 'package:vet_app/src/registros/data/attentions_repository.dart';
import 'package:vet_app/src/registros/data/model/attention_detail_model.dart';

class GetAttentionsController extends GetxController {
  final _repo = AttentionRepository();
  final _repoPet = PetClientRepository();

  final petData = Rxn<PetClient>();
  final attention = AttentionDetailModel().obs;

  final _file = File('').obs;
  set upFile(File value) => _file.value = value;
  File get upFile => _file.value;

  final fileName = ''.obs;

  final loadingPage = true.obs;

  final attentionId = ''.obs;

  @override
  Future<void> onInit() async {
    attentionId.value = Get.arguments.toString();
    attention.value = await _repo.getAttentionDetail(
      prefUser.vetId!,
      attentionId.value,
    );

    petData.value = await _repoPet.getPet(attention.value.result!.petId!);

    showFile();

    loadingPage.value = false;

    super.onInit();
  }

  showFile() async {
    final response = await _repo.showFile(
      prefUser.vetId!,
      attentionId.value,
    );
    if (response != null) {
      fileName.value = response;
    }
  }

  uploadFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      upFile = File(result.files.single.path!);
      print('atencion id');
      print(attentionId.value);
      final response = await _repo.uploadFile(
        prefUser.vetId!,
        attentionId.value,
        upFile,
      );
      final datoJson = jsonDecode(response);

      if (datoJson['message'] == 'File uploaded successfully') {
        snackBarMessage(
          type: TypeSnackBarName.SUCCESS,
          message: 'Se subió el archivo con éxito',
        );
        showFile();
      }
    } else {
      snackBarMessage(
        type: TypeSnackBarName.ERROR,
        message: 'El formato del archivo no es compatible',
      );
    }
  }
}
