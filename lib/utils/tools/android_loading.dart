import 'package:flutter/material.dart';
import 'package:helmet_customer/theme/app_colors.dart';
import 'package:helmet_customer/widget/padding/padding.dart';

class AndroidLoading extends StatelessWidget {
  const AndroidLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) => const Padding(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            CustomePadding(
              bottom: 10,
              child: CircularProgressIndicator(color: AppColors.primary),
            ),
            Text('loading...')
          ],
        ),
      );
}
