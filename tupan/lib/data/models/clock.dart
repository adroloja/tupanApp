class Clock {
  final int id;
  final String userId;
  final DateTime clockIn;
  final DateTime? clockOut;
  final String? total;
  final double latStart;
  final double lngStart;
  final double latEnd;
  final double lngEnd;
  final bool isComplete;

  Clock({
    required this.id,
    required this.userId,
    required this.clockIn,
    this.clockOut,
    this.total,
    required this.latStart,
    required this.lngStart,
    required this.latEnd,
    required this.lngEnd,
    required this.isComplete,
  });

  factory Clock.fromJson(Map<String, dynamic> json) {
    return Clock(
      id: json['id'] as int,
      userId: json['userId'] as String,
      clockIn: DateTime.parse(json['clockIn'] as String),
      clockOut: json['clockOut'] != null
          ? DateTime.parse(json['clockOut'] as String)
          : null,
      total: json['total'] as String?,
      latStart: json['lat_start'] as double,
      lngStart: json['lng_start'] as double,
      latEnd: json['lat_end'] as double,
      lngEnd: json['lng_end'] as double,
      isComplete: json['complete'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'clockIn': clockIn.toIso8601String(),
      'clockOut': clockOut?.toIso8601String(),
      'total': total,
      'lat_start': latStart,
      'lng_start': lngStart,
      'lat_end': latEnd,
      'lng_end': lngEnd,
      'complete': isComplete,
    };
  }
}
