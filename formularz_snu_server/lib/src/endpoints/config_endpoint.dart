import "package:serverpod/serverpod.dart";

import "../generated/protocol.dart";

class ConfigEndpoint extends Endpoint {
  Future<bool> isStudyInProgress(Session session) async {
    final configs = await GlobalConfig.db.find(session);
    if (configs.length != 1) {
      throw Exception(
        "Invalid number of global config rows. There must be exactly one row.",
      );
    }
    final today = DateTime.now();
    final config = configs[0];
    return today.isAfter(config.researchStartDate) &&
        today.isBefore(config.researchEndDate);
  }
}
