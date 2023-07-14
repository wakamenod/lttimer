import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SessionTimeCupertinoPicker extends ConsumerWidget {
  final int initialIndex;
  final ValueChanged<int> onSelectedItemChanged;
  final List<String> pickerItems;

  const SessionTimeCupertinoPicker(
      {required this.initialIndex,
      required this.onSelectedItemChanged,
      required this.pickerItems,
      super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CupertinoPicker(
      magnification: 1.22,
      squeeze: 1.2,
      useMagnifier: true,
      itemExtent: 32.0,
      scrollController: FixedExtentScrollController(
        initialItem: initialIndex,
      ),
      onSelectedItemChanged: onSelectedItemChanged,
      children: [
        for (final item in pickerItems) Center(child: Text(item)),
      ],
    );
  }
}
