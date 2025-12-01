// lib/features/cardless_withdrawal/presentation/widgets/account_input_field.dart
import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';
//withdrawal amount page

class WithdrawlAmmountInputField extends StatefulWidget {
  final String labeltext;
  final Map<String, String>? selectedValue;
  final VoidCallback onTap;

  const WithdrawlAmmountInputField({
    super.key,
    required this.labeltext,
    required this.onTap,
    this.selectedValue,
  });

  @override
  State<WithdrawlAmmountInputField> createState() => _WithdrawlAmmountInputFieldState();
}

class _WithdrawlAmmountInputFieldState extends State<WithdrawlAmmountInputField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    // If selected -> show value
    if (widget.selectedValue != null) {
      _controller.text = '${widget.selectedValue!['title']} (${widget.selectedValue!['accnumber']})';
    } else {
      // If NOT selected -> controller empty
      _controller.text = '';
    }

    return GestureDetector(
      onTap: widget.onTap,
      child: AbsorbPointer(
        absorbing: true, // disable typing
        child: TextField(
          controller: _controller,
          decoration: InputDecoration(
            labelText: widget.labeltext,
            labelStyle: TextStyle(
              color: DefaultColors.grayMedBase,
              fontSize: screenWidth * 0.038,
              fontWeight: FontWeight.w500,
            ),
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            suffixIcon: const Icon(Icons.keyboard_arrow_down_rounded, size: 26),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: DefaultColors.grayE5),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: DefaultColors.grayMedBase,
                width: 1.3,
              ),
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.04,
              vertical: screenHeight * 0.02,
            ),
          ),
        ),
      ),
    );
  }
}