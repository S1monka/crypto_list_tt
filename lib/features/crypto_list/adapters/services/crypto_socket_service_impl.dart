import 'dart:async';
import 'dart:io';

import 'package:crypto_list_tt/core/errors/failure.dart';
import 'package:crypto_list_tt/features/crypto_list/boundary/adapters/services/crypto_socket_service.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import 'crypto_socket_event_handler.dart';

@Injectable(as: CryptoSocketService)
class CryptoSocketServiceImpl extends CryptoSocketService
    with CryptoSocketEventHandler {
  WebSocket? ws;
  StreamSubscription? socketSubscription;

  StreamController streamController = StreamController.broadcast();
  Stream<dynamic> get stream => streamController.stream.map(parseEvent);

  bool get isInited => ws?.readyState == WebSocket.open;

  Future<void> close() async {
    await socketSubscription?.cancel();
    socketSubscription = null;
    try {
      await ws?.close();
    } catch (_) {
      debugPrint('Socket already closed.');
    }

    if (ws != null) {
      print(['disconnected', ws?.closeCode, ws?.closeReason]);
    }
    ws = null;
  }

  @override
  Future<Either<Failure, Stream<dynamic>>> initConnect({
    required List<String> streams,
  }) async {
    if (isInited) {
      return Right(stream);
    }

    final route =
        'wss://stream.binance.com:9443/stream?streams=${streams.join('/')}';

    try {
      ws = await WebSocket.connect(route);

      socketSubscription = ws?.listen(
        (event) {
          streamController.add(event);
        },
        onDone: _onDone,
        cancelOnError: false,
      );

      return Right(stream);
    } catch (e) {
      debugPrint('cant connect to chat sockets $e');
      return const Left(UnknownFailure.initial());
    }
  }

  Future<void> _onDone() async {
    await close();
  }
}
