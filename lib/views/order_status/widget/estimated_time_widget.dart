import 'package:flutter/material.dart';
import 'package:helmet_customer/utils/colors/color1.dart';

class EstimatedTimeWidget extends StatelessWidget {
  const EstimatedTimeWidget({
    super.key,
    required this.status,
  });
  final int status;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.22,
          height: 10,
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: status < 0 ? Colors.grey[300] : primaryColor,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.22,
          height: 10,
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: status < 1 ? Colors.grey[300] : primaryColor,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.22,
          height: 10,
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: status < 2 ? Colors.grey[300] : primaryColor,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.22,
          height: 10,
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: status < 3 ? Colors.grey[300] : primaryColor,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ],
    );
  }
}
