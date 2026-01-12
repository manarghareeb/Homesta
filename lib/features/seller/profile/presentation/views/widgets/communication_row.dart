import 'package:flutter/material.dart';
import 'package:homesta/core/theming/colors.dart';

class CommunicationRow extends StatefulWidget {
  final Function(bool, bool) onChanged; // هنبعت القيم للوالد

  const CommunicationRow({super.key, required this.onChanged});

  @override
  State<CommunicationRow> createState() => _CommunicationRowState();
}

class _CommunicationRowState extends State<CommunicationRow> {
  bool isWhatsAppSelected = false;
  bool isSmsSelected = false;

  void _update() {
    widget.onChanged(isWhatsAppSelected, isSmsSelected);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            Checkbox(
              activeColor: ColorManager.greenColor,
              value: isWhatsAppSelected,
              onChanged: (value) {
                setState(() {
                  isWhatsAppSelected = value ?? false;
                  _update();
                });
              },
            ),
            const Text('WhatsApp'),
          ],
        ),
        const SizedBox(width: 20),
        Row(
          children: [
            Checkbox(
              activeColor: ColorManager.greenColor,
              value: isSmsSelected,
              onChanged: (value) {
                setState(() {
                  isSmsSelected = value ?? false;
                  _update();
                });
              },
            ),
            const Text('SMS'),
          ],
        ),
      ],
    );
  }
}
