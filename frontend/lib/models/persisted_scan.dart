import 'package:hive/hive.dart';

part 'persisted_scan.g.dart';

/// Persisted background scan for storage
@HiveType(typeId: 1)
class PersistedScan extends HiveObject {
  @HiveField(0)
  final String scanId;

  @HiveField(1)
  final String scanName;

  @HiveField(2)
  final DateTime startTime;

  @HiveField(3)
  final String targetType;

  @HiveField(4)
  final String targetName;

  @HiveField(5)
  final List<String> probes;

  @HiveField(6)
  final int generations;

  @HiveField(7)
  final double evalThreshold;

  @HiveField(8)
  String? lastStatus;

  @HiveField(9)
  double? lastProgress;

  @HiveField(10)
  DateTime? lastUpdate;

  PersistedScan({
    required this.scanId,
    required this.scanName,
    required this.startTime,
    required this.targetType,
    required this.targetName,
    required this.probes,
    required this.generations,
    required this.evalThreshold,
    this.lastStatus,
    this.lastProgress,
    this.lastUpdate,
  });

  /// Create from BackgroundScan
  factory PersistedScan.fromMap(Map<String, dynamic> map) {
    return PersistedScan(
      scanId: map['scanId'] as String,
      scanName: map['scanName'] as String,
      startTime: DateTime.parse(map['startTime'] as String),
      targetType: map['targetType'] as String,
      targetName: map['targetName'] as String,
      probes: List<String>.from(map['probes'] as List),
      generations: map['generations'] as int,
      evalThreshold: map['evalThreshold'] as double,
      lastStatus: map['lastStatus'] as String?,
      lastProgress: map['lastProgress'] as double?,
      lastUpdate: map['lastUpdate'] != null
          ? DateTime.parse(map['lastUpdate'] as String)
          : null,
    );
  }

  /// Convert to map
  Map<String, dynamic> toMap() {
    return {
      'scanId': scanId,
      'scanName': scanName,
      'startTime': startTime.toIso8601String(),
      'targetType': targetType,
      'targetName': targetName,
      'probes': probes,
      'generations': generations,
      'evalThreshold': evalThreshold,
      'lastStatus': lastStatus,
      'lastProgress': lastProgress,
      'lastUpdate': lastUpdate?.toIso8601String(),
    };
  }

  /// Update status
  void updateStatus(String status, double? progress) {
    lastStatus = status;
    lastProgress = progress;
    lastUpdate = DateTime.now();
    save(); // Save to Hive
  }
}
