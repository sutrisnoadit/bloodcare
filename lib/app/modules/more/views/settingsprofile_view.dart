import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bloodcare/app/modules/more/controllers/settingsprofile_controller.dart';

class ProfileSetupView extends GetView<ProfileSetupController> {
  const ProfileSetupView({Key? key}) : super(key: key);

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    bool readOnly = false,
    VoidCallback? onTap,
    Widget? suffixIcon,
    String? hint,
    TextInputType? keyboardType,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[800],
              fontWeight: FontWeight.w600,
              letterSpacing: 0.3,
            ),
          ),
          SizedBox(height: 8),
          AnimatedContainer(
            duration: Duration(milliseconds: 200),
            child: TextField(
              controller: controller,
              readOnly: readOnly,
              onTap: onTap,
              keyboardType: keyboardType,
              style: TextStyle(fontSize: 15),
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: TextStyle(color: Colors.grey[400]),
                suffixIcon: suffixIcon != null 
                  ? Container(
                      padding: EdgeInsets.all(12),
                      child: suffixIcon,
                    ) 
                  : null,
                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey[300]!),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey[300]!),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.red, width: 1.5),
                ),
                filled: true,
                fillColor: Colors.grey[50],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdown({
    required String label,
    required String value,
    required List<String> items,
    required Function(String?) onChanged,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[800],
              fontWeight: FontWeight.w600,
              letterSpacing: 0.3,
            ),
          ),
          SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[50],
              border: Border.all(color: Colors.grey[300]!),
              borderRadius: BorderRadius.circular(12),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: value,
                isExpanded: true,
                padding: EdgeInsets.symmetric(horizontal: 16),
                borderRadius: BorderRadius.circular(12),
                icon: Icon(Icons.keyboard_arrow_down_rounded, color: Colors.grey[600]),
                items: items.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: 15,
                      ),
                    ),
                  );
                }).toList(),
                onChanged: onChanged,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 20),
          onPressed: () => Get.back(),
        ),
        title: Text(
          'Complete Your Profile',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.red[50],
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    Icon(Icons.info_outline, color: Colors.red[400]),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Complete your profile to connect with blood donors and recipients in your area.',
                        style: TextStyle(
                          color: Colors.red[700],
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),

              // Profile Image Section
              Center(
                child: Stack(
                  children: [
                    Hero(
                      tag: 'profile_image',
                      child: Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          color: Colors.red[100],
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 4),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.red.withOpacity(0.1),
                              blurRadius: 20,
                              offset: Offset(0, 10),
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.person_outline_rounded,
                          size: 50,
                          color: Colors.red[400],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: InkWell(
                        onTap: () {
                          // Implement image upload
                        },
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                          child: Icon(
                            Icons.camera_alt_rounded,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),

              // Form Fields
              _buildTextField(
                label: 'Full Name',
                controller: controller.nameController,
                hint: 'Enter your full name',
                keyboardType: TextInputType.name,
              ),

              _buildTextField(
                label: 'Mobile Number',
                controller: controller.mobileController,
                hint: 'Enter your mobile number',
                keyboardType: TextInputType.phone,
              ),

              Obx(() => _buildDropdown(
                label: 'Blood Group',
                value: controller.selectedBloodGroup.value,
                items: ['A+', 'A-', 'B+', 'B-', 'O+', 'O-', 'AB+', 'AB-'],
                onChanged: (value) => controller.selectedBloodGroup.value = value!,
              )),

              Obx(() => _buildDropdown(
                label: 'Country',
                value: controller.selectedCountry.value,
                items: ['Bangladesh', 'India', 'Pakistan', 'Nepal'],
                onChanged: (value) => controller.selectedCountry.value = value!,
              )),

              Obx(() => _buildDropdown(
                label: 'City',
                value: controller.selectedCity.value,
                items: ['Dhaka', 'Chittagong', 'Sylhet', 'Rajshahi'],
                onChanged: (value) => controller.selectedCity.value = value!,
              )),

              _buildTextField(
                label: 'Date of Birth',
                controller: controller.dateController,
                readOnly: true,
                hint: 'Select your date of birth',
                suffixIcon: Icon(
                  Icons.calendar_today_rounded,
                  size: 20,
                  color: Colors.grey[600],
                ),
                onTap: () async {
                  final date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now().subtract(Duration(days: 365 * 18)),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                    builder: (context, child) {
                      return Theme(
                        data: Theme.of(context).copyWith(
                          colorScheme: ColorScheme.light(
                            primary: Colors.red,
                            onPrimary: Colors.white,
                            surface: Colors.white,
                            onSurface: Colors.black,
                          ),
                        ),
                        child: child!,
                      );
                    },
                  );
                  if (date != null) {
                    controller.dateController.text = 
                      '${date.day.toString().padLeft(2, '0')} ${_getMonthName(date.month)} ${date.year}';
                    controller.calculateAge(date);
                  }
                },
              ),

              if (controller.age.value > 0)
                Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: Obx(() => Text(
                    'Age: ${controller.age.value} years old',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                    ),
                  )),
                ),

              Obx(() => _buildDropdown(
                label: 'Gender',
                value: controller.selectedGender.value,
                items: ['Male', 'Female', 'Other'],
                onChanged: (value) => controller.selectedGender.value = value!,
              )),

              SizedBox(height: 32),

              // Update Button
              Container(
                width: double.infinity,
                height: 54,
                margin: EdgeInsets.only(bottom: 20),
                child: ElevatedButton(
                  onPressed: () {
                    controller.updateProfile();
                    Get.snackbar(
                      'Success',
                      'Profile updated successfully',
                      backgroundColor: Colors.green[100],
                      colorText: Colors.green[800],
                      margin: EdgeInsets.all(8),
                      borderRadius: 8,
                      duration: Duration(seconds: 2),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Save Profile',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getMonthName(int month) {
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    return months[month - 1];
  }
}