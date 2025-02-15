import "package:serverpod/serverpod.dart";

import "../generated/protocol.dart";

class FormEntryEndpoint extends Endpoint {
  Future<void> submitForm(
    Session session,
    FormData data,
    String participantEmail,
  ) async {
    final participant = await Participant.db.findFirstRow(
      session,
      where: (t) => t.email.equals(participantEmail),
    );
    if (participant == null) {
      throw Exception("Participant with email $participantEmail not found.");
    }
    if (participant.id == null) {
      throw Exception("Participant with email $participantEmail has no id.");
    }
    await FormEntry.db.insert(session, [
      FormEntry(
        participantId: participant.id!,
        data: data,
        timestamp: DateTime.now(),
      ),
    ]);
  }
}
