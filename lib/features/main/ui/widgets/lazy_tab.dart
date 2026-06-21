import 'package:flutter/material.dart';

class LazyTab extends StatefulWidget {
  final bool shouldBuild;
  final WidgetBuilder builder;

  const LazyTab({super.key, required this.shouldBuild, required this.builder});

  @override
  State<LazyTab> createState() => _LazyTabState();
}

class _LazyTabState extends State<LazyTab> {
  bool _hasBuilt = false;

  @override
  void didUpdateWidget(LazyTab oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.shouldBuild && !_hasBuilt) {
      _hasBuilt = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_hasBuilt && !widget.shouldBuild) {
      return const SizedBox.shrink();
    }
    if (!_hasBuilt) {
      _hasBuilt = true;
    }
    return widget.builder(context);
  }
}
