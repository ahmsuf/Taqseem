import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens.dart';

class GiveHelpScreen extends StatefulWidget {
  const GiveHelpScreen({super.key});

  @override
  State<GiveHelpScreen> createState() => _GiveHelpScreenState();
}

class _GiveHelpScreenState extends State<GiveHelpScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _currentLocation = "Current Location: Not specified";
  String? _foodType;
  double? _quantity;
  List<String> _selectedPhotos = [];
  bool _hygieneChecked = false;
  bool _safetyChecked = false;
  String _deliveryStatus = 'Not Started';

  // Mock donator data
  final Map<String, dynamic> donator = {
    'name': 'Service Lane Restaurant',
    'orgName': 'Food Donation Center',
    'verifiedSince': 'May 01 2023',
    'address': '123 Main Street, Karachi',
    'coordinates': '24.8607° N, 67.0011° E',
  };

  // Method to show hygiene standards dialog
  void _showHygieneStandardsDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Hygiene Standards Requirements'),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'By checking this box, you confirm compliance with:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const Text(
                '1. Food Freshness & Expiry',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Text(
                '• Only donate food that is not expired, spoiled, or visibly decomposed.\n'
                '• Hot food should be donated within 2 hours of preparation.\n'
                '• Cold/perishable food should be stored and transported below 5°C.',
              ),
              const SizedBox(height: 16),
              const Text(
                '2. Food Packaging',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Text(
                '• Food should be properly packaged in clean, food-grade containers.\n'
                '• No food should be in contact with newspapers or reused containers.\n'
                '• Label the food with preparation date and time, and expiry time.',
              ),
              const SizedBox(height: 16),
              const Text(
                '3. Food Types Allowed',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Text(
                '• No donation of:\n'
                '  - Leftovers from customer plates\n'
                '  - Expired, spoiled, or reheated food\n'
                '  - Food exposed for long periods at ambient temperatures',
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      setState(() {
                        _hygieneChecked = false;
                      });
                    },
                    child: const Text('Decline'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      setState(() {
                        _hygieneChecked = true;
                      });
                    },
                    child: const Text('Accept'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Donate Food'),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Location Section (replacing Google Map)
            Card(
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Donation Location',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    ListTile(
                      leading: const Icon(Icons.location_on, color: Colors.red),
                      title: Text(donator['address']),
                      subtitle: Text(donator['coordinates']),
                    ),
                    const Divider(),
                    ListTile(
                      leading: const Icon(Icons.my_location, color: Colors.blue),
                      title: Text(_currentLocation!),
                      onTap: () {
                        // Simulate getting current location
                        setState(() {
                          _currentLocation = "Current Location: 24.8600° N, 67.0020° E";
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Location updated')),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Donator Info
            Card(
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      donator['name'],
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      donator['orgName'],
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.verified, color: Colors.green, size: 16),
                        const SizedBox(width: 4),
                        Text(
                          'Verified Account since ${donator['verifiedSince']}',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Action Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  icon: const Icon(Icons.location_on),
                  label: const Text('Select Your Location'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Select Drop Off'),
                        content: const Text('This would open a location selector in the full implementation.'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                ElevatedButton.icon(
                  icon: const Icon(Icons.notification_important),
                  label: const Text('Deliver to an NGO'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Deliver to an NGO'),
                        content: const Text('This would create a food donation alert in the full implementation.'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Donation Form
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Food Donation Details',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Food Type',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.fastfood),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter food type';
                      }
                      return null;
                    },
                    onSaved: (value) => _foodType = value,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Quantity (kg)',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.scale),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter quantity';
                      }
                      if (double.tryParse(value) == null) {
                        return 'Please enter valid number';
                      }
                      return null;
                    },
                    onSaved: (value) => _quantity = double.parse(value!),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Add Photos (Optional)',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 8),
                  // Photo upload section
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      ..._selectedPhotos.map((photo) => Chip(
                            label: Text(photo),
                            onDeleted: () {
                              setState(() {
                                _selectedPhotos.remove(photo);
                              });
                            },
                          )),
                      IconButton(
                        icon: const Icon(Icons.add_a_photo),
                        onPressed: () {
                          // Simulate photo selection
                          setState(() {
                            _selectedPhotos.add('Photo ${_selectedPhotos.length + 1}');
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Hygiene/Safety Checklist
                  const Text(
                    'Hygiene & Safety Checklist',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  CheckboxListTile(
                    title: const Text('Food prepared following hygiene standards'),
                    value: _hygieneChecked,
                    onChanged: (value) {
                      if (value == true) {
                        _showHygieneStandardsDialog();
                      } else {
                        setState(() {
                          _hygieneChecked = value!;
                        });
                      }
                    },
                  ),
                  CheckboxListTile(
                    title: const Text('Proper food storage maintained'),
                    value: _safetyChecked,
                    onChanged: (value) {
                      setState(() {
                        _safetyChecked = value!;
                      });
                    },
                  ),
                  const SizedBox(height: 20),

                  // Delivery Status
                  const Text(
                    'Delivery Status',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  DropdownButtonFormField<String>(
                    value: _deliveryStatus,
                    items: const [
                      DropdownMenuItem(
                        value: 'Not Started',
                        child: Text('Not Started'),
                      ),
                      DropdownMenuItem(
                        value: 'Scheduled',
                        child: Text('Scheduled'),
                      ),
                      DropdownMenuItem(
                        value: 'In Progress',
                        child: Text('In Progress'),
                      ),
                      DropdownMenuItem(
                        value: 'Completed',
                        child: Text('Completed'),
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        _deliveryStatus = value!;
                      });
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.delivery_dining),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Submit Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        if (!_hygieneChecked || !_safetyChecked) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Please confirm hygiene and safety checks'),
                            ),
                          );
                          return;
                        }
                        // Navigate directly to TrackAlertScreen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TrackAlertScreen(foodType: _foodType, quantity: _quantity,),
                          ),
                        );
                      }
                    },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Donate Now',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}