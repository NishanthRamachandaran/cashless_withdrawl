// lib/data/notifiers/search_notifier.dart
import 'package:flutter_riverpod/legacy.dart';


/// Generic search notifier for this feature.
/// Keeps original list and filters by provided mapper function.
class SearchNotifier<T> extends StateNotifier<List<T>> {
  final List<T> _original;
  final String Function(T) toSearchable;
  
  SearchNotifier(this._original, this.toSearchable) : super(_original);

  /// Call this with the query to update state.
  void search(String q) {
    if (q.trim().isEmpty) {
      // empty query -> restore original list
      state = _original;
      return;
    }
    final low = q.toLowerCase();
    state = _original
        .where((e) => toSearchable(e).toLowerCase().contains(low))
        .toList();
  }
}