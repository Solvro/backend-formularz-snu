import "package:serverpod/serverpod.dart";

import "../generated/participant.dart";

class ParticipantEndpoint extends Endpoint {
  Future<bool> doesEmailExist(Session session, String email) async {
    final participantMaybe = await Participant.db.findFirstRow(
      session,
      where: (t) => t.email.equals(email),
    );
    return participantMaybe != null;
  }
}
