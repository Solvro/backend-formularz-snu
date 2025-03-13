import "dart:io";

import "package:excel/excel.dart";
import "package:serverpod/serverpod.dart";

import "../../generated/protocol.dart";
import "../../utils/assert_auth.dart";

Future<List<int>> exportFormEntriesToExcel(
  Session session,
) async {
  final excel = Excel.createExcel();
  final sheet = excel["Sheet1"];

  sheet.appendRow([
    TextCellValue("ID Odpowiedzi"),
    TextCellValue("ID uczestnika"),
    TextCellValue("Email uczestnika"),
    TextCellValue("Imię i nazwisko"),
    TextCellValue("Znacznik czasu odpowiedzi"),
    TextCellValue("Godzina położenia się do łóżka"),
    TextCellValue("Godzina zaśnięcia"),
    TextCellValue("Ile czasu zajęło zaśnięcie [min]"),
    TextCellValue("Liczba pobudek w nocy"),
    TextCellValue("Całkowity czas przebudzeń w nocy [min]"),
    TextCellValue("Godzina pobudki"),
    TextCellValue("Godzina wstania z łóżka"),
    TextCellValue("Całkowity czas spędzony w łóżku [min]"),
    TextCellValue("Całkowity czas snu [min]"),
    TextCellValue("Ocena snu"),
  ]);

  final entries = await FormEntry.db.find(session);
  for (final entry in entries) {
    final user = await Participant.db.findById(
      session,
      entry.participantId,
    );
    sheet.appendRow([
      IntCellValue(entry.id!),
      IntCellValue(entry.participantId),
      TextCellValue(user?.email ?? ""),
      TextCellValue(user?.name ?? ""),
      DateTimeCellValue.fromDateTime(entry.timestamp),
      DateTimeCellValue.fromDateTime(entry.inBedStartTime),
      DateTimeCellValue.fromDateTime(entry.fallingAsleepTime),
      IntCellValue(
        // Ile czasu zajęło zaśnięcie
        entry.fallingAsleepTime.difference(entry.inBedStartTime).inMinutes,
      ),
      IntCellValue(entry.midNightAwaikingsCount),
      IntCellValue(
        entry.totalMidNightAwaikingsTime.inMinutes,
      ), // Całkowity czas przebudzeń w nocy
      DateTimeCellValue.fromDateTime(entry.wakeUpTime),
      DateTimeCellValue.fromDateTime(entry.outBedTime),
      IntCellValue(
        // Całkowity czas spędzony w łóżku
        entry.outBedTime.difference(entry.inBedStartTime).inMinutes,
      ),
      // Całkowity czas snu
      IntCellValue(
        entry.wakeUpTime.difference(entry.fallingAsleepTime).inMinutes,
      ),
      IntCellValue(
        // Ocena snu
        switch (entry.sleepQuality) {
          SleepScore2.zero => 0,
          SleepScore2.one => 1,
          SleepScore2.two => 2,
          SleepScore2.three => 3,
          SleepScore2.four => 4,
          SleepScore2.five => 5,
        },
      ),
    ]);
  }

  return excel.encode()!;
}

class ExportExcelRoute extends Route {
  @override
  Future<bool> handleCall(Session session, HttpRequest request) async {
    assertAuth(session);
    final excel = await exportFormEntriesToExcel(session);
    final response = request.response;
    response.headers.contentType = ContentType.parse(
      "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
    );
    response.add(excel);
    await response.close();
    return true;
  }
}
