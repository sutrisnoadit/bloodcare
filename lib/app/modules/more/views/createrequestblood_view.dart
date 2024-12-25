import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bloodcare/app/modules/more/controllers/createrequestblood_controller.dart';

class CreaterequestbloodView extends StatelessWidget {
  final controller = Get.put(BloodRequestController());

  Widget _buildInputField({
    required String label,
    required String hint,
    required Function(String) onChanged,
    Widget? suffixIcon,
    bool readOnly = false,
    VoidCallback? onTap,
    int maxLines = 1,
    TextInputType? keyboardType,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.grey[800],
          ),
        ),
        SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: TextField(
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(color: Colors.grey[400]),
              suffixIcon: suffixIcon,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.transparent),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.transparent),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.red.shade200),
              ),
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            ),
            readOnly: readOnly,
            onTap: onTap,
            maxLines: maxLines,
            keyboardType: keyboardType,
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }

  Widget _buildDropdown({
    required String label,
    required String hint,
    required List<String> items,
    required Function(String?) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.grey[800],
          ),
        ),
        SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: DropdownButtonFormField<String>(
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(color: Colors.grey[400]),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.transparent),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.transparent),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.red.shade200),
              ),
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            ),
            items: items.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: Text(
          'Create Blood Request',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header Section
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.red.shade50,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Icon(Icons.favorite, color: Colors.red, size: 32),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Request Blood',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Fill in the details below to create a blood request',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),

            // Form Fields
            _buildInputField(
              label: 'Post Title',
              hint: 'Enter a title for your request',
              onChanged: (value) => controller.postTitle.value = value,
            ),
            SizedBox(height: 20),

            _buildDropdown(
              label: 'Blood Group',
              hint: 'Select blood group',
              items: ['A+', 'A-', 'B+', 'B-', 'O+', 'O-', 'AB+', 'AB-'],
              onChanged: (value) => controller.bloodGroup.value = value!,
            ),
            SizedBox(height: 20),

            _buildInputField(
              label: 'Amount of Blood',
              hint: 'Enter amount needed',
              onChanged: (value) => controller.amountOfBlood.value = value,
            ),
            SizedBox(height: 20),

            _buildInputField(
              label: 'Required Date',
              hint: 'Select date',
              readOnly: true,
              suffixIcon: Icon(Icons.calendar_today, color: Colors.red),
              onTap: () async {
                final date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(Duration(days: 365)),
                  builder: (context, child) {
                    return Theme(
                      data: Theme.of(context).copyWith(
                        colorScheme: ColorScheme.light(
                          primary: Colors.red,
                        ),
                      ),
                      child: child!,
                    );
                  },
                );
                if (date != null) {
                  controller.date.value = date.toString().split(' ')[0];
                }
              },
              onChanged: (value) {},
            ),
            SizedBox(height: 20),

            _buildInputField(
              label: 'Hospital Details',
              hint: 'Enter hospital name',
              onChanged: (value) => controller.hospitalName.value = value,
            ),
            SizedBox(height: 20),

            _buildInputField(
              label: 'Reason for Request',
              hint: 'Explain why you need blood',
              maxLines: 3,
              onChanged: (value) => controller.reason.value = value,
            ),
            SizedBox(height: 20),

            _buildInputField(
              label: 'Contact Person',
              hint: 'Enter contact person name',
              onChanged: (value) => controller.contactName.value = value,
            ),
            SizedBox(height: 20),

            _buildInputField(
              label: 'Mobile Number',
              hint: 'Enter mobile number',
              keyboardType: TextInputType.phone,
              onChanged: (value) => controller.mobileNumber.value = value,
            ),
            SizedBox(height: 20),

            _buildDropdown(
              label: 'Country',
              hint: 'Select country',
              items: ['USA', 'UK', 'Canada', 'Australia'],
              onChanged: (value) => controller.country.value = value!,
            ),
            SizedBox(height: 20),

            _buildDropdown(
              label: 'City',
              hint: 'Select city',
              items: ['New York', 'London', 'Toronto', 'Sydney'],
              onChanged: (value) => controller.city.value = value!,
            ),
            SizedBox(height: 32),

            Container(
              height: 56,
              child: ElevatedButton(
                onPressed: controller.submitRequest,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 2,
                ),
                child: Text(
                  'Submit Request',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}