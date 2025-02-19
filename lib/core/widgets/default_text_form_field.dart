import 'package:app_e_commerce/core/theme/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatefulWidget {
  CustomTextFormField({
    super.key,
    required this.hintText,
    this.textInputType = TextInputType.text,
    this.onChanged,
    this.validator,
  });

  String hintText;
  TextInputType textInputType;
  void Function(String?)? onChanged;
  String? Function(String?)? validator;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
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
        fillColor: MyTheme.whiteColor,
        filled: true,
        hintStyle: Theme.of(context)
            .textTheme
            .labelMedium!
            .copyWith(color: MyTheme.blackColor, fontWeight: FontWeight.w300),
        hintText: widget.hintText,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r),
          borderSide: BorderSide(color: MyTheme.whiteColor, width: 1.w),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r),
          borderSide: BorderSide(color: MyTheme.whiteColor, width: 1.w),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r),
          borderSide: BorderSide(color: MyTheme.whiteColor, width: 1.w),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r),
          borderSide: BorderSide(color: MyTheme.whiteColor, width: 1.w),
        ),
      ),
    );
  }
}
