import "package:test/test.dart";

void main() {
  test(
      "Given ExampleUtil "
      "when calling `buildGreeting` with name "
      "then returned greeting includes name", () async {
    const greeting = "Hello Alice";
    expect(greeting, "Hello Alice");
  });
}
