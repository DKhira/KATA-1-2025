enum RomanNumber {
  I(1),
  V(5),
  X(10),
  L(50),
  C(100),
  D(500),
  M(1000);

  const RomanNumber(this.value);

  factory RomanNumber.get(String romanNumber) {
    return values.firstWhere((element) => element.name == romanNumber);
  }

  final int value;
}
