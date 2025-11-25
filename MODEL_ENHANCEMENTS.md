# Helmet Car Wash - Model Enhancements Documentation

## Overview
This document describes the model enhancements made to the Helmet Car Wash customer app based on AI Studio code recommendations.

---

## Enhanced Models

### 1. PackageModel (`lib/models/wash_models/package_model.dart`)

#### Added Fields:
- **`active`** (bool?): Indicates if the package is currently active/available
  - Default: `true`
  - Used for: Admin package management, filtering available packages

- **`currencySymbol`** (String?): Currency symbol for display (e.g., 'SR', '$', '€')
  - Default: `'SR'` (Saudi Riyal)
  - Used with: `currency` field for complete price formatting

#### New Methods:
- **`toJson()`**: Enables writing package data back to Firebase
  - Returns complete package data as Map<String, dynamic>
  - Supports creating/updating packages from admin panel

#### Usage Example:
```dart
// Create a new package
final package = PackageModel(
  active: true,
  nameAr: 'باقة البلاتين',
  nameEn: 'Platinum Package',
  currency: 'SAR',
  currencySymbol: 'SR',
  price: 299.0,
  salePrice: 249.0,
  sale: true,
  percentage: 17.0,
  count: 10,
  type: 'subscription',
);

// Save to Firebase
await FirebaseFirestore.instance
    .collection('packages')
    .doc()
    .set(package.toJson());

// Display with currency symbol
Text('${package.salePrice} ${package.currencySymbol}');
```

---

### 2. DriverModel (`lib/models/dirver_model.dart`)

#### Added Fields:
- **`licensePlate`** (String?): Vehicle license plate number
  - Used for: Fleet identification, driver verification

- **`rating`** (double?): Driver average rating from customer reviews
  - Default: `5.0`
  - Range: 0.0 - 5.0
  - Used for: Performance tracking, customer feedback display

- **`totalWashes`** (int?): Total number of completed wash orders
  - Default: `0`
  - Used for: Performance metrics, driver statistics

- **`status`** (String?): Current driver employment status
  - Values: `'Active'`, `'Suspended'`, `'Off-Duty'`
  - Default: `'Active'`
  - Used for: Scheduling, availability management

- **`suspensionStart`** (String?): ISO date when suspension began
  - Used with: Suspended drivers for tracking suspension period

- **`suspensionEnd`** (String?): ISO date when suspension ends
  - Used with: Suspended drivers for automatic reactivation

- **`assignedArea`** (Map<String, dynamic>?): Driver's assigned service zone
  - Structure: `{areaId: 'z1', name: 'Downtown'}`
  - Used for: Geographic assignment, routing optimization

- **`schedule`** (Map<String, dynamic>?): Weekly work schedule
  - Structure: See ScheduleModel below
  - Used for: Availability checking, booking validation

#### Usage Example:
```dart
// Create enhanced driver profile
final driver = DriverModel(
  name: 'Ahmad Ali',
  email: 'ahmad@helmet.com',
  phoneNumber: '+966501234567',
  licensePlate: 'ABC-1234',
  rating: 4.8,
  totalWashes: 245,
  status: 'Active',
  assignedArea: {
    'areaId': 'riyadh_downtown',
    'name': 'Riyadh Downtown'
  },
);

// Update driver rating after review
driver.rating = ((driver.rating! * driver.totalWashes!) + newRating) / (driver.totalWashes! + 1);
driver.totalWashes = driver.totalWashes! + 1;
await FirebaseFirestore.instance
    .collection('drivers')
    .doc(driver.id)
    .update(driver.toJson());
```

---

### 3. OrderModel (`lib/models/wash_models/order.dart`)

#### Added Fields:
- **`location`** (String?): Customer's address/location description
  - Used for: Driver navigation, order tracking, receipts

- **`customerName`** (String?): Customer's full name
  - Used for: Order identification, driver communication, invoices

- **`serviceType`** (String?): Additional service classification
  - Examples: 'Interior & Exterior', 'Quick Wash', 'Premium Detail'
  - Used for: Service categorization, reporting

#### Usage Example:
```dart
// Create order with enhanced fields
final order = OrderModel(
  id: orderId,
  user_id: userId,
  customerName: userModel.name,
  location: '${userModel.addresses.first.street}, ${userModel.addresses.first.city}',
  serviceType: 'Interior & Exterior Wash',
  areaId: areaId,
  washTime: DateTime.now().add(Duration(hours: 2)).toIso8601String(),
  status: 'pending',
  price: 75.0,
  type: 'one_time',
);

// Use in driver app for navigation
Text('Customer: ${order.customerName}');
Text('Location: ${order.location}');
```

---

### 4. ReviewModel (`lib/models/review_model.dart`) - NEW

Complete customer feedback system for driver performance tracking.

#### Fields:
- **`id`** (String?): Unique review identifier
- **`customerName`** (String?): Reviewer's name (default: 'Anonymous')
- **`customerId`** (String?): Customer's user ID
- **`driverId`** (String?): Driver being reviewed
- **`rating`** (double?): Numeric rating (0.0 - 5.0)
- **`comment`** (String?): Written feedback
- **`date`** (String?): ISO 8601 timestamp
- **`serviceType`** (String?): Type of service reviewed
- **`orderId`** (String?): Associated order reference

#### Usage Example:
```dart
// Submit review after completed order
final review = ReviewModel(
  customerId: currentUser.uid,
  customerName: userModel.name,
  driverId: order.driverId,
  orderId: order.id,
  rating: 4.5,
  comment: 'Great service! Car looks brand new.',
  date: DateTime.now().toIso8601String(),
  serviceType: order.serviceType,
);

await FirebaseFirestore.instance
    .collection('reviews')
    .doc()
    .set(review.toJson());

// Fetch driver reviews
final reviews = await FirebaseFirestore.instance
    .collection('reviews')
    .where('driverId', isEqualTo: driverId)
    .orderBy('date', descending: true)
    .limit(10)
    .get();
```

---

### 5. ScheduleModel (`lib/models/schedule_model.dart`) - NEW

Comprehensive scheduling system for driver availability management.

#### Classes:

##### BreakTime
Represents a break period during work hours.

- **`start`** (String): Time in HH:mm format (e.g., "13:00")
- **`end`** (String): Time in HH:mm format (e.g., "14:00")

##### DaySchedule
Represents a single day's schedule.

- **`active`** (bool): Whether driver works on this day
- **`startTime`** (String): Work start time (HH:mm)
- **`endTime`** (String): Work end time (HH:mm)
- **`breaks`** (List<BreakTime>): Break periods during the day

##### WeeklySchedule
Helper class for managing weekly schedules.

- **`schedule`** (Map<String, DaySchedule>): Day-keyed schedule map

#### Usage Example:
```dart
// Create driver schedule
final mondaySchedule = DaySchedule(
  active: true,
  startTime: '08:00',
  endTime: '17:00',
  breaks: [
    BreakTime(start: '12:00', end: '13:00'),
    BreakTime(start: '15:00', end: '15:15'),
  ],
);

final weeklySchedule = WeeklySchedule(
  schedule: {
    'monday': mondaySchedule,
    'tuesday': mondaySchedule,
    'wednesday': mondaySchedule,
    'thursday': mondaySchedule,
    'friday': DaySchedule(
      active: true,
      startTime: '08:00',
      endTime: '12:00',
      breaks: [],
    ),
    'saturday': DaySchedule(active: false, startTime: '', endTime: '', breaks: []),
    'sunday': DaySchedule(active: false, startTime: '', endTime: '', breaks: []),
  },
);

// Save to driver profile
driver.schedule = weeklySchedule.toJson();

// Check availability
if (weeklySchedule.isAvailable('monday')) {
  final mondaySchedule = weeklySchedule.getDay('monday');
  print('Driver works Monday: ${mondaySchedule?.startTime} - ${mondaySchedule?.endTime}');
}
```

---

## Migration Guide

### Existing Code Compatibility

All enhancements are **backward compatible**. Existing code will continue to work without changes because:

1. All new fields are **optional** (nullable)
2. Default values are provided in `fromJson()` methods
3. Existing fields remain unchanged

### Recommended Updates

#### 1. Package Display
Update package cards to show currency symbol:

```dart
// Before
Text('${package.price} SAR')

// After
Text('${package.price} ${package.currencySymbol ?? 'SR'}')
```

#### 2. Driver Profiles
Display enhanced driver information:

```dart
// Driver rating display
Row(
  children: [
    Icon(Icons.star, color: Colors.amber),
    Text('${driver.rating?.toStringAsFixed(1) ?? '5.0'}'),
    Text('(${driver.totalWashes ?? 0} washes)'),
  ],
)
```

#### 3. Order Details
Show customer information in driver app:

```dart
// Order card for driver
Card(
  child: Column(
    children: [
      Text('Customer: ${order.customerName ?? 'Not provided'}'),
      Text('Location: ${order.location ?? 'No address'}'),
      Text('Service: ${order.serviceType ?? order.type}'),
    ],
  ),
)
```

---

## Firebase Firestore Structure

### Packages Collection
```json
{
  "active": true,
  "count": 10,
  "currency": "SAR",
  "currencySymbol": "SR",
  "nameAr": "باقة البلاتين",
  "nameEn": "Platinum Package",
  "price": 299.0,
  "salePrice": 249.0,
  "sale": true,
  "percentage": 17.0,
  "type": "subscription"
}
```

### Drivers Collection
```json
{
  "name": "Ahmad Ali",
  "email": "ahmad@helmet.com",
  "phone": "+966501234567",
  "licensePlate": "ABC-1234",
  "rating": 4.8,
  "totalWashes": 245,
  "status": "Active",
  "assignedArea": {
    "areaId": "riyadh_downtown",
    "name": "Riyadh Downtown"
  },
  "schedule": {
    "monday": {
      "active": true,
      "startTime": "08:00",
      "endTime": "17:00",
      "breaks": [
        {"start": "12:00", "end": "13:00"}
      ]
    }
  }
}
```

### Reviews Collection
```json
{
  "customerId": "user123",
  "customerName": "Mohammed Abdullah",
  "driverId": "driver456",
  "orderId": "order789",
  "rating": 4.5,
  "comment": "Great service!",
  "date": "2025-11-25T14:30:00.000Z",
  "serviceType": "Interior & Exterior"
}
```

---

## Testing Checklist

- [ ] Test package creation with new fields
- [ ] Verify currency symbol displays correctly
- [ ] Test driver profile with enhanced fields
- [ ] Verify rating calculations work correctly
- [ ] Test order creation with location/customer info
- [ ] Create and display reviews
- [ ] Test schedule creation and availability checking
- [ ] Verify backward compatibility with existing data
- [ ] Test toJson() methods for all models
- [ ] Verify Firebase read/write operations

---

## Benefits

1. **Better Admin Control**: Active/inactive package management
2. **Enhanced Driver Management**: Performance tracking, scheduling
3. **Improved Customer Service**: Better communication, location info
4. **Quality Assurance**: Review system for driver accountability
5. **Operational Efficiency**: Scheduling system for better resource allocation
6. **Data Completeness**: All models now have complete toJson() methods

---

## Future Enhancements

Potential additions based on business needs:

1. **Analytics**: Track driver performance trends over time
2. **Automated Scheduling**: AI-based driver assignment based on schedule/location
3. **Review Responses**: Allow drivers to respond to customer reviews
4. **Schedule Templates**: Pre-built schedule patterns for quick setup
5. **Multi-Currency**: Support for multiple currencies in packages
6. **Driver Bonuses**: Reward system based on ratings and wash count

---

**Last Updated**: November 25, 2025
**Models Version**: 2.0
**Compatibility**: Backward compatible with v1.0
