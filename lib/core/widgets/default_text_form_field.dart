import 'package:app_e_commerce/core/theme/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class DefaultTextFormField extends StatefulWidget {
  DefaultTextFormField({
    super.key,
    required this.hintText,
    this.textInputType = TextInputType.text,
    this.onChanged,
    this.validator,
    this.prefixIcon,
  });

  String hintText;
  TextInputType textInputType;
  void Function(String?)? onChanged;
  String? Function(String?)? validator;
  IconButton? prefixIcon;

  @override
  State<DefaultTextFormField> createState() => _DefaultTextFormFieldState();
}

class _DefaultTextFormFieldState extends State<DefaultTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      onChanged: widget.onChanged,
      onTapOutside: (_) => FocusScope.of(context).unfocus(),
      keyboardType: widget.textInputType,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: Theme.of(context).textTheme.labelMedium!.copyWith(fontSize: 16),
      decoration: InputDecoration(
        prefixIcon: widget.prefixIcon,
        fillColor: MyTheme.whiteColor,
        filled: true,
        hintStyle: Theme.of(context)
            .textTheme
            .labelMedium!
            .copyWith(color: MyTheme.blackColor, fontWeight: FontWeight.w300),
        hintText: widget.hintText,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r),
          borderSide: BorderSide(color: MyTheme.mainColor, width: 1.w),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r),
          borderSide: BorderSide(color: MyTheme.mainColor, width: 1.w),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r),
          borderSide: BorderSide(color: MyTheme.mainColor, width: 1.w),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r),
          borderSide: BorderSide(color: MyTheme.mainColor, width: 1.w),
        ),
      ),
    );
  }
}
