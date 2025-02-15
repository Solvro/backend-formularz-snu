/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:async' as _i2;
import 'package:formularz_snu_client/src/protocol/form_data.dart' as _i3;
import 'protocol.dart' as _i4;

/// {@category Endpoint}
class EndpointConfig extends _i1.EndpointRef {
  EndpointConfig(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'config';

  _i2.Future<bool> isStudyInProgress() => caller.callServerEndpoint<bool>(
        'config',
        'isStudyInProgress',
        {},
      );
}

/// {@category Endpoint}
class EndpointFormEntry extends _i1.EndpointRef {
  EndpointFormEntry(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'formEntry';

  _i2.Future<void> submitForm(
    _i3.FormData data,
    String participantEmail,
  ) =>
      caller.callServerEndpoint<void>(
        'formEntry',
        'submitForm',
        {
          'data': data,
          'participantEmail': participantEmail,
        },
      );
}

/// {@category Endpoint}
class EndpointParticipant extends _i1.EndpointRef {
  EndpointParticipant(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'participant';

  _i2.Future<bool> doesThisEmailExist(String email) =>
      caller.callServerEndpoint<bool>(
        'participant',
        'doesThisEmailExist',
        {'email': email},
      );
}

class Client extends _i1.ServerpodClientShared {
  Client(
    String host, {
    dynamic securityContext,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
    Function(
      _i1.MethodCallContext,
      Object,
      StackTrace,
    )? onFailedCall,
    Function(_i1.MethodCallContext)? onSucceededCall,
    bool? disconnectStreamsOnLostInternetConnection,
  }) : super(
          host,
          _i4.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
          onFailedCall: onFailedCall,
          onSucceededCall: onSucceededCall,
          disconnectStreamsOnLostInternetConnection:
              disconnectStreamsOnLostInternetConnection,
        ) {
    config = EndpointConfig(this);
    formEntry = EndpointFormEntry(this);
    participant = EndpointParticipant(this);
  }

  late final EndpointConfig config;

  late final EndpointFormEntry formEntry;

  late final EndpointParticipant participant;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'config': config,
        'formEntry': formEntry,
        'participant': participant,
      };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup => {};
}
