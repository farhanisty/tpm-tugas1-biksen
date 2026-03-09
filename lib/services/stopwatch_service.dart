import 'dart:async';

enum StopwatchState {
  stopped,
  running,
  reset
}

class StopwatchService {
  final Stopwatch _stopwatch = Stopwatch();
  Timer? _timer;

  StopwatchState state = StopwatchState.stopped;

  void Function(Duration duration)? onTick;

  void start() {
    if (_stopwatch.isRunning) return; // cegah start dua kali

    state = StopwatchState.running;

    _stopwatch.start();

    _timer = Timer.periodic(const Duration(milliseconds: 1), (_) {
      onTick?.call(_stopwatch.elapsed);
    });
  }

  void stop() {
    state = StopwatchState.stopped;

    _stopwatch.stop();
    _timer?.cancel();
  }

  void reset() {
    state = StopwatchState.reset;
    
    _stopwatch.reset();
    onTick?.call(_stopwatch.elapsed);
  }

  String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');

    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    final milliseconds = (duration.inMilliseconds.remainder(1000) ~/ 10)
        .toString()
        .padLeft(2, '0');

    return "$minutes:$seconds:$milliseconds";
  }

  Duration get elapsed => _stopwatch.elapsed;
}