import 'dart:math' as math;
import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class CustomMap extends StatefulWidget {
  final bool showRoute;
  final bool isLiveTracking;
  final double animationProgress;

  const CustomMap({
    Key? key,
    this.showRoute = false,
    this.isLiveTracking = false,
    this.animationProgress = 0.0,
  }) : super(key: key);

  @override
  _CustomMapState createState() => _CustomMapState();
}

class _CustomMapState extends State<CustomMap> with SingleTickerProviderStateMixin {
  late AnimationController _pulseController;
  final List<SimulatedCar> _cars = [];
  final math.Random _random = math.Random();

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();

    // Generate random cars
    for (int i = 0; i < 5; i++) {
      _cars.add(SimulatedCar(
        xRatio: 0.15 + _random.nextDouble() * 0.7,
        yRatio: 0.15 + _random.nextDouble() * 0.7,
        rotation: _random.nextDouble() * 2 * math.pi,
        speed: 0.01 + _random.nextDouble() * 0.02,
      ));
    }

    // Periodically update cars to make the map feel alive
    _pulseController.addListener(() {
      if (mounted) {
        setState(() {
          for (var car in _cars) {
            car.update();
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff121414), // Deep obsidian background
      child: CustomPaint(
        painter: MapPainter(
          showRoute: widget.showRoute,
          isLiveTracking: widget.isLiveTracking,
          progress: widget.animationProgress,
          pulseValue: _pulseController.value,
          cars: _cars,
        ),
        child: Container(),
      ),
    );
  }
}

class SimulatedCar {
  double xRatio;
  double yRatio;
  double rotation;
  double speed;
  int steps = 0;

  SimulatedCar({
    required this.xRatio,
    required this.yRatio,
    required this.rotation,
    required this.speed,
  });

  void update() {
    steps++;
    // Gently move the car forward in its direction
    xRatio += math.cos(rotation) * speed * 0.01;
    yRatio += math.sin(rotation) * speed * 0.01;

    // Boundary check and redirection
    if (xRatio < 0.05 || xRatio > 0.95 || yRatio < 0.05 || yRatio > 0.95) {
      rotation += math.pi; // turn around
    }

    // Gently drift heading
    if (steps % 30 == 0) {
      rotation += (math.Random().nextDouble() - 0.5) * 0.5;
    }
  }
}

class MapPainter extends CustomPainter {
  final bool showRoute;
  final bool isLiveTracking;
  final double progress;
  final double pulseValue;
  final List<SimulatedCar> cars;

  MapPainter({
    required this.showRoute,
    required this.isLiveTracking,
    required this.progress,
    required this.pulseValue,
    required this.cars,
  });

  @override
  void paint(Canvas canvas, Size size) {
    _drawGrid(canvas, size);
    _drawStreets(canvas, size);
    _drawSimulatedCars(canvas, size);

    if (showRoute) {
      _drawRoute(canvas, size);
    }
  }

  void _drawGrid(Canvas canvas, Size size) {
    final gridPaint = Paint()
      ..color = const Color(0xff2e5bff).withOpacity(0.04)
      ..strokeWidth = 1.0;

    const double spacing = 30.0;

    // Draw vertical lines
    for (double x = 0; x < size.width; x += spacing) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), gridPaint);
    }

    // Draw horizontal lines
    for (double y = 0; y < size.height; y += spacing) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), gridPaint);
    }
  }

  void _drawStreets(Canvas canvas, Size size) {
    // Draw abstract dark grey roads to resemble a real map grid
    final streetPaint = Paint()
      ..color = const Color(0xff1a1c1c)
      ..strokeWidth = 12.0
      ..strokeCap = StrokeCap.round;

    final outlinePaint = Paint()
      ..color = const Color(0xff282a2b)
      ..strokeWidth = 14.0
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    void drawRoad(Path path) {
      canvas.drawPath(path, outlinePaint);
      canvas.drawPath(path, streetPaint);
    }

    // Define some grid roads
    final r1 = Path()..moveTo(0, size.height * 0.2)..lineTo(size.width, size.height * 0.25);
    final r2 = Path()..moveTo(0, size.height * 0.5)..lineTo(size.width, size.height * 0.48);
    final r3 = Path()..moveTo(0, size.height * 0.8)..lineTo(size.width, size.height * 0.78);

    final c1 = Path()..moveTo(size.width * 0.25, 0)..lineTo(size.width * 0.2, size.height);
    final c2 = Path()..moveTo(size.width * 0.55, 0)..lineTo(size.width * 0.6, size.height);
    final c3 = Path()..moveTo(size.width * 0.8, 0)..lineTo(size.width * 0.85, size.height);

    drawRoad(r1);
    drawRoad(r2);
    drawRoad(r3);
    drawRoad(c1);
    drawRoad(c2);
    drawRoad(c3);
  }

  void _drawSimulatedCars(Canvas canvas, Size size) {
    final carPaint = Paint()
      ..color = const Color(0xffc4c5d9).withOpacity(0.6)
      ..style = PaintingStyle.fill;

    for (var car in cars) {
      final pos = Offset(car.xRatio * size.width, car.yRatio * size.height);
      
      canvas.save();
      canvas.translate(pos.dx, pos.dy);
      canvas.rotate(car.rotation);
      
      // Draw a tiny car shape
      final path = Path()
        ..moveTo(-6, -3)
        ..lineTo(6, -3)
        ..lineTo(8, 0)
        ..lineTo(6, 3)
        ..lineTo(-6, 3)
        ..close();
      
      canvas.drawPath(path, carPaint);
      canvas.restore();
    }
  }

  void _drawRoute(Canvas canvas, Size size) {
    // Determine start and end points
    final Offset start = Offset(size.width * 0.3, size.height * 0.7);
    final Offset end = Offset(size.width * 0.7, size.height * 0.35);

    // Create a bezier path for the route
    final routePath = Path()
      ..moveTo(start.dx, start.dy)
      ..cubicTo(
        size.width * 0.1, size.height * 0.55, // Control point 1
        size.width * 0.9, size.height * 0.5,  // Control point 2
        end.dx, end.dy,
      );

    // Draw route glow
    final glowPaint = Paint()
      ..color = const Color(0xff2e5bff).withOpacity(0.15)
      ..strokeWidth = 10.0
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 6.0);

    canvas.drawPath(routePath, glowPaint);

    // Draw main route stroke
    final routePaint = Paint()
      ..color = const Color(0xff2e5bff)
      ..strokeWidth = 4.0
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawPath(routePath, routePaint);

    // Draw Pickup Marker (White circle with electric blue dot inside)
    final pickupOuterPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    final pickupInnerPaint = Paint()
      ..color = const Color(0xff2e5bff)
      ..style = PaintingStyle.fill;

    // Draw animated halo for pickup
    final pickupPulsePaint = Paint()
      ..color = const Color(0xff2e5bff).withOpacity(0.2 * (1.0 - pulseValue))
      ..style = PaintingStyle.fill;
    canvas.drawCircle(start, 24.0 * pulseValue, pickupPulsePaint);

    canvas.drawCircle(start, 8.0, pickupOuterPaint);
    canvas.drawCircle(start, 4.0, pickupInnerPaint);

    // Draw Destination Pin (Electric Blue Pin)
    final destPinPaint = Paint()
      ..color = const Color(0xff2e5bff)
      ..style = PaintingStyle.fill;

    // Draw pin drop-shadow
    final pinShadowPaint = Paint()
      ..color = Colors.black.withOpacity(0.4)
      ..style = PaintingStyle.fill
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 2.0);
    canvas.drawOval(Rect.fromCenter(center: Offset(end.dx, end.dy + 2), width: 8, height: 4), pinShadowPaint);

    final Path pinPath = Path()
      ..moveTo(end.dx, end.dy)
      ..cubicTo(end.dx - 6, end.dy - 12, end.dx - 8, end.dy - 16, end.dx - 8, end.dy - 22)
      ..arcToPoint(Offset(end.dx + 8, end.dy - 22), radius: const Radius.circular(8))
      ..cubicTo(end.dx + 8, end.dy - 16, end.dx + 6, end.dy - 12, end.dx, end.dy)
      ..close();

    canvas.drawPath(pinPath, destPinPaint);

    // Dot inside pin
    canvas.drawCircle(Offset(end.dx, end.dy - 22), 3.0, pickupOuterPaint);

    // Draw animating car along route if in Live Tracking mode
    if (isLiveTracking) {
      ui.PathMetrics pathMetrics = routePath.computeMetrics();
      for (ui.PathMetric pathMetric in pathMetrics) {
        // Find tangent at the specific progress along the path
        ui.Tangent? tangent = pathMetric.getTangentForOffset(pathMetric.length * progress);
        if (tangent != null) {
          final carPos = tangent.position;
          final carAngle = -tangent.angle; // Adjust direction

          // Draw halo
          final carHaloPaint = Paint()
            ..color = const Color(0xff2e5bff).withOpacity(0.25)
            ..style = PaintingStyle.fill
            ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 4.0);
          canvas.drawCircle(carPos, 14.0, carHaloPaint);

          // Draw white background disc
          final carDiscPaint = Paint()
            ..color = const Color(0xff121414)
            ..style = PaintingStyle.fill;
          canvas.drawCircle(carPos, 10.0, carDiscPaint);

          // Draw blue border
          final carBorderPaint = Paint()
            ..color = const Color(0xff2e5bff)
            ..strokeWidth = 1.5
            ..style = PaintingStyle.stroke;
          canvas.drawCircle(carPos, 10.0, carBorderPaint);

          // Draw car icon shape inside
          canvas.save();
          canvas.translate(carPos.dx, carPos.dy);
          canvas.rotate(carAngle);

          final carIconPaint = Paint()
            ..color = const Color(0xff2e5bff)
            ..style = PaintingStyle.fill;

          final carIconPath = Path()
            ..moveTo(-4, -2)
            ..lineTo(4, -2)
            ..lineTo(5, 0)
            ..lineTo(4, 2)
            ..lineTo(-4, 2)
            ..close();

          canvas.drawPath(carIconPath, carIconPaint);
          canvas.restore();
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant MapPainter oldDelegate) {
    return oldDelegate.showRoute != showRoute ||
        oldDelegate.isLiveTracking != isLiveTracking ||
        oldDelegate.progress != progress ||
        oldDelegate.pulseValue != pulseValue ||
        oldDelegate.cars != cars;
  }
}
