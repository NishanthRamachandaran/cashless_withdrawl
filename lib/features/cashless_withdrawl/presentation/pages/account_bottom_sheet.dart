// lib/presentation/bottom_sheets/account_bottom_sheet.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/colors.dart';

import '../widgets/account_list.dart';
// // lib/domain/models/account_model.dart

    
class AccountModel {
  final String id;
  final String title;
  final String subtitle;
  final String balance;
  
  AccountModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.balance,
  });
}


Future<AccountModel?> showAccountBottomSheet(BuildContext context) {
  return showModalBottomSheet<AccountModel>(
    context: context,
    isScrollControlled: true,
    backgroundColor: DefaultColors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (ctx) {
      final mq = MediaQuery.of(ctx);
      return FractionallySizedBox(
        heightFactor: 0.35,
        child: _AccountBottomSheetContent(mq: mq),
      );
    },
  );
}

class _AccountBottomSheetContent extends ConsumerWidget {
  final MediaQueryData mq;
  
  const _AccountBottomSheetContent({required this.mq});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final w = mq.size.width;
    final h = mq.size.height;
    final contentWidth = w * 0.94;
    final handleWidth = w * 0.12;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
        child: SizedBox(
          width: contentWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //AccountHeader(handleWidth: handleWidth),
              SizedBox(height: h * 0.02),
              const Expanded(
                child: AccountList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}