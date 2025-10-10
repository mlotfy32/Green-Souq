import 'dart:math';

class GenerateOtp {
  factory GenerateOtp() {
    return otp;
  }

  GenerateOtp._internal();
  static final GenerateOtp otp = GenerateOtp._internal();

  int generateRandomNumber(int numberOfDigits) {
    if (numberOfDigits < 1) {
      throw ArgumentError('Number of digits must be at least 1');
    }

    Random random = Random();
    int min = pow(10, numberOfDigits - 1).toInt();
    int max = pow(10, numberOfDigits).toInt() - 1;

    return min + random.nextInt(max - min + 1);
  }
}
