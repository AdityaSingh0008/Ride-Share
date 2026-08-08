import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ActivityScreen extends StatelessWidget {
  final VoidCallback onRideTap;
  final VoidCallback onAccountTap;

  const ActivityScreen({
    Key? key,
    required this.onRideTap,
    required this.onAccountTap,
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
          'Your Activity',
          style: GoogleFonts.inter(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: const Color(0xffb8c3ff),
          ),
        ),
      ),
      body: Column(
        children: [
          // List of activities
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
              children: [
                _buildActivityCard(
                  driverName: 'Alex',
                  carModel: 'Tesla Model 3',
                  dateTime: 'Yesterday, 9:30 PM',
                  price: 18.00,
                  icon: Icons.electric_car,
                  isCompleted: true,
                ),
                _buildActivityCard(
                  driverName: 'Sarah',
                  carModel: 'Toyota Camry',
                  dateTime: '5 Aug 2026, 3:15 PM',
                  price: 12.50,
                  icon: Icons.directions_car,
                  isCompleted: true,
                ),
                _buildActivityCard(
                  driverName: 'David',
                  carModel: 'BMW 5 Series',
                  dateTime: '1 Aug 2026, 11:00 AM',
                  price: 25.00,
                  icon: Icons.local_taxi,
                  isCompleted: true,
                ),
                _buildActivityCard(
                  driverName: 'Emma',
                  carModel: 'Nissan Leaf',
                  dateTime: '28 Jul 2026, 8:45 AM',
                  price: 14.20,
                  icon: Icons.directions_car,
                  isCompleted: true,
                ),
              ],
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
                _buildNavItem(Icons.history, 'Activity', true, () {}),
                _buildNavItem(Icons.person, 'Account', false, onAccountTap),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActivityCard({
    required String driverName,
    required String carModel,
    required String dateTime,
    required double price,
    required IconData icon,
    required bool isCompleted,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: const Color(0xff1e2020),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xff434656).withOpacity(0.3)),
      ),
      child: Row(
        children: [
          // Icon representation
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: const Color(0xff2e5bff).withOpacity(0.15),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: const Color(0xffb8c3ff), size: 24),
          ),
          const SizedBox(width: 16),
          // Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ride with $driverName',
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xffe2e2e2),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  carModel,
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    color: const Color(0xffc4c5d9),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  dateTime,
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    color: const Color(0xffc4c5d9).withOpacity(0.6),
                  ),
                ),
              ],
            ),
          ),
          // Price and status
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '\$${price.toStringAsFixed(2)}',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 6),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  'Completed',
                  style: GoogleFonts.inter(
                    fontSize: 10,
                    color: Colors.greenAccent,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ],
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
