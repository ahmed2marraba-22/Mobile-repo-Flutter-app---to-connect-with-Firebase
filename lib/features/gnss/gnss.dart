enum GnssFixType { noFix, single, floatRtk, fixedRtk }

class GnssObservation {
  final GnssFixType fixType;
  final double horizontalAccuracy;
  final double verticalAccuracy;
  final int satellites;
  final double pdop;
  final double latitude;
  final double longitude;
  const GnssObservation({required this.fixType, required this.horizontalAccuracy, required this.verticalAccuracy, required this.satellites, required this.pdop, required this.latitude, required this.longitude});
}
