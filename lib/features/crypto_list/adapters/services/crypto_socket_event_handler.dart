import 'dart:convert';

import 'package:crypto_list_tt/features/crypto_list/domain/entities/crypto_unit.dart';

mixin CryptoSocketEventHandler {
  dynamic parseEvent(
    dynamic event,
  ) {
    if (event == null) return null;

    final json = jsonDecode(event);

    return CryptoUnit.fromJson(json['data']);
  }
}
