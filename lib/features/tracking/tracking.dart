enum TrackingMode { batterySaver, balanced, highAccuracy }

class TrackSample {
  final DateTime timestamp;
  final double latitude;
  final double longitude;
  final double accuracyMeters;
  const TrackSample(this.timestamp, this.latitude, this.longitude, this.accuracyMeters);
}
