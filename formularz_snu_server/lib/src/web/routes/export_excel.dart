import "dart:io";

import "package:excel/excel.dart";
import "package:serverpod/serverpod.dart";

import "../../generated/protocol.dart";

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
    TextCellValue("Ile czasu zajęło zaśnięcie"),
    TextCellValue("Liczba pobudek w nocy"),
    TextCellValue("Całkowity czas przebudzeń w nocy"),
    TextCellValue("Godzina pobudki"),
    TextCellValue("Godzina wstania z łóżka"),
    TextCellValue("Całkowity czas spędzony w łóżku"),
    TextCellValue("Całkowity czas snu"),
    TextCellValue("Ocena snu"),
  ]);

  final entries = await FormEntry.db.find(session);
  for (final entry in entries) {
    sheet.appendRow([
      IntCellValue(entry.id!),
      IntCellValue(entry.participantId),
      TextCellValue(entry.participant?.email ?? ""),
      TextCellValue(entry.participant?.name ?? ""),
      DateTimeCellValue.fromDateTime(entry.timestamp),
      DateTimeCellValue.fromDateTime(entry.inBedStartTime),
      DateTimeCellValue.fromDateTime(entry.fallingAsleepTime),
      TimeCellValue.fromDuration(
        // ile czasu zajęło zaśnięcie
        entry.inBedStartTime.difference(entry.fallingAsleepTime),
      ),
      IntCellValue(entry.midNightAwaikingsCount),
      TimeCellValue.fromDuration(entry.totalMidNightAwaikingsTime),
      DateTimeCellValue.fromDateTime(entry.wakeUpTime),
      DateTimeCellValue.fromDateTime(entry.outBedTime),
      TimeCellValue.fromDuration(
        // Całkowity czas spędzony w łóżku
        entry.outBedTime.difference(entry.inBedStartTime),
      ),
      // Całkowity czas snu
      TimeCellValue.fromDuration(
        entry.wakeUpTime.difference(entry.fallingAsleepTime),
      ),
      // Ocena snu
      TextCellValue("BRAK OCENY"),
    ]);
  }

  return excel.encode()!;
}

class ExportExcelRoute extends Route {
  @override
  Future<bool> handleCall(Session session, HttpRequest request) async {
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
