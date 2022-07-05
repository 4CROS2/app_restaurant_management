import 'dart:io';
import 'package:app_restaurant_management/settings/widgets/modal_option_photo.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../constans.dart';

class CardFormBusiness extends StatefulWidget {
  const CardFormBusiness({
    Key? key,
  }) : super(key: key);

  @override
  State<CardFormBusiness> createState() => _CardFormBusinessState();
}

class _CardFormBusinessState extends State<CardFormBusiness> {
  File? _image;
  final ImagePicker _picker = ImagePicker();

  /// Subtitle Forms
  Container titleCardForm(String text) {
    return Container(
      alignment: Alignment.topLeft,
      margin: const EdgeInsets.only(right: 5, bottom: 5),
      child: Text(
        text,
        style: textStyleSubtitle,
      ),
    );
  }

  /// Nombre de la empresa
  Column nameBusiness() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        titleCardForm('Nombre del Negocio'),
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: TextFormField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }

  /// Dirección
  Column address() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        titleCardForm('Dirección'),
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: TextFormField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }

  /// Ciudad
  Column city() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        titleCardForm('Ciudad'),
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: TextFormField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }

  /// Celular
  Column cellphone() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        titleCardForm('Ciudad'),
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: TextFormField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }

  /// NIT
  Column nit() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        titleCardForm('NIT'),
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: TextFormField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }

  /// Funcionalidad camara
  _imgFromCamera() async {
    try {
      var image = await _picker.pickImage(
          source: ImageSource.camera,
          imageQuality: 100,
          maxWidth: 1280,
          maxHeight: 720);
      if (image != null) {
        setState(() {
          _image = File(image.path);
        });
        // currentCutProvider.listImage.add(File(image.path));
      }
    } on Exception catch (e) {
      // ignore: avoid_print
      print("Fallo al sacar foto");
      // ignore: avoid_print
      print(e);
    }
  }

  /// Foto del Producto
  photoProduct() {
    return InkWell(
      onTap: () async {
        var res = await showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return const ModalOptionPhoto();
            });
        if (res == 'gallery') {
          await _imgFromGallery();
        } else {
          await _imgFromCamera();
        }
      },
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 3 * 1.3,
        height: MediaQuery.of(context).size.width / 3 * 1.3,
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: secondColor),
          ),
          child: ClipOval(
            child: _image != null
                ? Image.file(
                    _image!,
                    fit: BoxFit.cover,
                  )
                : const Icon(Icons.add_photo_alternate_rounded, size: 50),
          ),
        ),
      ),
    );
  }

  //Funcionalidad sacar imagen de galeria
  _imgFromGallery() async {
    try {
      var image = await ImagePicker().pickImage(
          source: ImageSource.gallery,
          imageQuality: 100,
          maxWidth: 1280,
          maxHeight: 720);
      if (image != null) {
        setState(() {
          _image = File(image.path);
        });
      }
    } on Exception catch (e) {
      // ignore: avoid_print
      print("Fallo al traer foto de galeria");
      // ignore: avoid_print
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        photoProduct(),
        const SizedBox(height: 10),
        Container(
          padding:
              const EdgeInsets.only(top: 15, bottom: 15, left: 10, right: 10),
          margin: const EdgeInsets.only(bottom: 25, left: 5, right: 5),
          decoration: boxShadow,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              nameBusiness(),
              address(),
              city(),
              cellphone(),
              nit(),
            ],
          ),
        ),
      ],
    );
  }
}
