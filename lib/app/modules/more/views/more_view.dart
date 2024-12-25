import 'package:bloodcare/app/modules/more/views/ambulance_view.dart';
import 'package:bloodcare/app/modules/more/views/blog_view.dart';
import 'package:bloodcare/app/modules/more/views/blooddonation_view.dart';
import 'package:bloodcare/app/modules/more/views/compatibility_view.dart';
import 'package:bloodcare/app/modules/more/views/faq_view.dart';
import 'package:bloodcare/app/modules/more/views/listrequestblood_view.dart';
import 'package:bloodcare/app/modules/more/views/settingsprofile_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/more_controller.dart';

class MoreView extends GetView<MoreController> {
  const MoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'More',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: InkWell(
                onTap:() =>  Navigator.push(context, MaterialPageRoute(builder: (context) =>  ProfileSetupView()) ),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.red.shade400,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Row(
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage(
                            'asset/post1.jpg'), 
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Tya Ayu Agustin',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Blood Group: AB',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.edit,
                        color: Colors.white,
                        
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            _buildMenuItem(
              icon: Icons.water_drop_outlined,
              title: 'Create Request Blood',
              onTap:() =>  Navigator.push(context, MaterialPageRoute(builder: (context) =>  ListrequestbloodView()) ),
            ),
            _buildMenuItem(
              icon: Icons.volunteer_activism,
              title: 'Create Donor Blood',
              onTap:() =>  Navigator.push(context, MaterialPageRoute(builder: (context) =>  BlooddonationView()) ),
            ),
            _buildMenuItem(
              icon: Icons.car_crash,
              title: 'Ambulance',
              onTap:() =>  Navigator.push(context, MaterialPageRoute(builder: (context) =>  AmbulancePage()) ),
            ),
            _buildMenuItem(
              icon: Icons.help_outline,
              title: 'FAQ',
              onTap:() =>  Navigator.push(context, MaterialPageRoute(builder: (context) =>  FaqView()) ),
            ),
            _buildMenuItem(
              icon: Icons.favorite_border,
              title: 'Compatibility',
              onTap:() =>  Navigator.push(context, MaterialPageRoute(builder: (context) =>  BloodCompatibilityPage()) ),
            ),
            _buildMenuItem(
              icon: Icons.article_outlined,
              title: 'Blog',
              onTap:() =>  Navigator.push(context, MaterialPageRoute(builder: (context) =>  BlogView()) ),
            ),
            _buildMenuItem(
              icon: Icons.logout,
              title: 'Logout',
              onTap: controller.onLogout,
              showDivider: false,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    bool showDivider = true,
  }) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.red.shade50,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    icon,
                    color: Colors.red,
                    size: 22,
                  ),
                ),
                const SizedBox(width: 16),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                const Icon(
                  Icons.chevron_right,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
        ),
        if (showDivider)
          const Divider(
            height: 1,
            indent: 20,
            endIndent: 20,
          ),
      ],
    );
  }
}
