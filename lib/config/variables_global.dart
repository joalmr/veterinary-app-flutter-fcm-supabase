import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:vet_app/resources/utils/preferences/user_preferences.dart';

final prefUser = PreferenciasUsuario();

final appPruebas = dotenv.env['TEST'] == '1' ? true : false;

final keyMap = dotenv.env['KEY_MAP'];
final urlGlobal = dotenv.env['URL_API'];

final urlBase = dotenv.env['URL_BASE'];
final pathBase = dotenv.env['PATH_BASE'];

final urlTerminos = dotenv.env['TERMINOS'];
final urlPoliticas = dotenv.env['POLITICAS'];
