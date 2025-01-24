import 'package:flutter/material.dart';

class DefaultElevatedButton extends StatelessWidget {
  const DefaultElevatedButton(
      {super.key,
      required this.label,
      required this.onPressed,
      this.height,
      this.width,
      this.isDisabled = false,
      this.backgroundColor,
      this.labelColor});

  final String label;
  final VoidCallback onPressed;
  final double? height;
  final double? width;
  final bool isDisabled;
  final Color? backgroundColor;
  final Color? labelColor;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        side: const BorderSide(color: Colors.transparent),
        fixedSize: Size(
          width ?? screenSize.width,
          height ?? screenSize.height * 0.085,
        ),
      ),
      onPressed: isDisabled ? null : onPressed,
      child: Text(
        label,
        style: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(color: labelColor, fontSize: 20),
      ),
    );
  }
}
