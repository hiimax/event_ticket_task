import 'package:flutter/material.dart';
import 'package:event_ticket_task/core/widgets/textfields.dart';

class SmartTextField extends StatefulWidget {
  const SmartTextField({
    required this.onChanged,
    required this.mentionSuggestions,
    required this.hashtagSuggestions,
    super.key,
  });
  final void Function(String) onChanged;
  final List<String> mentionSuggestions;
  final List<String> hashtagSuggestions;

  @override
  _SmartTextFieldState createState() => _SmartTextFieldState();
}

class _SmartTextFieldState extends State<SmartTextField> {
  final TextEditingController _controller = TextEditingController();
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  String _currentSymbol = '';
  int _triggerIndex = -1;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    _hideOverlay();
    _controller
      ..removeListener(_onTextChanged)
      ..dispose();
    super.dispose();
  }

  void _onTextChanged() {
    final text = _controller.text;
    final selection = _controller.selection;

    if (selection.baseOffset != selection.extentOffset) {
      _hideOverlay();
      return;
    }

    final beforeCursor = text.substring(0, selection.baseOffset);
    final atSignIndex = beforeCursor.lastIndexOf('@');
    final hashTagIndex = beforeCursor.lastIndexOf('#');

    if (atSignIndex > hashTagIndex && atSignIndex == selection.baseOffset - 1) {
      _showOverlay('@');
      _triggerIndex = atSignIndex;
    } else if (hashTagIndex > atSignIndex &&
        hashTagIndex == selection.baseOffset - 1) {
      _showOverlay('#');
      _triggerIndex = hashTagIndex;
    } else if (_overlayEntry != null) {
      if (_currentSymbol == '@' && atSignIndex == _triggerIndex) {
        _updateOverlay();
      } else if (_currentSymbol == '#' && hashTagIndex == _triggerIndex) {
        _updateOverlay();
      } else {
        _hideOverlay();
      }
    }

    widget.onChanged(text);
  }

  void _showOverlay(String symbol) {
    _currentSymbol = symbol;
    _overlayEntry = _createOverlayEntry();
    Overlay.of(context).insert(_overlayEntry!);
  }

  void _updateOverlay() {
    _overlayEntry?.markNeedsBuild();
  }

  void _hideOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
    _currentSymbol = '';
    _triggerIndex = -1;
  }

  OverlayEntry _createOverlayEntry() {
    final renderBox = context.findRenderObject()! as RenderBox;
    final size = renderBox.size;

    return OverlayEntry(
      builder: (context) => Positioned(
        width: size.width,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: Offset(0, size.height - 160),
          child: Material(
            elevation: 4,
            child: ListView(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              children: _getCurrentSuggestions()
                  .map(
                    (suggestion) => ListTile(
                      title: Text(suggestion),
                      onTap: () => _onSuggestionTap(suggestion),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }

  List<String> _getCurrentSuggestions() {
    final text = _controller.text.substring(
      _triggerIndex + 1,
      _controller.selection.baseOffset,
    );
    final suggestions = _currentSymbol == '@'
        ? widget.mentionSuggestions
        : widget.hashtagSuggestions;
    return suggestions
        .where(
          (suggestion) =>
              suggestion.toLowerCase().startsWith(text.toLowerCase()),
        )
        .toList();
  }

  void _onSuggestionTap(String suggestion) {
    final text = _controller.text;
    final newText = text.replaceRange(
      _triggerIndex + 1,
      _controller.selection.baseOffset,
      suggestion,
    );
    _controller.value = TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(
        offset: _triggerIndex + suggestion.length + 1,
      ),
    );
    _hideOverlay();
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: BigInputField(controller: _controller),
    );
  }
}
