import "package:serverpod/serverpod.dart";

import "../generated/participant.dart";

class ParticipantEndpoint extends Endpoint {
  Future<bool> doesThisEmailExist(Session session, String email) async {
    final participantMaybe = await Participant.db.find(
      session,
      where: (t) => t.email.equals(email),
    );
    return participantMaybe.isNotEmpty;
  }
}
