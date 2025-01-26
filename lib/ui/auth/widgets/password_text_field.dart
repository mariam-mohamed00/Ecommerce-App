import 'package:app_e_commerce/ui/utils/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PasswordTextFormField extends StatefulWidget {
  const PasswordTextFormField({
    super.key,
    this.onChanged,
    this.validator,
    required this.hintText,
  });

  final String? Function(String?)? onChanged;
  final String? Function(String?)? validator;
  final String hintText;

  @override
  State<PasswordTextFormField> createState() => _PasswordTextFormFieldState();
}

class _PasswordTextFormFieldState extends State<PasswordTextFormField> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      onChanged: widget.onChanged,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: _isObscure,
      autocorrect: false,
      enableSuggestions: false,
      onTapOutside: (_) => FocusScope.of(context).unfocus(),
      style: Theme.of(context).textTheme.labelMedium!.copyWith(fontSize: 16),
      decoration: InputDecoration(
        fillColor: MyTheme.whiteColor,
        filled: true,
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
        hintText: widget.hintText,
        hintStyle: Theme.of(context)
            .textTheme
            .labelMedium!
            .copyWith(color: MyTheme.blackColor, fontWeight: FontWeight.w300),
        suffixIcon: IconButton(
          icon: Icon(
            color: MyTheme.blackColor,
            _isObscure
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined,
          ),
          onPressed: () => setState(() => _isObscure = !_isObscure),
        ),
      ),
    );
  }
}
