import 'package:flutter/material.dart';

/// A widget that wraps any child and provides debug information about layout
/// to help identify rendering issues.
class LayoutDebugWrapper extends StatelessWidget {
  final Widget child;
  final String? name;
  final Color debugColor;

  const LayoutDebugWrapper({
    super.key,
    required this.child,
    this.name,
    this.debugColor = Colors.red,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          decoration: BoxDecoration(
            border: Border.all(color: debugColor.withOpacity(0.3), width: 1),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (name != null)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 4,
                    vertical: 2,
                  ),
                  color: debugColor.withOpacity(0.1),
                  child: Text(
                    name!,
                    style: TextStyle(fontSize: 10, color: debugColor),
                  ),
                ),
              Flexible(child: child),
            ],
          ),
        );
      },
    );
  }
}

/// Helper method to ensure widgets are properly laid out before hit testing
class SafeHitTestWidget extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;

  const SafeHitTestWidget({super.key, required this.child, this.onTap});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Only enable hit testing if the widget has been laid out
        final isLaidOut = constraints.maxWidth > 0 && constraints.maxHeight > 0;

        return GestureDetector(onTap: isLaidOut ? onTap : null, child: child);
      },
    );
  }
}

/// A simple progress indicator wrapper that ensures proper layout
class SafeProgressIndicator extends StatelessWidget {
  final double value;
  final Color? backgroundColor;
  final Color? valueColor;

  const SafeProgressIndicator({
    super.key,
    required this.value,
    this.backgroundColor,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          height: 4,
          child: LinearProgressIndicator(
            value: value,
            backgroundColor: backgroundColor ?? Colors.grey[300],
            valueColor: AlwaysStoppedAnimation<Color>(
              valueColor ?? Theme.of(context).primaryColor,
            ),
          ),
        );
      },
    );
  }
}
