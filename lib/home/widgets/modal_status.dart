import 'package:flutter/material.dart';
import 'package:app_restaurant_management/home/widgets/modal_confirm.dart';

enum SingingCharacter { agotado, cerrado, nodisponible }

class ModalStatus extends StatefulWidget {
  const ModalStatus({Key? key}) : super(key: key);

  @override
  State<ModalStatus> createState() => _ModalStatusState();
}

class _ModalStatusState extends State<ModalStatus> {
  SingingCharacter? _character = SingingCharacter.agotado;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: ModalConfirm(
        message: 'Motivo del rechazo',
        secondMessage: Column(
          children: [
            RadioListTile<SingingCharacter>(
              title: const Text('El producto esta agotado'),
              value: SingingCharacter.agotado,
              groupValue: _character,
              onChanged: (SingingCharacter? value) {
                setState(() {
                  _character = value;
                });
              },
            ),
            RadioListTile<SingingCharacter>(
              title: const Text('Negocio por cerrar'),
              value: SingingCharacter.cerrado,
              groupValue: _character,
              onChanged: (SingingCharacter? value) {
                setState(() {
                  _character = value;
                });
              },
            ),
            RadioListTile<SingingCharacter>(
              title: const Text('Producto no disponible'),
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
