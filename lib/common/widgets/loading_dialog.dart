import 'package:flutter/material.dart';

import 'loading_indicator.dart';

class LoadingDialog {
  static final LoadingDialog _instance = LoadingDialog._();

  LoadingDialog._();

  factory LoadingDialog() {
    return _instance;
  }

  OverlayEntry? entry;

  bool _isShowLoading = false;
  String? _messageContent;

  void showLoadingWithMessage(BuildContext context, {String? message}) {
    _messageContent = message;
    showLoadingPage(context);
  }

  void showLoadingPage(BuildContext context) {
    if (_isShowLoading) return;
    entry = createOverlayEntry(context);
    Overlay.of(context)?.insert(entry!);
    _isShowLoading = true;
  }

  void hideLoadingPage() {
    _messageContent = null;
    if (entry != null) {
      entry?.remove();
      entry = null;
      _isShowLoading = false;
    }
  }

  OverlayEntry createOverlayEntry(BuildContext context) {
    return OverlayEntry(
      builder: (context) => GestureDetector(
        child: Material(
          color: Colors.black12,
          elevation: 4.0,
          child: _LoadingIndicatorWidget(
            messageContent: _messageContent ?? '',
          ),
        ),
      ),
    );
  }
}

class _LoadingIndicatorWidget extends StatefulWidget {
  final String? messageContent;

  const _LoadingIndicatorWidget({Key? key, this.messageContent}) : super(key: key);

  @override
  __LoadingIndicatorWidgetState createState() => __LoadingIndicatorWidgetState();
}

class __LoadingIndicatorWidgetState extends State<_LoadingIndicatorWidget> {
  String get _messageContent => widget.messageContent ?? '';
  static const double defaultSize = 80.0;

  double _resolveBoxHeight = defaultSize;
  double _resolveBoxWidth = defaultSize;

  final GlobalKey _textSizeKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      automaticallyAdjustContent();
    });
  }

  @override
  void didUpdateWidget(covariant _LoadingIndicatorWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    automaticallyAdjustContent();
  }

  void automaticallyAdjustContent() {
    if (_messageContent.isEmpty) {
      _resolveBoxHeight = defaultSize;
      _resolveBoxWidth = defaultSize;
    } else {
      Size textSize = _textSize(_messageContent);
      double padding = 16;
      _resolveBoxWidth = textSize.width + padding * 2;
      _resolveBoxHeight = defaultSize + textSize.height + padding * 2;
    }
    if (mounted) {
      setState(() {});
    }
  }

  Size _textSize(String text) {
    final TextPainter textPainter = TextPainter(text: TextSpan(text: text), textDirection: TextDirection.ltr)
      ..layout(minWidth: 0, maxWidth: MediaQuery.of(context).size.width * 3 / 4);
    return textPainter.size;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Container(
          width: _resolveBoxWidth,
          height: _resolveBoxHeight,
          alignment: Alignment.center,
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const LoadingIndicator(),
                SizedBox(
                  height: _messageContent.isNotEmpty ? 12 : 0,
                ),
                _messageContent.isNotEmpty
                    ? Flexible(
                        child: Text(
                          _messageContent,
                          key: _textSizeKey,
                          style: Theme.of(context).textTheme.titleMedium,
                          textAlign: TextAlign.center,
                        ),
                      )
                    : const SizedBox()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
