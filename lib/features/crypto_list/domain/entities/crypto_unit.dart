import 'package:equatable/equatable.dart';

class CryptoUnit extends Equatable {
  final String symbol;

  final double closeValue;
  final double openValue;

  final double volume;

  const CryptoUnit({
    required this.symbol,
    required this.closeValue,
    required this.openValue,
    required this.volume,
  });

  factory CryptoUnit.fromJson(Map<String, dynamic> json) {
    final symbol = json['s'];

    final closeValue = double.tryParse(json['c']);
    final openValue = double.tryParse(json['o']);

    final volume = double.tryParse(json['q']);

    return CryptoUnit(
      symbol: symbol,
      closeValue: closeValue ?? 0,
      openValue: openValue ?? 0,
      volume: volume ?? 0,
    );
  }

  @override
  List<Object?> get props => [
        symbol,
        closeValue,
        openValue,
        volume,
      ];

  bool get isDifferenceNegative => differenceInPercent < 0;

  double get differenceInPercent =>
      ((closeValue - openValue) / openValue) * 100;
}
