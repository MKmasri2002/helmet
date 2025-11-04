import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helmet_customer/theme/app_colors.dart';
import 'package:helmet_customer/utils/global/global.dart';
import 'package:helmet_customer/views/address/add_address.dart';
import 'package:helmet_customer/views/address/address_controller.dart';
import 'package:helmet_customer/widget/text/headline6.dart';

class AddressBookScreen extends StatelessWidget {
  const AddressBookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddressBookController>(
      builder: (ctrl) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            leading: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: AppColors.primary,
                size: 30,
              ),
            ),
            title: const Text('Addresses'),
            actions: [
              IconButton(
                onPressed: () => Get.to(() => const AddAddress()),
                icon: const Icon(
                  Icons.add_box_rounded,
                  color: AppColors.primary,
                  size: 30,
                ),
              ),
            ],
          ),
          body: userModel.addresses.isEmpty
              ? const Center(
                  child: Text(
                    'No Address Found',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                )
              : ListView.builder(
                  itemCount: userModel.addresses.length,
                  itemBuilder: (context, index) {
                    return userModel.addresses.isNotEmpty
                        ? ListTile(
                            title: Text(userModel.addresses[index].title!),
                            subtitle: Text(userModel.addresses[index].address!),
                            trailing: userModel
                                    .addresses[index].defaultLocation!
                                ? Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: AppColors.primary,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: const Headline6(
                                      title: 'Default',
                                      color: Colors.white,
                                    ),
                                  )
                                : const SizedBox(),
                            onTap: (){
                              ctrl.setDefaultLocation(
                                  address:
                                      userModel.addresses[index],
                                  context: context);
                            }
                          )
                        : const SizedBox();
                  },
                ),
        );
      },
    );
  }
}
