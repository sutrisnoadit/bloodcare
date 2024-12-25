import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'createrequestblood_view.dart';

class ListrequestbloodView extends StatefulWidget {
  ListrequestbloodView({super.key});

  @override
  State<ListrequestbloodView> createState() => _ListrequestbloodViewState();
}

class _ListrequestbloodViewState extends State<ListrequestbloodView> {
   final List<Map<String, String>> volunteers = [
    {
      'name': 'Guy Hawkins',
      'role': 'Acts as a blood collector',
      'image': 'asset/post1.jpg',
      'bloodGroup': 'A+',
      'amount': '2 units',
      'date': '2024-12-25',
      'hospital': 'City Hospital',
      'reason': 'Emergency surgery',
      'contact': 'John Doe',
      'mobile': '123-456-7890',
      'country': 'USA',
      'city': 'New York'
    },
    {
      'name': 'John Cena',
      'role': 'Acts as a blood collector',
      'image': 'asset/post1.jpg',
      'bloodGroup': 'A+',
      'amount': '2 units',
      'date': '2024-12-25',
      'hospital': 'City Hospital',
      'reason': 'Emergency surgery',
      'contact': 'John Doe',
      'mobile': '123-456-7890',
      'country': 'USA',
      'city': 'New York'
    },
  ];

  Widget _buildInputField({
    required String label,
    required String hint,
    required TextEditingController controller,
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
            controller: controller,
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
          ),
        ),
      ],
    );
  }

  Widget _buildDropdown({
    required String label,
    required String hint,
    required List<String> items,
    required String? value,
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
            value: value,
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

  void _showEditDialog(BuildContext context, int index) {
    final nameController = TextEditingController(text: volunteers[index]['name']);
    final roleController = TextEditingController(text: volunteers[index]['role']);
    final amountController = TextEditingController(text: volunteers[index]['amount']);
    final dateController = TextEditingController(text: volunteers[index]['date']);
    final hospitalController = TextEditingController(text: volunteers[index]['hospital']);
    final reasonController = TextEditingController(text: volunteers[index]['reason']);
    final contactController = TextEditingController(text: volunteers[index]['contact']);
    final mobileController = TextEditingController(text: volunteers[index]['mobile']);
    String? selectedCountry = volunteers[index]['country'];
    String? selectedCity = volunteers[index]['city'];
    String? selectedBloodGroup = volunteers[index]['bloodGroup'];

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Header
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.red.shade50,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.edit, color: Colors.red, size: 32),
                        SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Edit Request',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Update the blood request details',
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
                  SizedBox(height: 20),

                  // Form Fields
                  _buildInputField(
                    label: 'Name',
                    hint: 'Enter name',
                    controller: nameController,
                  ),
                  SizedBox(height: 16),

                  _buildInputField(
                    label: 'Role',
                    hint: 'Enter role',
                    controller: roleController,
                  ),
                  SizedBox(height: 16),

                  _buildDropdown(
                    label: 'Blood Group',
                    hint: 'Select blood group',
                    items: ['A+', 'A-', 'B+', 'B-', 'O+', 'O-', 'AB+', 'AB-'],
                    value: selectedBloodGroup,
                    onChanged: (value) {
                      setState(() {
                        selectedBloodGroup = value;
                      });
                    },
                  ),
                  SizedBox(height: 16),

                  _buildInputField(
                    label: 'Amount of Blood',
                    hint: 'Enter amount needed',
                    controller: amountController,
                  ),
                  SizedBox(height: 16),

                  _buildInputField(
                    label: 'Required Date',
                    hint: 'Select date',
                    controller: dateController,
                    readOnly: true,
                    suffixIcon: Icon(Icons.calendar_today, color: Colors.red),
                    onTap: () async {
                      final date = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime.now().add(Duration(days: 365)),
                      );
                      if (date != null) {
                        dateController.text = date.toString().split(' ')[0];
                      }
                    },
                  ),
                  SizedBox(height: 16),

                  _buildInputField(
                    label: 'Hospital Details',
                    hint: 'Enter hospital name',
                    controller: hospitalController,
                  ),
                  SizedBox(height: 16),

                  _buildInputField(
                    label: 'Reason',
                    hint: 'Enter reason',
                    controller: reasonController,
                    maxLines: 3,
                  ),
                  SizedBox(height: 16),

                  _buildInputField(
                    label: 'Contact Person',
                    hint: 'Enter contact person name',
                    controller: contactController,
                  ),
                  SizedBox(height: 16),

                  _buildInputField(
                    label: 'Mobile Number',
                    hint: 'Enter mobile number',
                    controller: mobileController,
                    keyboardType: TextInputType.phone,
                  ),
                  SizedBox(height: 16),

                  _buildDropdown(
                    label: 'Country',
                    hint: 'Select country',
                    items: ['USA', 'UK', 'Canada', 'Australia'],
                    value: selectedCountry,
                    onChanged: (value) {
                      setState(() {
                        selectedCountry = value;
                      });
                    },
                  ),
                  SizedBox(height: 16),

                  _buildDropdown(
                    label: 'City',
                    hint: 'Select city',
                    items: ['New York', 'London', 'Toronto', 'Sydney'],
                    value: selectedCity,
                    onChanged: (value) {
                      setState(() {
                        selectedCity = value;
                      });
                    },
                  ),
                  SizedBox(height: 24),

                  // Action Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text(
                          'Cancel',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ),
                      SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            volunteers[index]['name'] = nameController.text;
                            volunteers[index]['role'] = roleController.text;
                            volunteers[index]['bloodGroup'] = selectedBloodGroup ?? '';
                            volunteers[index]['amount'] = amountController.text;
                            volunteers[index]['date'] = dateController.text;
                            volunteers[index]['hospital'] = hospitalController.text;
                            volunteers[index]['reason'] = reasonController.text;
                            volunteers[index]['contact'] = contactController.text;
                            volunteers[index]['mobile'] = mobileController.text;
                            volunteers[index]['country'] = selectedCountry ?? '';
                            volunteers[index]['city'] = selectedCity ?? '';
                          });
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        ),
                        child: Text(
                          'Save Changes',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'List Request Blood',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.red[400],
              borderRadius: BorderRadius.circular(12),
            ),
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'You can create request',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => CreaterequestbloodView()));
                        },
                        child: Text('Request Now'),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.red[400],
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Image.asset(
                  'asset/icon.png',
                  height: 80,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              'This Your Request Blood',
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 14,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: volunteers.length,
              padding: EdgeInsets.symmetric(horizontal: 16),
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Slidable(
                    endActionPane: ActionPane(
                      motion: ScrollMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (context) {
                            _showEditDialog(context, index);
                          },
                          backgroundColor: Colors.blue[400]!,
                          foregroundColor: Colors.white,
                          icon: Icons.edit,
                          label: 'Edit',
                          borderRadius: BorderRadius.horizontal(
                            left: Radius.circular(12),
                          ),
                        ),
                        SlidableAction(
                          onPressed: (context) {},
                          backgroundColor: Colors.green[400]!,
                          foregroundColor: Colors.white,
                          icon: Icons.call,
                          label: 'Call',
                        ),
                        SlidableAction(
                          onPressed: (context) {},
                          backgroundColor: Colors.red[400]!,
                          foregroundColor: Colors.white,
                          icon: Icons.info,
                          label: 'Info',
                          borderRadius: BorderRadius.horizontal(
                            right: Radius.circular(12),
                          ),
                        ),
                      ],
                    ),
                    child: Container(
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
                      child: ListTile(
                        contentPadding: EdgeInsets.all(12),
                        leading: CircleAvatar(
                          radius: 25,
                          backgroundImage: AssetImage(volunteers[index]['image']!),
                        ),
                        title: Text(
                          volunteers[index]['name']!,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        subtitle: Row(
                          children: [
                            Icon(
                              Icons.volunteer_activism,
                              size: 16,
                              color: Colors.red[400],
                            ),
                            SizedBox(width: 4),
                            Text(
                              volunteers[index]['role']!,
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}