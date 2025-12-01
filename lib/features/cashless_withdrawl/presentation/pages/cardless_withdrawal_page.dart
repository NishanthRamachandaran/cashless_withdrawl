    // lib/features/cardless_withdrawal/presentation/pages/cardless_withdrawal_page.dart
    import 'package:flutter/material.dart';
    import 'package:flutter_riverpod/flutter_riverpod.dart';
    import '../../../../core/constants/colors.dart';
    import '../widgets/cardless_header.dart';
    import '../widgets/cardless_content.dart';

    class CardlessWithdrawalPage extends ConsumerWidget {
      const CardlessWithdrawalPage({super.key});

      @override
      Widget build(BuildContext context, WidgetRef ref) {
        final size = MediaQuery.of(context).size;

        return Scaffold(
          backgroundColor: DefaultColors.blue9D,
          body: Column(
            children: [
              CardlessHeader(
                width: size.width,
                height: size.height,
                onBack: () => Navigator.pop(context),
                title: "Cardless Withdrawal",
              ),
              
              Expanded(
                child: CardlessContent(
                  width: size.width,
                  height: size.height,
                ),
              ),
            ],
          ),
        );
      }
    }
