# flutter_ef_template

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


# PARA GENRAR LOS ICONS 

dev_dependencies:
  flutter_launcher_icons: ^0.13.1

flutter_icons:
  android: true
  ios: true
  image_path: "assets/icon/app_icon.png" # Ruta de tu ícono


2.2. Coloca tu ícono en el proyecto:
Guarda tu ícono en la carpeta assets/icon/ con el nombre app_icon.png.
La estructura de tu proyecto debería ser similar a:
css
Copy code
assets/
  icon/
    app_icon.png
2.3. Genera los íconos:
Ejecuta el siguiente comando en tu terminal para generar los íconos para Android e iOS:

bash
Copy code
flutter pub run flutter_launcher_icons:main
Esto actualizará automáticamente los archivos de configuración en tu proyecto (AndroidManifest.xml, Info.plist) y generará los íconos en los tamaños necesarios.