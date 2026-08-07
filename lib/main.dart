import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'custom_map.dart';
import 'home_screen.dart';
import 'select_ride_screen.dart';
import 'live_tracking_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Lock orientation to portrait and configure status bar style
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Color(0xff121414),
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );
  runApp(const RideShareApp());
}

class RideShareApp extends StatelessWidget {
  const RideShareApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lumina Velocity RideShare',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xff121414),
        primaryColor: const Color(0xff2e5bff),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xff2e5bff),
          secondary: Color(0xffb8c3ff),
          surface: Color(0xff121414),
          background: const Color(0xff121414),
          error: Color(0xffffb4ab),
        ),
      ),
      home: const MainNavigationCoordinator(),
    );
  }
}

enum AppState {
  home,
  selectRide,
  liveTracking,
}

class MainNavigationCoordinator extends StatefulWidget {
  const MainNavigationCoordinator({Key? key}) : super(key: key);

  @override
  _MainNavigationCoordinatorState createState() => _MainNavigationCoordinatorState();
}

class _MainNavigationCoordinatorState extends State<MainNavigationCoordinator>
    with SingleTickerProviderStateMixin {
  AppState _currentState = AppState.home;
  late AnimationController _carAnimationController;

  @override
  void initState() {
    super.initState();
    _carAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    );
  }

  @override
  void dispose() {
    _carAnimationController.dispose();
    super.dispose();
  }

  void _navigateTo(AppState state) {
    setState(() {
      _currentState = state;
    });

    if (state == AppState.liveTracking) {
      _carAnimationController.forward(from: 0.0);
      _carAnimationController.repeat();
    } else {
      _carAnimationController.stop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: _carAnimationController,
        builder: (context, child) {
          return Stack(
            children: [
              // 1. Persistent Map Area (Dynamic based on State)
              Positioned.fill(
                child: CustomMap(
                  showRoute: _currentState != AppState.home,
                  isLiveTracking: _currentState == AppState.liveTracking,
                  animationProgress: _carAnimationController.value,
                ),
              ),

              // 2. Active Screen Overlay (using slide/fade/crossfade animations)
              Positioned.fill(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  transitionBuilder: (Widget child, Animation<double> animation) {
                    return FadeTransition(
                      opacity: animation,
                      child: SlideTransition(
                        position: Tween<Offset>(
                          begin: const Offset(0.0, 0.05),
                          end: Offset.zero,
                        ).animate(animation),
                        child: child,
                      ),
                    );
                  },
                  child: _buildCurrentScreen(),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildCurrentScreen() {
    switch (_currentState) {
      case AppState.home:
        return HomeScreen(
          key: const ValueKey('HomeScreen'),
          onDestinationSelected: () => _navigateTo(AppState.selectRide),
        );
      case AppState.selectRide:
        return SelectRideScreen(
          key: const ValueKey('SelectRideScreen'),
          onBack: () => _navigateTo(AppState.home),
          onConfirmRide: () => _navigateTo(AppState.liveTracking),
        );
      case AppState.liveTracking:
        return LiveTrackingScreen(
          key: const ValueKey('LiveTrackingScreen'),
          onCancel: () => _navigateTo(AppState.selectRide),
        );
    }
  }
}
