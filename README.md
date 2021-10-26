[![CI](https://github.com/joalmr/veterinary_app/actions/workflows/ci.yml/badge.svg?branch=master)](https://github.com/joalmr/veterinary_app/actions/workflows/ci.yml)

# vet_app

este repositorio cuenta con github actions para el buidl web

# github actions

## for run web
flutter run -d chrome --web-renderer html

## for deploy web
flutter build web --web-renderer html

## poner icono
flutter packages pub run flutter_launcher_icons:main

# despliegue android
flutter build appbundle

# despliegue ios 
abrir en xcode, esperar q termine da cargar la barra
flutter build ios --release
product -> archive

keytool -list -v \
-alias androiddebugkey -keystore ~/.android/debug.keystore


keytool -list -v \
-alias upload -keystore /Users/admin/keystore.jks



## registro
POST: proypet.com/vetowner/register

[
    'name' => ['required', 'string', 'max:255'],
    'lastname' => ['required', 'string', 'max:255'],
    'phone' => ['sometimes'],
    'email' => ['required', 'string', 'email:filter', 'max:255', 'unique:users'],
    'password' => ['required', 'string', 'min:8', 'confirmed'],
]