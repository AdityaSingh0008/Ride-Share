import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  final VoidCallback onDestinationSelected;
  final VoidCallback onActivityTap;
  final VoidCallback onAccountTap;

  const HomeScreen({
    Key? key,
    required this.onDestinationSelected,
    required this.onActivityTap,
    required this.onAccountTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Top Bar
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Menu Button
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: const Color(0xff1e2020).withOpacity(0.8),
                      shape: BoxShape.circle,
                      border: Border.all(color: const Color(0xff434656), width: 1),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.menu, color: Color(0xffb8c3ff)),
                      onPressed: () {},
                    ),
                  ),
                  // Title
                  Text(
                    'RideShare',
                    style: GoogleFonts.inter(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xffb8c3ff),
                    ),
                  ),
                  // Profile Photo
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: const Color(0xff434656), width: 1),
                      image: const DecorationImage(
                        image: NetworkImage(
                          'https://lh3.googleusercontent.com/aida-public/AB6AXuBnMylpzLuWgHbrJW_XOPctNBDasPlY7Eg0BjR2_tnNo-AqoO5xliee7VVS_AzyASS2MjEwRdAF1Ms6ffWHqa51GZhilLYqU2uQR4hbNweJXmvs5lBTOe6vDrMFUpl5UKM5oRIPYeVHPVm88QAZhXyllm5rkNFeJc_wIM57INBlFSfYjiXBR0Oj9iZpT3xfGFVGcHD8RymRLW45iUVb2PMG88O-DnyctlZBfmisO9MppscXNNpxxYAz',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        // Bottom Sheet (Where to?)
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Sliding Sheet Container
              Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(20.0, 12.0, 20.0, 32.0),
                decoration: const BoxDecoration(
                  color: Color(0xff121414),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24.0),
                    topRight: Radius.circular(24.0),
                  ),
                  border: Border(
                    top: BorderSide(color: Color(0xff434656), width: 1.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54,
                      offset: Offset(0, -8),
                      blurRadius: 24,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Grab Handle
                    Center(
                      child: Container(
                        width: 40,
                        height: 4,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Where to?',
                      style: GoogleFonts.inter(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xffe2e2e2),
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Search Input (Simulated button or active text field)
                    GestureDetector(
                      onTap: onDestinationSelected,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                        decoration: BoxDecoration(
                          color: const Color(0xff1e2020),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: const Color(0xff434656)),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.search, color: Color(0xffc4c5d9)),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                'Enter destination',
                                style: GoogleFonts.inter(
                                  fontSize: 16,
                                  color: const Color(0xffc4c5d9).withOpacity(0.5),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    // Quick Shortcuts
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          _buildShortcutChip(
                            icon: Icons.home,
                            label: 'Home',
                            onTap: onDestinationSelected,
                          ),
                          const SizedBox(width: 12),
                          _buildShortcutChip(
                            icon: Icons.work,
                            label: 'Work',
                            onTap: onDestinationSelected,
                          ),
                          const SizedBox(width: 12),
                          _buildShortcutChip(
                            icon: Icons.schedule,
                            label: 'Schedule',
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Bottom Navigation Bar
              Container(
                height: 72,
                decoration: const BoxDecoration(
                  color: Color(0xff1e2020),
                  border: Border(
                    top: BorderSide(color: Color(0xff434656), width: 1.0),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildNavItem(Icons.local_taxi, 'Ride', true, () {}),
                    _buildNavItem(Icons.history, 'Activity', false, onActivityTap),
                    _buildNavItem(Icons.person, 'Account', false, onAccountTap),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildShortcutChip({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: const Color(0xff282a2b),
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: const Color(0xff434656)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: const Color(0xffb8c3ff), size: 18),
            const SizedBox(width: 8),
            Text(
              label,
              style: GoogleFonts.inter(
                fontSize: 14,
                color: const Color(0xffe2e2e2),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
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
