import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountScreen extends StatelessWidget {
  final VoidCallback onRideTap;
  final VoidCallback onActivityTap;

  const AccountScreen({
    Key? key,
    required this.onRideTap,
    required this.onActivityTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff121414),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Account Details',
          style: GoogleFonts.inter(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: const Color(0xffb8c3ff),
          ),
        ),
      ),
      body: Column(
        children: [
          // Profile Details Area
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
              child: Column(
                children: [
                  // User Avatar & Info Card
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      color: const Color(0xff1e2020),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: const Color(0xff434656).withOpacity(0.3)),
                    ),
                    child: Column(
                      children: [
                        // Large Avatar
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: const Color(0xff2e5bff), width: 2),
                            image: const DecorationImage(
                              image: NetworkImage(
                                'https://lh3.googleusercontent.com/aida-public/AB6AXuBnMylpzLuWgHbrJW_XOPctNBDasPlY7Eg0BjR2_tnNo-AqoO5xliee7VVS_AzyASS2MjEwRdAF1Ms6ffWHqa51GZhilLYqU2uQR4hbNweJXmvs5lBTOe6vDrMFUpl5UKM5oRIPYeVHPVm88QAZhXyllm5rkNFeJc_wIM57INBlFSfYjiXBR0Oj9iZpT3xfGFVGcHD8RymRLW45iUVb2PMG88O-DnyctlZBfmisO9MppscXNNpxxYAz',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Aditya Singh',
                          style: GoogleFonts.inter(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.star, color: Colors.amber, size: 16),
                            const SizedBox(width: 4),
                            Text(
                              '4.85 Rating',
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                color: const Color(0xffc4c5d9),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  
                  // Menu Items
                  _buildAccountTile(Icons.credit_card, 'Payment Methods', 'Manage cards, digital wallets'),
                  _buildAccountTile(Icons.local_offer, 'Promos & Discounts', 'View active discount codes'),
                  _buildAccountTile(Icons.security, 'Safety & Security', 'Manage emergency contacts, trusted contacts'),
                  _buildAccountTile(Icons.help_outline, 'Help & Support', 'Browse FAQs, contact customer service'),
                  _buildAccountTile(Icons.settings, 'App Settings', 'Change navigation maps, theme controls'),
                ],
              ),
            ),
          ),
          
          // Bottom Navigation Bar
          Container(
            height: 72,
            decoration: const BoxDecoration(
              color: const Color(0xff1e2020),
              border: Border(
                top: BorderSide(color: Color(0xff434656), width: 1.0),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(Icons.local_taxi, 'Ride', false, onRideTap),
                _buildNavItem(Icons.history, 'Activity', false, onActivityTap),
                _buildNavItem(Icons.person, 'Account', true, () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAccountTile(IconData icon, String title, String subtitle) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12.0),
      decoration: BoxDecoration(
        color: const Color(0xff1e2020),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xff434656).withOpacity(0.2)),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: const Color(0xff434656).withOpacity(0.2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: const Color(0xffb8c3ff)),
        ),
        title: Text(
          title,
          style: GoogleFonts.inter(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: const Color(0xffe2e2e2),
          ),
        ),
        subtitle: Text(
          subtitle,
          style: GoogleFonts.inter(
            fontSize: 12,
            color: const Color(0xffc4c5d9).withOpacity(0.7),
          ),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 14, color: Color(0xffc4c5d9)),
        onTap: () {},
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, bool isActive, VoidCallback onTap) {
    final color = isActive ? const Color(0xff2e5bff) : const Color(0xffc4c5d9);
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: 80,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color),
            const SizedBox(height: 4),
            Text(
              label,
              style: GoogleFonts.inter(
                fontSize: 12,
                color: color,
                fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
