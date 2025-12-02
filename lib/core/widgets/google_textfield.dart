import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_maps_places_autocomplete_widgets/address_autocomplete_widgets.dart';
import 'package:google_places_autocomplete_text_field/google_places_autocomplete_text_field.dart';
import 'package:event_ticket_task/resources/colors.dart';

class AppTextField extends StatefulHookWidget {
  const AppTextField({
    super.key,
    this.label,
    this.style,
    this.hintStyle,
    this.labelColor,
    this.controller,
    this.focusNode,
    this.keyboardType,
    this.textCapitalization = TextCapitalization.none,
    this.textInputAction,
    this.autofocus = false,
    this.hintText,
    this.errorText,
    this.errorMaxLines,
    this.inputFormatters,
    this.minLines,
    this.maxLines = 1,
    this.enabled = true,
    this.prefix,
    this.prefixIcon,
    this.suffix,
    this.suffixIcon,
    this.suffixText,
    this.obscureText = false,
    this.onChanged,
    this.onSubmitted,
    this.inputBorder,
    this.focusedBorder,
    this.onEditingCompleted,
    this.fillColor,
    this.textAlign = TextAlign.start,
    this.contentPadding,
    this.maxLength,
    this.prefixIconConstraints,
    this.suffixIconConstraints,
    this.autoSuggest = true,
    this.cursorColor,
    this.filled = true,
    this.onTap,
    this.validator,
    this.initialValue,
    this.onSaved,
    this.currency,
    this.isCurrencyField = false,
    this.readOnly = false,
    this.isPassword = false,
    this.isAddressSuggestions = false,
    this.onSuggestionClicked,
    this.isMandatory = false,
    this.infoText = "",
    this.countryCode = 'NG',
    this.isAddressSuggestionsWithNoValidation = false,
  });

  final String? label;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final Color? labelColor;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
  final TextInputAction? textInputAction;
  final bool autofocus;
  final bool readOnly;
  final bool obscureText;
  final String? hintText;
  final String? countryCode;
  final String? errorText;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLines;
  final int? minLines;
  final int? errorMaxLines;
  final bool enabled;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final FormFieldSetter<String>? onSaved;
  final VoidCallback? onEditingCompleted;
  final Widget? prefix;
  final Widget? prefixIcon;
  final Widget? suffix;
  final Widget? suffixIcon;
  final String? suffixText;
  final InputBorder? inputBorder;
  final InputBorder? focusedBorder;
  final Color? fillColor;
  final TextAlign textAlign;
  final EdgeInsets? contentPadding;
  final int? maxLength;
  final BoxConstraints? prefixIconConstraints;
  final BoxConstraints? suffixIconConstraints;
  final bool autoSuggest;
  final bool filled;
  final Color? cursorColor;
  final Function? onTap;
  final FormFieldValidator<String>? validator;
  final String? initialValue;
  final String? currency;
  final bool isCurrencyField;
  final bool isPassword;
  final bool isAddressSuggestions;
  final Function(Place)? onSuggestionClicked;
  final bool isMandatory;
  final String infoText;
  final bool isAddressSuggestionsWithNoValidation;

  @override
  State<AppTextField> createState() => _AppTextFieldState();

  factory AppTextField.address({
    String? label,
    FormFieldValidator<String>? validator,
    TextEditingController? controller,
    String? hintText,
    int? maxLines,
    bool enabled = true,
    String infoText = "",
  }) {
    return AppTextField(
      label: label ?? "Address",
      hintText: hintText,
      validator: validator,
      controller: controller,
      isAddressSuggestions: true,
      maxLines: maxLines,
      enabled: enabled,
      infoText: infoText,
    );
  }

  factory AppTextField.addressWithNoValidation({
    String? label,
    TextEditingController? controller,
    String? hintText,
    Function(Place)? onSuggestionClicked,
    int? maxLines,
    String infoText = "",
  }) {
    return AppTextField(
      label: label ?? "Address",
      hintText: hintText,
      controller: controller,
      isAddressSuggestionsWithNoValidation: true,
      onSuggestionClicked: onSuggestionClicked,
      maxLines: maxLines,
      infoText: infoText,
    );
  }
}

class _AppTextFieldState extends State<AppTextField> {
  FocusNode? _focusNode;

  FocusNode get _effectiveFocusNode =>
      widget.focusNode ?? (_focusNode ??= FocusNode());

  @override
  void initState() {
    super.initState();
    _effectiveFocusNode.addListener(_handleFocusChanged);
  }

  @override
  void dispose() {
    _effectiveFocusNode.removeListener(_handleFocusChanged);
    _focusNode?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final obscure = useState<bool>(false);
    final displayInfoText = useState<bool>(false);
    const borderRadius = 12.0;

    const focusedBorderColor = AppColors.grey;
    const errorBorderColor = AppColors.error;

    final errorBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      borderSide: const BorderSide(color: errorBorderColor),
    );

    final inputBorder =
        widget.inputBorder ??
        OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide.none,
        );

    final focusedBorder =
        widget.focusedBorder ??
        OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(color: focusedBorderColor),
        );

    final suffixIcon = widget.isPassword
        ? GestureDetector(
            onTap: () {
              obscure.value = !obscure.value;
            },
            child: Icon(
              obscure.value ? Icons.visibility : Icons.visibility_off,
              color: AppColors.grey,
            ),
          )
        : widget.suffixIcon;

    return GestureDetector(
      onTap: widget.onTap != null ? () => widget.onTap!() : null,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.isAddressSuggestionsWithNoValidation)
              AddressAutocompleteTextField(
                mapsApiKey: 'AIzaSyD8Qn3gM0m5oY5o8yYQ5m0m0m0m0m0m0m',
                controller: widget.controller,
                debounceTime: 400,
                //TODO (Barry): handle this when we expand to other countries
                componentCountry: 'ng',
                language: 'en-NG',
                onSuggestionClick: (place) {
                  widget.onSuggestionClicked?.call(place);
                  final addr = place.formattedAddress;

                  widget.controller?.text = addr ?? "";
                  widget.controller?.selection = TextSelection.fromPosition(
                    TextPosition(offset: addr?.length ?? 0),
                  );
                },
                maxLines: widget.maxLines,
                onChanged: widget.onChanged,
                style: widget.style ?? _foregroundTextStyle(context),
                textAlign: widget.textAlign,
                maxLength: widget.maxLength,
                maxLengthEnforcement: MaxLengthEnforcement.enforced,
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  floatingLabelAlignment: FloatingLabelAlignment.start,
                  fillColor: widget.fillColor ?? AppColors.grey,
                  filled: widget.filled,
                  contentPadding:
                      widget.contentPadding ??
                      EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: widget.label != null ? 14 : 14,
                      ),
                  hintStyle: widget.hintStyle ?? _hintTextStyle(context),
                  border: inputBorder,
                  focusedBorder: focusedBorder,
                  disabledBorder: inputBorder,
                  enabledBorder: inputBorder,
                  prefix: widget.prefix,
                  prefixIcon: widget.prefixIcon,
                  prefixIconConstraints: widget.prefixIconConstraints,
                  suffix: _suffix(context),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: GestureDetector(
                      onTap: () {
                        widget.controller?.clear();
                      },
                      child: const Icon(
                        Icons.cancel,
                        size: 16,
                        color: AppColors.grey,
                      ),
                    ),
                  ),
                  suffixIconConstraints: const BoxConstraints(
                    maxWidth: 30,
                    maxHeight: 30,
                  ),
                  hintText: widget.hintText ?? widget.label ?? "",
                  errorText: widget.errorText,
                  errorMaxLines: widget.errorMaxLines,
                  counter: const SizedBox.shrink(),
                  errorStyle: _foregroundTextStyle(context, isError: true),
                  errorBorder: errorBorder,
                ),
              )
            else if (widget.isAddressSuggestions)
              GooglePlacesAutoCompleteTextFormField(
                textEditingController: widget.controller,
                config: GoogleApiConfig(
                  apiKey: '',
                  debounceTime: 400, // defaults to 600 ms
                  countries: const ["ng"],
                ),
                overlayContainerBuilder: (c) {
                  return Material(
                    color: AppColors.skyWhite,
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.skyWhite,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: c,
                    ),
                  );
                },
                onSuggestionClicked: (prediction) {
                  widget.controller?.text = prediction.description ?? "";
                  widget.controller?.selection = TextSelection.fromPosition(
                    TextPosition(offset: prediction.description?.length ?? 0),
                  );
                },
                onTapOutside: (event) => FocusScope.of(context).unfocus(),
                maxLines: widget.maxLines,
                enabled: widget.enabled,
                onChanged: widget.onChanged,
                onFieldSubmitted: widget.onSubmitted,
                onEditingComplete: widget.onEditingCompleted,
                validator: widget.validator,
                style: widget.style ?? _foregroundTextStyle(context),
                textAlign: widget.textAlign,
                maxLength: widget.maxLength,
                maxLengthEnforcement: MaxLengthEnforcement.enforced,
                cursorColor: widget.cursorColor ?? Colors.black,
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  floatingLabelAlignment: FloatingLabelAlignment.start,
                  fillColor: widget.fillColor ?? AppColors.grey,
                  filled: widget.filled,
                  contentPadding:
                      widget.contentPadding ??
                      EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: widget.label != null ? 14 : 14,
                      ),
                  hintStyle: widget.hintStyle ?? _hintTextStyle(context),
                  border: inputBorder,
                  focusedBorder: focusedBorder,
                  disabledBorder: inputBorder,
                  enabledBorder: inputBorder,
                  prefix: widget.prefix,
                  prefixIcon: widget.prefixIcon,
                  prefixIconConstraints: widget.prefixIconConstraints,
                  suffix: _suffix(context),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: GestureDetector(
                      onTap: () {
                        widget.controller?.clear();
                      },
                      child: const Icon(
                        Icons.cancel,
                        size: 16,
                        color: AppColors.grey,
                      ),
                    ),
                  ),
                  suffixIconConstraints: const BoxConstraints(
                    maxWidth: 30,
                    maxHeight: 30,
                  ),
                  hintText: widget.hintText ?? widget.label ?? "",
                  errorText: widget.errorText,
                  errorMaxLines: widget.errorMaxLines,
                  counter: const SizedBox.shrink(),
                  errorStyle: _foregroundTextStyle(context, isError: true),
                  errorBorder: errorBorder,
                ),
              )
            else
              TextFormField(
                onSaved: widget.onSaved,
                initialValue: widget.initialValue,
                enableIMEPersonalizedLearning: widget.autoSuggest,
                enableSuggestions: widget.autoSuggest,
                controller: widget.controller,
                focusNode: _effectiveFocusNode,
                keyboardType: widget.keyboardType,
                textCapitalization: widget.textCapitalization,
                textInputAction: widget.textInputAction,
                autofocus: widget.autofocus,
                readOnly: widget.readOnly,
                obscureText: widget.isPassword
                    ? !obscure.value
                    : widget.obscureText,
                obscuringCharacter: '*',
                inputFormatters: widget.inputFormatters,
                autocorrect: false,
                maxLines: widget.maxLines,
                minLines: widget.minLines,
                enabled: widget.enabled,
                onChanged: widget.onChanged,
                onFieldSubmitted: widget.onSubmitted,
                onEditingComplete: widget.onEditingCompleted,
                validator: widget.validator,
                style: widget.style ?? _foregroundTextStyle(context),
                textAlign: widget.textAlign,
                maxLength: widget.maxLength,
                maxLengthEnforcement: MaxLengthEnforcement.enforced,
                cursorColor: widget.cursorColor ?? Colors.black,
                onTapOutside: (event) => FocusScope.of(context).unfocus(),
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  floatingLabelAlignment: FloatingLabelAlignment.start,
                  fillColor: widget.fillColor ?? AppColors.grey,
                  filled: widget.filled,
                  contentPadding:
                      widget.contentPadding ??
                      EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: widget.label != null ? 14 : 14,
                      ),
                  hintStyle: widget.hintStyle ?? _hintTextStyle(context),
                  border: inputBorder,
                  focusedBorder: focusedBorder,
                  disabledBorder: inputBorder,
                  enabledBorder: inputBorder,
                  prefix: widget.prefix,
                  prefixIcon: widget.prefixIcon,
                  prefixIconConstraints: widget.prefixIconConstraints,
                  suffix: _suffix(context),
                  suffixIcon: suffixIcon,
                  suffixIconConstraints: widget.suffixIconConstraints,
                  hintText: widget.hintText ?? widget.label ?? "",
                  errorText: widget.errorText,
                  errorMaxLines: widget.errorMaxLines,
                  counter: const SizedBox.shrink(),
                  errorStyle: _foregroundTextStyle(context, isError: true),
                  errorBorder: errorBorder,
                ),
              ),
          ],
        ),
      ),
    );
  }

  void _handleFocusChanged() {
    // ignore: no-empty-block
    setState(() {});
  }

  TextStyle _foregroundTextStyle(BuildContext context, {bool isError = false}) {
    return TextStyle(color: isError ? AppColors.error : AppColors.grey);
  }

  TextStyle _hintTextStyle(BuildContext context) {
    return TextStyle(color: AppColors.grey);
  }

  Color _labelColor(BuildContext context) {
    final labelColor = widget.labelColor ?? AppColors.grey;

    return (widget.errorText ?? '').isNotEmpty ? AppColors.error : labelColor;
  }

  Widget? _suffix(BuildContext context) {
    if (widget.suffixText != null) {
      return Text(widget.suffixText!, style: _foregroundTextStyle(context));
    }

    return widget.suffix;
  }
}
