
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:helmet_customer/models/share_app_model.dart';

class LocationPickerDialog extends StatefulWidget {
  const LocationPickerDialog({super.key});

  @override
  LocationPickerDialogState createState() => LocationPickerDialogState();
}

class LocationPickerDialogState extends State<LocationPickerDialog> {
  LatLng? selectedLocation= ShareAppModel.currentLocation; // الموقع الذي يختاره المستخدم

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Choose your Location".tr),
      content: SizedBox(
        width: double.maxFinite,
        height: 300,
        child: Stack(
          children: [
            Positioned(
              top: 0.01,
              bottom: 0.01,
              left: 0.01,
              right: 0.01,
              child: GoogleMap(
                mapToolbarEnabled: true,
                mapType: MapType.hybrid,

                initialCameraPosition: CameraPosition(
                  target: ShareAppModel.currentLocation, // نقطة البداية (مثلاً عمان)
                  zoom: 12,

                ),
                onTap: (LatLng location) {
                  setState(() {
                    selectedLocation = location;
                  });
                },
                onCameraMove: (position) {
                  selectedLocation = position.target;
                },

              ),),

        const Positioned(
          top: 0.01,
          bottom: 30,
          left: 0.01,
          right: 0.01,
          child: Icon(Icons.location_on,color: Colors.red,size: 50,))
          ],
        ),
      ),
      actions: [
        TextButton(
          child: Text("Cancel".tr),
          onPressed: () => Navigator.pop(context, null),
        ),
        ElevatedButton(
          child: Text("Choose".tr),
          onPressed: () {
            if (selectedLocation != null) {
              Navigator.pop(context, selectedLocation);
            }
          },
        ),
      ],
    );
  }
}

// ✅ دالة لفتح الـ Dialog واسترجاع الموقع
Future<LatLng?> showLocationPickerDialog(BuildContext context) async {
  return showDialog<LatLng>(
    context: context,
    builder: (context) => const LocationPickerDialog(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("اختيار الموقع")),
        body: Center(
          child: ElevatedButton(
            child: const Text("اختر الموقع"),
            onPressed: () async {
              LatLng? location = await showLocationPickerDialog(context);
              if (location != null) {
              }
            },
          ),
        ),
      ),
    );
  }
}
