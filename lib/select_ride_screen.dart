import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RideOption {
  final String title;
  final String eta;
  final double price;
  final String iconUrl;
  final int capacity;

  const RideOption({
    required this.title,
    required this.eta,
    required this.price,
    required this.iconUrl,
    required this.capacity,
  });
}

class SelectRideScreen extends StatefulWidget {
  final VoidCallback onBack;
  final VoidCallback onConfirmRide;

  const SelectRideScreen({
    Key? key,
    required this.onBack,
    required this.onConfirmRide,
  }) : super(key: key);

  @override
  _SelectRideScreenState createState() => _SelectRideScreenState();
}

class _SelectRideScreenState extends State<SelectRideScreen> {
  int _selectedIndex = 1; // Default to Comfort

  final List<RideOption> _options = const [
    RideOption(
      title: 'Economy',
      eta: '3 min away • 12:45 PM',
      price: 12.50,
      capacity: 4,
      iconUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuB2vL0SV8RJxtoKXuej2FPnSvlrW_U4qu-k4Tm00xwaDuVj9k6GMX6Y8Hx4pWOhBKZX07zTBAcDLtmRrA2UYNnGjFoAyK-T9Ye5o4S_hlkIy8zO454P32etJ2NJGfzf2XxB0s_E7jPJJh0dkwQSBcVEQAVDkxEvyustzwlfOv1WD9GhYLZss053tLwtBcNTKyDIAGfWWX0efU_0WrEAF4Rrb1G190ZLyH1LMPP_XXAMjaFqjQfrY844',
    ),
    RideOption(
      title: 'Comfort',
      eta: '4 min away • Extra legroom',
      price: 18.00,
      capacity: 4,
      iconUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuBh-yHI3TQbkVQx4BFSB6iX8UYkNyBpdf85EPBQx9E0PSrHOEOGkwjSVUTYbrvKPoVLsRHlZIBP0LPboEfcaWBpUtqP9k9mlnC_rPZATYxuq7bd07cK9OoOFtisyrNL9sRliPpheo_rf-f5TMrTpGXxQPbAs3bjY5eSD1vK4fwRVcGxYwiOB2AgZbemT9SQDVHviRmPP4_vjicnW4bcHSVjoVhbe1L35sle5njZVGN7Mu7bCBgnLyuP',
    ),
    RideOption(
      title: 'Premium',
      eta: '6 min away • Top-rated',
      price: 25.00,
      capacity: 4,
      iconUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuAi4tZn11JC--v7IG80ld4RBwrXo-0qy_s3y6GBBZ3LZHL-UIB7a0PvxMfWiHV37BE8EJ3DTaI1Z4F3AYUFs3dY2JNV28GqtBceXrw1lCG-6pJ46is8Zfd8vLY9S02HT_uVLJVzZXomJz-y3EHgGpo-vh3Qr4MRZ7P-Q3irXbimWVw8rHsalV3CIBjg9uYoifXz77DsYMAaYToEf-kjZOKgDJbOyZw3kx32sD_JBi20OvWniFR31L4J',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final selectedRide = _options[_selectedIndex];

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
                  // Back Button (Menu Icon formatted as menu/back)
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
                      onPressed: widget.onBack,
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
                          'https://lh3.googleusercontent.com/aida-public/AB6AXuAO9V8o5ZEUnAUVDMYekaYs9bBRJAokLyWHg5kXstPiHnxRXcxTj2paLGHTEEjQDuGxgKAiX-FEQEuUY3WMjzGTh-HZn8B7u4o959qg6R2KBOhhHyGJSecPfJ1CwGaNxBUIT7g8z1RGgRgGvxU1o8820SPJ0w4JxUqRVjWn3LFTJNAkjlbA3iXCuHVKSAV20FOWyVhsNr1IqtsRAJCv2xfhua4UkJ1DWm5r3xbY49XUuum3l3UD0WpE',
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

        // Bottom Sheet (Ride Options)
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(20.0, 12.0, 20.0, 24.0),
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
                    width: 48,
                    height: 4,
                    decoration: BoxDecoration(
                      color: const Color(0xffc4c5d9).withOpacity(0.5),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Choose a ride',
                  style: GoogleFonts.inter(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xffe2e2e2),
                  ),
                ),
                const SizedBox(height: 12),

                // Ride options list
                Column(
                  children: List.generate(_options.length, (index) {
                    final opt = _options[index];
                    final isSelected = index == _selectedIndex;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedIndex = index;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 12.0),
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: const Color(0xff1e2020),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: isSelected ? const Color(0xff2e5bff) : const Color(0xff434656),
                            width: isSelected ? 2.0 : 1.0,
                          ),
                          boxShadow: isSelected
                              ? [
                                  BoxShadow(
                                    color: const Color(0xff2e5bff).withOpacity(0.15),
                                    blurRadius: 12,
                                  )
                                ]
                              : null,
                        ),
                        child: Row(
                          children: [
                            // Vehicle Photo
                            Image.network(
                              opt.iconUrl,
                              width: 64,
                              height: 48,
                              fit: BoxFit.contain,
                              errorBuilder: (context, error, stackTrace) => const Icon(
                                Icons.directions_car,
                                color: Color(0xffc4c5d9),
                                size: 48,
                              ),
                            ),
                            const SizedBox(width: 16),
                            // Details
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        opt.title,
                                        style: GoogleFonts.inter(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                          color: isSelected ? const Color(0xff2e5bff) : const Color(0xffe2e2e2),
                                        ),
                                      ),
                                      const SizedBox(width: 6),
                                      const Icon(Icons.person, size: 16, color: Color(0xffc4c5d9)),
                                      const SizedBox(width: 2),
                                      Text(
                                        '${opt.capacity}',
                                        style: GoogleFonts.inter(
                                          fontSize: 14,
                                          color: const Color(0xffc4c5d9),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    opt.eta,
                                    style: GoogleFonts.inter(
                                      fontSize: 14,
                                      color: const Color(0xffc4c5d9),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Price
                            Text(
                              '\$${opt.price.toStringAsFixed(2)}',
                              style: GoogleFonts.inter(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: isSelected ? const Color(0xff2e5bff) : const Color(0xffe2e2e2),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),

                // Payment Divider
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(color: Color(0xff434656), width: 0.5),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.credit_card, color: Color(0xffc4c5d9)),
                          const SizedBox(width: 8),
                          Text(
                            '•••• 4242',
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              color: const Color(0xffc4c5d9),
                            ),
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Change',
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xff2e5bff),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Confirm button
                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff2e5bff),
                      elevation: 8,
                      shadowColor: const Color(0xff2e5bff).withOpacity(0.4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: widget.onConfirmRide,
                    child: Text(
                      'Confirm ${selectedRide.title}',
                      style: GoogleFonts.inter(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
