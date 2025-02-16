/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../endpoints/config_endpoint.dart' as _i2;
import '../endpoints/form_entry_endpoint.dart' as _i3;
import '../endpoints/participants_endpoint.dart' as _i4;
import 'package:formularz_snu_server/src/generated/form_data.dart' as _i5;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'config': _i2.ConfigEndpoint()
        ..initialize(
          server,
          'config',
          null,
        ),
      'formEntry': _i3.FormEntryEndpoint()
        ..initialize(
          server,
          'formEntry',
          null,
        ),
      'participant': _i4.ParticipantEndpoint()
        ..initialize(
          server,
          'participant',
          null,
        ),
    };
    connectors['config'] = _i1.EndpointConnector(
      name: 'config',
      endpoint: endpoints['config']!,
      methodConnectors: {
        'isStudyInProgress': _i1.MethodConnector(
          name: 'isStudyInProgress',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['config'] as _i2.ConfigEndpoint)
                  .isStudyInProgress(session),
        )
      },
    );
    connectors['formEntry'] = _i1.EndpointConnector(
      name: 'formEntry',
      endpoint: endpoints['formEntry']!,
      methodConnectors: {
        'submitForm': _i1.MethodConnector(
          name: 'submitForm',
          params: {
            'data': _i1.ParameterDescription(
              name: 'data',
              type: _i1.getType<_i5.FormData>(),
              nullable: false,
            ),
            'participantEmail': _i1.ParameterDescription(
              name: 'participantEmail',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['formEntry'] as _i3.FormEntryEndpoint).submitForm(
            session,
            params['data'],
            params['participantEmail'],
          ),
        )
      },
    );
    connectors['participant'] = _i1.EndpointConnector(
      name: 'participant',
      endpoint: endpoints['participant']!,
      methodConnectors: {
        'doesThisEmailExist': _i1.MethodConnector(
          name: 'doesThisEmailExist',
          params: {
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['participant'] as _i4.ParticipantEndpoint)
                  .doesThisEmailExist(
            session,
            params['email'],
          ),
        )
      },
    );
  }
}
