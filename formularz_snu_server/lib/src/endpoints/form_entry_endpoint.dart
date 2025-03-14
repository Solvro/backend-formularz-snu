import "package:serverpod/serverpod.dart";

import "../generated/protocol.dart";
import "../utils/assert_auth.dart";

class FormEntryEndpoint extends Endpoint {
  Future<bool> hasTodayAlreadySentResponse(
    Session session,
    String participantEmail,
  ) async {
    assertAuth(session);
    final participant = await Participant.db.findFirstRow(
      session,
      where: (t) => t.email.equals(participantEmail),
    );
    if (participant == null || participant.id == null) {
      throw Exception("Participant with email $participantEmail not found.");
    }
    final today =
        DateTime.now().toUtc().add(const Duration(hours: 1)); // Warsaw is UTC+1
    final startOfDay = DateTime(today.year, today.month, today.day)
        .toUtc()
        .add(const Duration(hours: 1));
    final endOfDay = DateTime(today.year, today.month, today.day, 23, 59, 59)
        .toUtc()
        .add(const Duration(hours: 1));

    final entry = await FormEntry.db.findFirstRow(
      session,
      where: (t) =>
          t.participantId.equals(participant.id) &
          t.timestamp.between(startOfDay, endOfDay),
    );
    return entry != null;
  }

  Future<void> submitForm(
    Session session,
    FormData data,
    String participantEmail,
  ) async {
    assertAuth(session);
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
        timestamp: DateTime.now(),
        fallingAsleepTime: data.fallingAsleepTime,
        inBedStartTime: data.inBedStartTime,
        midNightAwaikingsCount: data.midNightAwaikingsCount,
        wakeUpTime: data.wakeUpTime,
        outBedTime: data.outBedTime,
        totalMidNightAwaikingsTime: data.totalMidNightAwaikingsTime,
        sleepQuality: data.sleepQuality,
      ),
    ]);
  }
}
