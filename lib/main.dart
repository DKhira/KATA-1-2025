import 'package:code_kata/roman_enum.dart';
import 'package:flutter/material.dart';

void main() {
  testRomanNumbers();
}

int getRomanNumeric(String input) {
  /* Convert input to RomanEnum list*/
  final romanNumbers = input.split('').map((e) => RomanNumber.get(e)).toList();

  int total = 0;

  /// Get the current value and compare it with the next value and subtract
  /// if it is less than current and store in total
  for (int i = 0; i < romanNumbers.length; i++) {
    final current = romanNumbers[i].value;
    int next = 0;

    if (i + 1 < romanNumbers.length) {
      next = romanNumbers[i + 1].value;
    }

    if (current < next) {
      total += next - current;
      i++;
      continue;
    }

    total += current;
  }

  return total;
}

void testRomanNumbers() {
  checkNumber('DCCLXXXIX', 789);
  checkNumber('MMCDXXI', 2421);
  checkNumber('XXXIX', 39);
  checkNumber('CCVII', 207);
  checkNumber('MLXVI', 1066);
  checkNumber('MIX', 1009);
  checkNumber('MMXXV', 2025);
}

void checkNumber(String input, int expectedResult) {
  final result = getRomanNumeric(input);

  debugPrint('Input: $input | ${result == expectedResult ? 'Pass' : 'Fail'}');
}
