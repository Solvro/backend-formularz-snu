import "package:serverpod/serverpod.dart";

import "../generated/participant.dart";
import "../utils/assert_auth.dart";

class ParticipantEndpoint extends Endpoint {
  Future<bool> doesThisEmailExist(Session session, String email) async {
    assertAuth(session);
    final participantMaybe = await Participant.db.findFirstRow(
      session,
      where: (t) => t.email.equals(email),
    );
    return participantMaybe != null;
  }
}
