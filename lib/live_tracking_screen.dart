import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LiveTrackingScreen extends StatelessWidget {
  final VoidCallback onCancel;

  const LiveTrackingScreen({
    Key? key,
    required this.onCancel,
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
                  // Back / Cancel Button
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: const Color(0xff1e2020).withOpacity(0.8),
                      shape: BoxShape.circle,
                      border: Border.all(color: const Color(0xff434656), width: 1),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back, color: Color(0xffb8c3ff)),
                      onPressed: onCancel,
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
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: const Color(0xff434656), width: 1),
                      image: const DecorationImage(
                        image: NetworkImage(
                          'https://lh3.googleusercontent.com/aida-public/AB6AXuCbcyVhVjSidFNDhyQJBAJ7jcw5HAD6yDnNTygepQL_0271tkJ5LGMgtpV7po6xLZJd9rLtzMRi6uHRNgYdB7cLuU--CKMz96WM3LB4Tu9Jn_RniERjeY9hK-hBU1UXkOn8_ZjiW_LWcdmxvibE5DQ97BafE3unAV24U-utMYi6oSpxFALvz-Weec_8PvWI-8zD7wCUEDdVR5VzxmdR_FZF0xU2eHpXut5H_3yDp5_Q3Ic1_XxgWKtT',
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

        // Bottom Sheet (Driver Details)
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(20.0, 12.0, 20.0, 32.0),
            decoration: const BoxDecoration(
              color: Color(0xff121414), // Dark obsidian surface
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
              mainAxisSize: MainAxisSize.min,
              children: [
                // Grab Handle
                Center(
                  child: Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: const Color(0xffc4c5d9).withOpacity(0.5),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Status Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Arriving in 4 min',
                      style: GoogleFonts.inter(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xffe2e2e2),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: const Color(0xff2e5bff).withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: const Color(0xff2e5bff).withOpacity(0.5)),
                      ),
                      child: Text(
                        'ON TIME',
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xffb8c3ff),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Driver & Vehicle Details Card
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: const Color(0xff1e2020),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xff434656).withOpacity(0.3)),
                  ),
                  child: Row(
                    children: [
                      // Driver Avatar
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            width: 56,
                            height: 56,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: const Color(0xff434656), width: 1.5),
                              image: const DecorationImage(
                                image: NetworkImage(
                                  'https://lh3.googleusercontent.com/aida-public/AB6AXuBVe3fBPHivpxwsW5dnZiAueC9hXsjGKcLeRqyymqhBlLZ2m2Q69C5dTWfGNOHLwp6Hk1q9JhdO5X260VNAQeKewztH-EC0JzKdOJehmZX6PCWZb52G9aoOWrTZF_cL0oI1pIL3h4Ji7k_obKocmWplvm98ExNYy8eq5HA4VPCN8TPC-xjyp6O2Xlxjjx6MZRF_aFDzryEgN_lVczJ9DO8-ErQiAEMPY3qJEnMOM-wXCPoQ4FHwPam0',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: -4,
                            right: -4,
                            child: Container(
                              padding: const EdgeInsets.all(3.0),
                              decoration: BoxDecoration(
                                color: const Color(0xff121414),
                                shape: BoxShape.circle,
                                border: Border.all(color: const Color(0xff434656)),
                              ),
                              child: Text(
                                '4.9',
                                style: GoogleFonts.inter(
                                  fontSize: 8,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xffb8c3ff),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 16),
                      // Details
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Alex',
                              style: GoogleFonts.inter(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xffe2e2e2),
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Tesla Model 3 • ABC-1234',
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                color: const Color(0xffc4c5d9),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                // Quick Actions
                Row(
                  children: [
                    // CALL button
                    Expanded(
                      child: SizedBox(
                        height: 48,
                        child: OutlinedButton.icon(
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Color(0xff2e5bff)),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  backgroundColor: const Color(0xff1e2020),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    side: const BorderSide(color: Color(0xff434656)),
                                  ),
                                  title: Text(
                                    'Calling Driver',
                                    style: GoogleFonts.inter(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  content: Row(
                                    children: [
                                      const Icon(Icons.phone_in_talk, color: Color(0xffb8c3ff)),
                                      const SizedBox(width: 16),
                                      Text(
                                        'Calling Alex (+1 555-0199)...',
                                        style: GoogleFonts.inter(color: const Color(0xffe2e2e2)),
                                      ),
                                    ],
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.of(context).pop(),
                                      child: Text(
                                        'Cancel',
                                        style: GoogleFonts.inter(color: Colors.red),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          icon: const Icon(Icons.call, color: Color(0xffb8c3ff), size: 20),
                          label: Text(
                            'CALL',
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xffb8c3ff),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    // MESSAGE button
                    Expanded(
                      child: SizedBox(
                        height: 48,
                        child: OutlinedButton.icon(
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Color(0xff2e5bff)),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  backgroundColor: const Color(0xff1e2020),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    side: const BorderSide(color: Color(0xff434656)),
                                  ),
                                  title: Row(
                                    children: [
                                      const CircleAvatar(
                                        backgroundImage: NetworkImage(
                                          'https://lh3.googleusercontent.com/aida-public/AB6AXuBVe3fBPHivpxwsW5dnZiAueC9hXsjGKcLeRqyymqhBlLZ2m2Q69C5dTWfGNOHLwp6Hk1q9JhdO5X260VNAQeKewztH-EC0JzKdOJehmZX6PCWZb52G9aoOWrTZF_cL0oI1pIL3h4Ji7k_obKocmWplvm98ExNYy8eq5HA4VPCN8TPC-xjyp6O2Xlxjjx6MZRF_aFDzryEgN_lVczJ9DO8-ErQiAEMPY3qJEnMOM-wXCPoQ4FHwPam0',
                                        ),
                                        radius: 16,
                                      ),
                                      const SizedBox(width: 12),
                                      Text(
                                        'Chat with Alex',
                                        style: GoogleFonts.inter(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(12),
                                        decoration: BoxDecoration(
                                          color: const Color(0xff282a2b),
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: Text(
                                          'Alex: Hello! I have arrived at the pickup location. I am waiting near the main entrance.',
                                          style: GoogleFonts.inter(color: const Color(0xffe2e2e2)),
                                        ),
                                      ),
                                    ],
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(
                                            backgroundColor: const Color(0xff2e5bff),
                                            content: Text(
                                              'Message sent: "Okay, I\'m coming!"',
                                              style: GoogleFonts.inter(color: Colors.white),
                                            ),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        'Reply: "I\'m coming!"',
                                        style: GoogleFonts.inter(color: const Color(0xffb8c3ff)),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () => Navigator.of(context).pop(),
                                      child: Text(
                                        'Close',
                                        style: GoogleFonts.inter(color: const Color(0xffc4c5d9)),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          icon: const Icon(Icons.chat, color: Color(0xffb8c3ff), size: 20),
                          label: Text(
                            'MESSAGE',
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xffb8c3ff),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    // More Button
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: const Color(0xff1e2020),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: const Color(0xff434656).withOpacity(0.5)),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.more_horiz, color: Color(0xffc4c5d9)),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
