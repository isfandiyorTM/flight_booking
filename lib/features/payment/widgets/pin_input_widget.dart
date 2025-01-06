import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';

class PinInputField extends StatefulWidget {
  final ValueChanged<String> onComplete;

  const PinInputField({Key? key, required this.onComplete}) : super(key: key);

  @override
  _PinInputFieldState createState() => _PinInputFieldState();
}

class _PinInputFieldState extends State<PinInputField> {
  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());
  final List<TextEditingController> _controllers =
  List.generate(6, (_) => TextEditingController());

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  void _checkCompletion() {
    final pin = _controllers.map((controller) => controller.text).join();
    if (pin.length == 6 && pin.contains(RegExp(r'^\d{6}$'))) {
      widget.onComplete(pin);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(6, (index) {
        return SizedBox(
          width: 45,
          height: 45,
          child: TextFormField(
            controller: _controllers[index],
            focusNode: _focusNodes[index],
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            maxLength: 1,
            style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: AppColors.textBlack),
            decoration: const InputDecoration(
              counterText: '',
              border:InputBorder.none,
              filled: true,
              fillColor: AppColors.inputBg,
            ),
            onChanged: (value) {
              if (value.isNotEmpty) {
                if (index < 5) {
                  _focusNodes[index + 1].requestFocus();
                }
              } else if (index > 0) {
                _focusNodes[index - 1].requestFocus();
              }
              _checkCompletion();
            },
          ),
        );
      }),
    );
  }
}