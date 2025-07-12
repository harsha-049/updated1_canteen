import 'package:flutter/material.dart';

class AnimatedHoverButton extends StatefulWidget {
  final String text;
  final Color color;
  final Widget? destination;

  const AnimatedHoverButton({
    super.key,
    required this.text,
    required this.color,
    this.destination,
  });

  @override
  State<AnimatedHoverButton> createState() => _AnimatedHoverButtonState();
}

class _AnimatedHoverButtonState extends State<AnimatedHoverButton> {
  bool _isHovered = false;

  void _onHoverChanged(bool hover) {
    setState(() {
      _isHovered = hover;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _onHoverChanged(true),
      onExit: (_) => _onHoverChanged(false),
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: Matrix4.identity()..scale(_isHovered ? 1.05 : 1.0),
        curve: Curves.easeInOut,
        child: ElevatedButton(
          onPressed: widget.destination != null
              ? () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => widget.destination!),
            );
          }
              : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: widget.color,
            padding: const EdgeInsets.symmetric(vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32),
            ),
            elevation: _isHovered ? 10 : 4,
            shadowColor: Colors.black26,
          ),
          child: ShaderMask(
            shaderCallback: (bounds) {
              return const LinearGradient(
                colors: [Colors.purple, Colors.blue, Colors.green],
              ).createShader(bounds);
            },
            blendMode: BlendMode.srcIn,
            child: Text(
              widget.text,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white, // overridden by ShaderMask
              ),
            ),
          ),
        ),
      ),
    );
  }
}
