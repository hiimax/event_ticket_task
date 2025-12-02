import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:event_ticket_task/app/router.dart';
import 'package:event_ticket_task/resources/colors.dart';

class PrimaryInputField extends TextFormField {
  PrimaryInputField({
    super.key,
    String? hintText,
    String? Function(String?)? validator,
    String? prefixText,
    Widget? prefixIcon,
    Widget? suffixIcon,
    EdgeInsetsGeometry? suffixIconPadding,
    BoxConstraints? suffixIconConstraints,
    BoxConstraints? prefixIconConstraints,
    TextStyle? hintStyle,
    super.style,
    bool? filled,
    int? maxLines,
    Color? fillColor,
    Color? enabledBorderColor,
    Color? focusBorderColor,
    Color? borderColor,
    double? borderRadius,
    double? borderWidth,
    super.controller,
    super.onChanged,
    super.onEditingComplete,
    super.onFieldSubmitted,
    super.onSaved,
    super.textCapitalization,
    super.inputFormatters,
    super.obscureText,
    super.onTap,
    super.readOnly,
    super.enabled,
    super.keyboardType,
    super.maxLength,
    super.minLines,
    super.initialValue,
    bool required = true,
  }) : super(
         decoration: InputDecoration(
           hintText: hintText,
           prefixIcon: Padding(
             padding: const EdgeInsets.symmetric(horizontal: 8),
             child: prefixIcon,
           ),
           suffixIcon: Padding(
             padding: const EdgeInsets.only(right: 8),
             child: suffixIcon,
           ),
           prefixIconConstraints:
               prefixIconConstraints ??
               BoxConstraints(maxWidth: 40, maxHeight: 24),
           // suffixIconConstraints: suffixIconConstraints ??
           //     BoxConstraints(maxWidth: 30, maxHeight: 24),
           fillColor: fillColor ?? AppColors.skyWhite,
           filled: filled ?? false,
           enabledBorder: OutlineInputBorder(
             borderRadius: BorderRadius.circular(8),
             borderSide: BorderSide(
               color: enabledBorderColor ?? AppColors.neutral400,
               width: 0.8,
             ),
           ),
           focusedBorder: OutlineInputBorder(
             borderRadius: BorderRadius.circular(8),
             borderSide: BorderSide(
               color: focusBorderColor ?? AppColors.primaryColor,
             ),
           ),
           errorBorder: OutlineInputBorder(
             borderRadius: BorderRadius.circular(8),
             borderSide: const BorderSide(color: AppColors.error, width: 0.8),
           ),
           focusedErrorBorder: OutlineInputBorder(
             borderRadius: BorderRadius.circular(8),
             borderSide: const BorderSide(color: AppColors.error),
           ),
           disabledBorder: OutlineInputBorder(
             borderRadius: BorderRadius.circular(8),
             borderSide: const BorderSide(
               color: AppColors.neutral10,
               width: 0.8,
             ),
           ),
           border: OutlineInputBorder(
             borderRadius: BorderRadius.circular(8),
             borderSide: BorderSide(
               color: borderColor ?? AppColors.neutral400,
               width: 0.8,
             ),
           ),
           hintStyle: const TextStyle(
             color: AppColors.neutral600,
             fontSize: 12,
           ),
         ),
         maxLines: maxLines ?? 1,
         autovalidateMode: AutovalidateMode.onUserInteraction,
         textInputAction: TextInputAction.next,
         onTapOutside: (event) =>
             FocusScope.of(rootNavigatorKey.currentState!.context).unfocus(),
         // onChanged: onChanged,
         validator: !required
             ? validator
             : ValidationBuilder()
                   .required()
                   .add(validator ?? (value) => null)
                   .build(),
       );
}

class BigInputField extends StatelessWidget {
  const BigInputField({required this.controller, super.key, this.hintText});

  final TextEditingController controller;
  final String? hintText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: 10,
      validator: ValidationBuilder().required().build(),
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration.collapsed(
        hintText: hintText ?? 'Type your message',
      ),
    );
  }
}

class SearchInputField extends TextFormField {
  SearchInputField({
    required BuildContext context,
    super.key,
    String? hintText,
    // String? Function(String?)? validator,
    Widget? prefixIcon,
    Widget? suffixIcon,
    BoxConstraints? prefixIconConstraints,
    int? maxLines,
    super.controller,
    super.onChanged,
    super.textCapitalization,
    super.inputFormatters,
    super.onFieldSubmitted,
  }) : super(
         cursorHeight: 20,
         decoration: InputDecoration(
           fillColor: AppColors.customColor26.withOpacity(0.2),
           filled: true,
           hintText: hintText ?? 'Search Transactify',
           prefixIcon: Padding(
             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
             child: prefixIcon,
           ),
           suffixIcon: Padding(
             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
             child: suffixIcon,
           ),
           enabledBorder: OutlineInputBorder(
             borderRadius: BorderRadius.circular(8),
             borderSide: BorderSide(
               color: AppColors.customColor26.withOpacity(0.2),
               width: 1,
             ),
           ),
           focusedBorder: OutlineInputBorder(
             borderRadius: BorderRadius.circular(12),
             borderSide: const BorderSide(
               color: AppColors.primaryColor,
               width: 1,
             ),
           ),
           error: null,
           focusedErrorBorder: OutlineInputBorder(
             borderRadius: BorderRadius.circular(12),
             borderSide: const BorderSide(color: AppColors.error, width: 1),
           ),
           disabledBorder: OutlineInputBorder(
             borderRadius: BorderRadius.circular(12),
             borderSide: const BorderSide(
               color: AppColors.neutral200,
               width: 1,
             ),
           ),
           border: OutlineInputBorder(
             borderRadius: BorderRadius.circular(12),
             borderSide: const BorderSide(
               color: AppColors.neutral200,
               width: 1,
             ),
           ),
           hintStyle: const TextStyle(
             color: AppColors.neutral600,
             fontSize: 12,
           ),
         ),
         maxLines: maxLines ?? 1,
         autovalidateMode: AutovalidateMode.onUserInteraction,
         textInputAction: TextInputAction.next,
         onTapOutside: (event) => FocusScope.of(context).unfocus(),
       );
}
