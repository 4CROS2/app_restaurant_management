import 'package:app_restaurant_management/home/widgets/orders/modal_confirm.dart';
import 'package:flutter/material.dart';

class ModalOptionPhoto extends StatefulWidget {
  const ModalOptionPhoto({Key? key}) : super(key: key);

  @override
  State<ModalOptionPhoto> createState() => _ModalOptionPhotoState();
}

class _ModalOptionPhotoState extends State<ModalOptionPhoto> {
  String _character = 'camera';

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: ModalConfirm(
        message: 'Añadir imagen',
        secondMessage: Column(
          children: [
            RadioListTile<String>(
              title: const Text('Tomar una foto'),
              value: 'camera',
              groupValue: _character,
              onChanged: (value) {
                setState(() {
                  _character = value!;
                });
              },
            ),
            RadioListTile<String>(
              title: const Text('Subir desde galería'),
              value: 'gallery',
              groupValue: _character,
              onChanged: (value) {
                setState(() {
                  _character = value!;
                });
              },
            ),
          ],
        ),
        onPressConfirm: () async {
          Navigator.of(context).pop(_character);
        },
        onPressCancel: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
