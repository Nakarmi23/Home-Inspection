import 'dart:async';

Timer _debounce;

/// Uses Timer to debounce event.
void debounceEvent(
  void Function() callback, {
  Duration duration: const Duration(milliseconds: 500),
}) {
  if (_debounce?.isActive ?? false) _debounce.cancel();
  _debounce = Timer(duration, callback);
}
