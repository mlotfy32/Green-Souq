//! Three main methods to deal with payment
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:green_souq/core/utiles/services/apiService.dart';
import 'package:green_souq/core/utiles/setup_service_locator.dart';
import 'package:green_souq/core/utiles/shared_pref/prefs_Keys.dart';
import 'package:green_souq/features/payment/data/Model/payment_Intent_Input_model.dart';
import 'package:green_souq/features/payment/data/Model/paymentintentmodel/ephemeral/ephemeral.key.dart';
import 'package:green_souq/features/payment/data/Model/paymentintentmodel/paymentintentmodel.dart';
import 'package:green_souq/main.dart';

class StripeService {
  final secretKey = dotenv.env['STIPE_SECRET_TOKEN'];

  final apiService = sl.get<Apiservice>();
  final _dio = sl.get<Dio>();
  Future<Paymentintentmodel> createPaymentIntent(
    PaymentIntentInputModel paymentIntentInputModel,
  ) async {
    log('$secretKey');
    var response = await _dio.post(
      'https://api.stripe.com/v1/payment_intents',
      data: paymentIntentInputModel.toJson(),
      options: Options(
        contentType: Headers.formUrlEncodedContentType,
        headers: {'Authorization': 'Bearer $secretKey'},
      ),
    );

    Paymentintentmodel paymentIntentModel = Paymentintentmodel.fromJson(
      response.data,
    );

    return paymentIntentModel;
  }

  Future initPaymentSheet({required String paymentIntentClientSecret}) async {
    String userName = await prefs.getString(PrefsKeys.userName) ?? "Mhmd";
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: paymentIntentClientSecret,
        merchantDisplayName: userName,
      ),
    );
  }

  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  //! Start Point
  Future makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    Paymentintentmodel paymentIntentModel = await createPaymentIntent(
      paymentIntentInputModel,
    );

    await initPaymentSheet(
      paymentIntentClientSecret: paymentIntentModel.clientSecret!,
    );
    await displayPaymentSheet();
  }

  // Future<Ephemeral> createEphemeral({required String customerId}) async {
  //   var response = await _dio.post(
  //     'https://api.stripe.com/v1/ephemeral_keys',
  //     data: {'customer': '$customerId'},
  //     options: Options(
  //       contentType: Headers.formUrlEncodedContentType,
  //       headers: {
  //         'Stripe-Version': '2023-10-16',
  //         'Authorization': 'Bearer $secretKey',
  //       },
  //     ),
  //   );
  //   var data = Ephemeral.fromJson(response.data);
  //   log(data.id!);
  //   return data;
  // }
}
