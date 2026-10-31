import 'dart:math';

import 'gnss.dart';

/// GnssProvider interface + simulated implementation.
/// Used until a real NMEA/GNSS backend is wired (web/desktop have no GNSS hardware).
abstract interface class GnssProvider {
  Future<GnssObservation> currentObservation();
  Stream<GnssObservation> observations();
}

class SimulatedGnssProvider implements GnssProvider {
  final Random _random;

  SimulatedGnssProvider({int seed = 42}) : _random = Random(seed);

  GnssObservation _sample() {
    final accuracy = 0.8 + _random.nextDouble() * 2.4; // 0.8 .. 3.2 m
    final sats = 14 + _random.nextInt(12); // 14..25
    final fix = accuracy < 1.0
        ? GnssFixType.fixedRtk
        : accuracy < 2.0
            ? GnssFixType.floatRtk
            : GnssFixType.single;
    return GnssObservation(
      fixType: fix,
      horizontalAccuracy: accuracy,
      verticalAccuracy: accuracy * 1.5,
      satellites: sats,
      pdop: 0.9 + _random.nextDouble() * 1.2,
      latitude: 24.7136 + (_random.nextDouble() - 0.5) * 0.001,
      longitude: 46.6753 + (_random.nextDouble() - 0.5) * 0.001,
    );
  }

  @override
  Future<GnssObservation> currentObservation() async => _sample();

  @override
  Stream<GnssObservation> observations() =>
      Stream.periodic(const Duration(seconds: 2), (_) => _sample());
}
