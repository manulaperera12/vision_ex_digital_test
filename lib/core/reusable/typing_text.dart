// typewriter_text.dart
import 'package:flutter/material.dart';

class TypewriterText extends StatefulWidget {
  final String text;
  final TextStyle? style;
  final TextAlign textAlign;
  final Duration typingSpeed;
  final Duration fadeDuration;
  final Duration pauseBetweenLoops;
  final Duration delayBeforeStart;

  const TypewriterText({
    super.key,
    required this.text,
    this.style,
    this.textAlign = TextAlign.center,
    this.typingSpeed = const Duration(milliseconds: 100),
    this.fadeDuration = const Duration(milliseconds: 500),
    this.pauseBetweenLoops = const Duration(seconds: 2),
    this.delayBeforeStart = Duration.zero,
  });

  @override
  State<TypewriterText> createState() => _TypewriterTextState();
}

class _TypewriterTextState extends State<TypewriterText> with TickerProviderStateMixin {
  late AnimationController _typingController;
  late AnimationController _fadeController;
  late Animation<int> _typingAnimation;
  late Animation<double> _fadeAnimation;
  String _currentText = '';

  @override
  void initState() {
    super.initState();
    _currentText = widget.text;

    // Setup typing animation
    _typingController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: _currentText.length * widget.typingSpeed.inMilliseconds),
    );

    _typingAnimation = IntTween(
      begin: 0,
      end: _currentText.length,
    ).animate(_typingController)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          // Typing finished, wait before fading out
          Future.delayed(widget.pauseBetweenLoops, () {
            if (mounted) {
              _fadeController.forward();
            }
          });
        }
      });

    // Setup fade animation
    _fadeController = AnimationController(
      vsync: this,
      duration: widget.fadeDuration,
    );

    _fadeAnimation = Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(_fadeController)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          // Reset everything and start typing again
          _fadeController.reset();
          _typingController.reset();
          Future.delayed(Duration(milliseconds: 300), () {
            if (mounted) {
              _typingController.forward();
            }
          });
        }
      });

    // Start the initial animation after delay
    Future.delayed(widget.delayBeforeStart, () {
      if (mounted) {
        _typingController.forward();
      }
    });
  }

  @override
  void dispose() {
    _typingController.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String displayText = _currentText.substring(0, _typingAnimation.value);

    return Opacity(
      opacity: _fadeAnimation.value,
      child: Text(
        displayText,
        style: widget.style,
        textAlign: widget.textAlign,
      ),
    );
  }
}