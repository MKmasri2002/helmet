# Quick Reference - Enhanced Models

## Import Statements

```dart
// Enhanced models
import 'package:helmet_customer/models/wash_models/package_model.dart';
import 'package:helmet_customer/models/dirver_model.dart';
import 'package:helmet_customer/models/wash_models/order.dart';
import 'package:helmet_customer/models/review_model.dart';
import 'package:helmet_customer/models/schedule_model.dart';
```

---

## Common Usage Examples

### Package with Currency Symbol

```dart
// Display price with symbol
Text('${package.price} ${package.currencySymbol ?? 'SR'}')

// Check if package is active
if (package.active ?? true) {
  // Show package
}

// Save package to Firebase
await FirebaseFirestore.instance
    .collection('packages')
    .doc(packageId)
    .set(package.toJson());
```

---

### Driver Rating & Performance

```dart
// Display driver info
Row(
  children: [
    Text(driver.name ?? 'Unknown'),
    Icon(Icons.star, color: Colors.amber),
    Text('${driver.rating?.toStringAsFixed(1) ?? '5.0'}'),
    Text('(${driver.totalWashes ?? 0} washes)'),
  ],
)

// Update rating after review
double newAverage = ((driver.rating! * driver.totalWashes!) + newRating) 
    / (driver.totalWashes! + 1);
driver.rating = newAverage;
driver.totalWashes = (driver.totalWashes ?? 0) + 1;
```

---

### Order with Customer Info

```dart
// Create order with location
final order = OrderModel(
  customerName: userModel.name,
  location: userModel.addresses.first.fullAddress,
  serviceType: 'Interior & Exterior',
  // ... other fields
);

// Display in driver app
Card(
  child: ListTile(
    title: Text(order.customerName ?? 'Customer'),
    subtitle: Text(order.location ?? 'No address'),
    trailing: Text(order.serviceType ?? order.type ?? ''),
  ),
)
```

---

### Submit & Display Reviews

```dart
// Submit review
final review = ReviewModel(
  customerId: currentUser.uid,
  customerName: userModel.name,
  driverId: order.driverId,
  orderId: order.id,
  rating: 4.5,
  comment: 'Excellent service!',
  date: DateTime.now().toIso8601String(),
  serviceType: order.serviceType,
);

await FirebaseFirestore.instance
    .collection('reviews')
    .doc()
    .set(review.toJson());

// Fetch driver reviews
final reviewsSnapshot = await FirebaseFirestore.instance
    .collection('reviews')
    .where('driverId', isEqualTo: driverId)
    .orderBy('date', descending: true)
    .limit(10)
    .get();

final reviews = reviewsSnapshot.docs
    .map((doc) => ReviewModel.fromJson(doc.data(), id: doc.id))
    .toList();
```

---

### Driver Schedule Management

```dart
// Create schedule
final schedule = WeeklySchedule(
  schedule: {
    'monday': DaySchedule(
      active: true,
      startTime: '08:00',
      endTime: '17:00',
      breaks: [
        BreakTime(start: '12:00', end: '13:00'),
      ],
    ),
    'tuesday': DaySchedule(
      active: true,
      startTime: '08:00',
      endTime: '17:00',
      breaks: [],
    ),
    // ... other days
  },
);

// Save to driver profile
driver.schedule = schedule.toJson();
await FirebaseFirestore.instance
    .collection('drivers')
    .doc(driver.id)
    .update({'schedule': driver.schedule});

// Check availability
if (schedule.isAvailable('monday')) {
  final monday = schedule.getDay('monday');
  print('Works: ${monday?.startTime} - ${monday?.endTime}');
}

// Get schedule from Firebase
final driverDoc = await FirebaseFirestore.instance
    .collection('drivers')
    .doc(driverId)
    .get();

final driver = DriverModel.fromJson(driverDoc.data()!);
if (driver.schedule != null) {
  final weeklySchedule = WeeklySchedule.fromJson(driver.schedule!);
  // Use schedule...
}
```

---

## Firebase Queries

### Active Packages Only

```dart
final packagesQuery = await FirebaseFirestore.instance
    .collection('packages')
    .where('active', isEqualTo: true)
    .get();
```

### Top Rated Drivers

```dart
final topDrivers = await FirebaseFirestore.instance
    .collection('drivers')
    .where('status', isEqualTo: 'Active')
    .orderBy('rating', descending: true)
    .limit(10)
    .get();
```

### Recent Reviews

```dart
final recentReviews = await FirebaseFirestore.instance
    .collection('reviews')
    .orderBy('date', descending: true)
    .limit(20)
    .get();
```

### Orders by Location

```dart
final locationOrders = await FirebaseFirestore.instance
    .collection('orders')
    .where('areaId', isEqualTo: areaId)
    .where('status', isEqualTo: 'pending')
    .get();
```

---

## Validation Helpers

### Check Package Active

```dart
bool isPackageAvailable(PackageModel package) {
  return package.active ?? true;
}
```

### Check Driver Available

```dart
bool isDriverAvailable(DriverModel driver, String day) {
  if (driver.status != 'Active') return false;
  if (driver.schedule == null) return true; // No schedule = always available
  
  final schedule = WeeklySchedule.fromJson(driver.schedule!);
  return schedule.isAvailable(day.toLowerCase());
}
```

### Validate Rating

```dart
bool isValidRating(double? rating) {
  return rating != null && rating >= 0 && rating <= 5;
}
```

---

## Useful Getters

```dart
// Package
String getDisplayPrice(PackageModel package) {
  final price = package.sale ? package.salePrice : package.price;
  return '${price} ${package.currencySymbol ?? 'SR'}';
}

// Driver
String getDriverStatus(DriverModel driver) {
  if (driver.status == 'Suspended') {
    return 'Suspended until ${driver.suspensionEnd ?? 'Unknown'}';
  }
  return driver.status ?? 'Unknown';
}

// Order
String getOrderSummary(OrderModel order) {
  return '${order.customerName ?? 'Customer'} - ${order.serviceType ?? order.type}';
}

// Review
String getReviewTimestamp(ReviewModel review) {
  if (review.date == null) return 'Unknown date';
  final date = DateTime.parse(review.date!);
  return DateFormat('MMM d, yyyy').format(date);
}
```

---

## Error Handling

```dart
// Safe package access
final currencySymbol = package.currencySymbol ?? 'SR';
final isActive = package.active ?? true;

// Safe driver access
final rating = driver.rating?.toStringAsFixed(1) ?? 'N/A';
final totalWashes = driver.totalWashes ?? 0;

// Safe order access
final customerName = order.customerName ?? 'Unknown Customer';
final location = order.location ?? 'No location provided';

// Safe review access
final comment = review.comment?.isNotEmpty == true 
    ? review.comment! 
    : 'No comment provided';
```

---

## Migration Patterns

### Existing Package Code

```dart
// Before: Works as is
Text('${package.price} SAR')

// After: Enhanced
Text('${package.price} ${package.currencySymbol ?? 'SR'}')
```

### Existing Driver Code

```dart
// Before: Works as is
Text(driver.name)

// After: Enhanced
Row(
  children: [
    Text(driver.name),
    if (driver.rating != null) ...[
      SizedBox(width: 8),
      Icon(Icons.star, size: 16, color: Colors.amber),
      Text(driver.rating!.toStringAsFixed(1)),
    ],
  ],
)
```

### Existing Order Code

```dart
// Before: Works as is
ListTile(title: Text('Order ${order.id}'))

// After: Enhanced
ListTile(
  title: Text(order.customerName ?? 'Order ${order.id}'),
  subtitle: Text(order.location ?? 'No location'),
)
```

---

## Best Practices

1. **Always provide defaults** for nullable fields
2. **Check active status** before displaying packages
3. **Validate ratings** are in 0-5 range
4. **Use schedule helper methods** instead of manual checks
5. **Format dates consistently** using DateFormat
6. **Handle null schedules** (null = always available)
7. **Update driver stats** after each completed order
8. **Include service type** in all new orders

---

**Quick Tip**: All enhancements are optional and backward compatible. Existing code will continue to work without changes!
