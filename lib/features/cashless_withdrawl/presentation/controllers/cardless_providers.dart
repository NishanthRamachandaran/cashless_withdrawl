// lib/features/cardless_withdrawal/presentation/controllers/cardless_providers.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

// Amount Controller
final cardlessAmountControllerProvider = StateProvider<String>((ref) => '');

// Account Selection
final cardlessSelectedAccountProvider = StateProvider<Map<String, String>?>((ref) => null);

// Terms Acceptance
final cardlessTermsAcceptedProvider = StateProvider<bool>((ref) => false);

// Validation
final cardlessAmountValidProvider = Provider<bool>((ref) {
  final amount = ref.watch(cardlessAmountControllerProvider);
  final value = double.tryParse(amount) ?? 0;
  return value > 0 && value % 50 == 0 && value <= 50000;
});