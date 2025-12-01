// lib/presentation/widgets/bottom_sheet/account_list.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/constants/colors.dart';

import '../controllers/account_providers.dart';

class AccountList extends ConsumerWidget {
  const AccountList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final w = MediaQuery.of(context).size.width;
    final accounts = ref.watch(accountsSearchProvider);

    return ListView.separated(
      itemCount: accounts.length,
      separatorBuilder: (_, __) => Divider(
        height: 1,
        color: DefaultColors.grayE6,
      ),
      itemBuilder: (context, i) {
        final a = accounts[i];

        return ListTile(
          contentPadding: const EdgeInsets.symmetric(vertical: 8),
          title: Text(
            a.title,
            style: GoogleFonts.poppins(
              fontSize: w * 0.038,
              fontWeight: FontWeight.w600,
              color: DefaultColors.black,
            ),
          ),
          subtitle: Text(
            a.subtitle,
            style: GoogleFonts.poppins(
              fontSize: w * 0.032,
              fontWeight: FontWeight.w500,
              color: DefaultColors.grayA7,
            ),
          ),
          trailing: Text(
            a.balance,
            style: GoogleFonts.poppins(
              fontSize: w * 0.040,
              fontWeight: FontWeight.w500,
              color: DefaultColors.black,
            ),
          ),
          onTap: () => Navigator.of(context).pop(a),
        );
      },
    );
  }
}