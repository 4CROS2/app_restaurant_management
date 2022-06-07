import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../constans.dart';

enum SingingCharacter { disponible, nodisponible }

class CardFormProduct extends StatefulWidget {
  const CardFormProduct({
    Key? key,
  }) : super(key: key);

  @override
  State<CardFormProduct> createState() => _CardFormProductState();
}

class _CardFormProductState extends State<CardFormProduct> {
  String dropdownValue = 'Platos';
  SingingCharacter? _character = SingingCharacter.disponible;
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

  /// Nombre del Producto
  Column nameProduct() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        titleCardForm('Nombre del Producto'),
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

  /// Categoría
  Column typeProduct() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        titleCardForm('Categoría'),
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: DropdownButtonFormField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
            value: dropdownValue,
            icon: const Icon(Icons.arrow_drop_down),
            style: textStyleItem,
            onChanged: (String? newValue) {
              setState(() {
                dropdownValue = newValue!;
              });
            },
            items: <String>['Platos', 'Bebidas']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  /// Descripción
  Column description() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        titleCardForm('Descripción'),
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: TextFormField(
            maxLines: 3,
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
  Column photoProduct() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        titleCardForm('Foto del Producto'),
        InkWell(
          onTap: () async {
            await _imgFromCamera();
          },
          child: Container(
            width: MediaQuery.of(context).size.width / 3 * 1.3,
            height: MediaQuery.of(context).size.width / 3 * 1.4,
            margin: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              // borderRadius: BorderRadius.circular(10),
              border: Border.all(color: secondColor),
            ),
            child: _image != null
                ? Image.file(
                    _image!,
                    fit: BoxFit.cover,
                  )
                : const Icon(Icons.add_photo_alternate_rounded, size: 50),
          ),
        ),
      ],
    );
  }

  /// Precio
  SizedBox prize() {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2 * 0.8,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          titleCardForm('Precio'),
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: TextFormField(
              keyboardType: TextInputType.number,
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                prefixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [Text('Bs.', style: textStyleItem)],
                ),
                border: const OutlineInputBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Estado
  Container status() {
    return Container(
      width: MediaQuery.of(context).size.width / 2 * 0.8,
      margin: const EdgeInsets.only(bottom: 10, top: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          titleCardForm('Estado'),
          RadioListTile<SingingCharacter>(
            contentPadding: const EdgeInsets.all(0),
            visualDensity: const VisualDensity(
              horizontal: VisualDensity.minimumDensity,
              vertical: VisualDensity.minimumDensity,
            ),
            title: const Text('Disponible'),
            value: SingingCharacter.disponible,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
          RadioListTile<SingingCharacter>(
            contentPadding: const EdgeInsets.all(0),
            visualDensity: const VisualDensity(
              horizontal: VisualDensity.minimumDensity,
              vertical: VisualDensity.minimumDensity,
            ),
            title: const Text('No Disponible'),
            value: SingingCharacter.nodisponible,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 15, bottom: 15, left: 10, right: 10),
      margin: const EdgeInsets.only(bottom: 25, left: 5, right: 5),
      decoration: boxShadow,
      child: Column(
        children: [
          nameProduct(),
          typeProduct(),
          description(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              photoProduct(),
              Column(
                children: [
                  prize(),
                  status(),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
