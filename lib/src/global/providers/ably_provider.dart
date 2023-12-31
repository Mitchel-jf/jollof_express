import 'dart:math';

import 'package:ably_flutter/ably_flutter.dart' as ably;
import 'package:ably_flutter/ably_flutter.dart';
import 'package:flutter/material.dart';
import 'package:jollof_express/src/global/providers/global_provider.dart';
import 'package:jollof_express/src/global/utils/bot_toast.dart';
import 'package:provider/provider.dart';

/// holds all the connection configuration for ably
class AblyProvider extends ChangeNotifier {
  /// initializes the ably connections:
  /// - the clientoptions
  /// - starts listening for events
  /// - subscribes to a channel
  AblyProvider(this.context) {
    clientOptions = ably.ClientOptions(
      // TODO: PUT YOUR ALBY API KEY HERE
      key: 'YOUR_ALBY_API_KEY',
    );
    realtime = ably.Realtime(options: clientOptions);
    _initializeAlby();
    _subscribeToJollofExpress();
  }

  /// using this to speak to other providers
  /// or perform any context related operation
  final BuildContext context;

  /// ably related state
  late final ClientOptions clientOptions;
  late final Realtime realtime;
  final channelName = "jollof_express";

  /// listens to all the types of connection state concerning ably
  void _initializeAlby() {
    realtime.connection
        .on()
        .listen((ably.ConnectionStateChange stateChange) async {
      debugPrint('New state is: ${stateChange.current}');
      switch (stateChange.current) {
        case ably.ConnectionState.connected:
          debugPrint('Connected to Ably!');
          break;
        case ably.ConnectionState.failed:
          debugPrint('Connection to Ably Failed');
          break;
        case ably.ConnectionState.initialized:
          debugPrint('Connection to Ably Initialized');
          break;
        case ably.ConnectionState.connecting:
          debugPrint('Connecting to Ably...');
          break;
        case ably.ConnectionState.disconnected:
          debugPrint('Disconnected from Ably');
          break;
        case ably.ConnectionState.suspended:
          debugPrint('Connection to Ably Suspended');
          break;
        case ably.ConnectionState.closing:
          debugPrint('Connection to Ably Closing');
          break;
        case ably.ConnectionState.closed:
          debugPrint('Connection to Ably Closed');
          break;
      }
    });
  }

  /// Subscribes the channel name jollof_express to ably
  void _subscribeToJollofExpress() {
    final channel = realtime.channels.get(channelName);
    channel.subscribe().listen((message) {
      debugPrint(message.data.runtimeType.toString());
      debugPrint('Received a greeting message in realtime: ${message.data}');

      int? status = int.tryParse(message.data.toString());
      if (status == null) {
        return showToast(
          "you published the wrong status, "
          "please refer to the README.md for the correct format",
        );
      }
      context.read<GlobalProvider>().updateOrderStatus(status);
    });
  }

  /// this is for test purposes only
  void publishToJollofExpress() async {
    final channel = realtime.channels.get(channelName);
    await channel.publish(
      name: 'greeting',
      data: Random().nextInt(6).toString(),
    );
  }

  void closeConnectionToJollofExpress() {
    debugPrint("Closing connection");
    realtime.connection.close();
  }

  /// disposes this resource
  @override
  void dispose() {
    closeConnectionToJollofExpress();
    super.dispose();
  }
}
