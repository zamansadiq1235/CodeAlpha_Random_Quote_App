import 'package:flutter/material.dart';

enum SplashPhase { idle, logo, text, tagline, holding, exiting, done }

class SplashViewModel extends ChangeNotifier {
  // ── Animation Controllers 

  late final AnimationController logoController;
  late final AnimationController textController;
  late final AnimationController taglineController;
  late final AnimationController dotsController;
  late final AnimationController exitController;

  // ── Logo Animations 

  late final Animation<double> logoScale;
  late final Animation<double> logoOpacity;
  late final Animation<double> logoRotate;

  // ── Ornament Animations 

  late final Animation<double> lineWidth;
  late final Animation<double> lineOpacity;

  // ── Text Animations 

  late final Animation<double> titleOpacity;
  late final Animation<Offset> titleSlide;
  late final Animation<double> subtitleOpacity;
  late final Animation<Offset> subtitleSlide;

  // ── Tagline Animations 

  late final Animation<double> taglineOpacity;
  late final Animation<Offset> taglineSlide;

  // ── Dots Animations 

  late final Animation<double> dot1Opacity;
  late final Animation<double> dot2Opacity;
  late final Animation<double> dot3Opacity;

  // ── Exit Animations 

  late final Animation<double> exitOpacity;
  late final Animation<double> exitScale;

  // ── State 

  SplashPhase _phase = SplashPhase.idle;
  SplashPhase get phase => _phase;
  bool get isReadyToNavigate => _phase == SplashPhase.done;

  // ── Initialise ───────────────────────────────────────────────────────────────

  void init(TickerProvider vsync) {
    _setupControllers(vsync);
    _setupAnimations();
  }

  void _setupControllers(TickerProvider vsync) {
    logoController = AnimationController(
      vsync: vsync,
      duration: const Duration(milliseconds: 900),
    );
    textController = AnimationController(
      vsync: vsync,
      duration: const Duration(milliseconds: 700),
    );
    taglineController = AnimationController(
      vsync: vsync,
      duration: const Duration(milliseconds: 600),
    );
    dotsController = AnimationController(
      vsync: vsync,
      duration: const Duration(milliseconds: 1200),
    )..repeat();
    exitController = AnimationController(
      vsync: vsync,
      duration: const Duration(milliseconds: 600),
    );
  }

  void _setupAnimations() {
    // Logo
    logoScale = Tween<double>(begin: 0.4, end: 1.0).animate(
      CurvedAnimation(parent: logoController, curve: Curves.elasticOut),
    );
    logoOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: logoController,
        curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
      ),
    );
    logoRotate = Tween<double>(begin: -0.05, end: 0.0).animate(
      CurvedAnimation(parent: logoController, curve: Curves.easeOutCubic),
    );

    // Ornament line
    lineWidth = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: logoController,
        curve: const Interval(0.5, 1.0, curve: Curves.easeOut),
      ),
    );
    lineOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: logoController,
        curve: const Interval(0.5, 0.8, curve: Curves.easeOut),
      ),
    );

    // Text
    titleOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: textController,
        curve: const Interval(0.0, 0.6, curve: Curves.easeOut),
      ),
    );
    titleSlide =
        Tween<Offset>(begin: const Offset(0, 0.5), end: Offset.zero).animate(
      CurvedAnimation(parent: textController, curve: Curves.easeOutCubic),
    );
    subtitleOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: textController,
        curve: const Interval(0.3, 1.0, curve: Curves.easeOut),
      ),
    );
    subtitleSlide =
        Tween<Offset>(begin: const Offset(0, 0.4), end: Offset.zero).animate(
      CurvedAnimation(
        parent: textController,
        curve: const Interval(0.3, 1.0, curve: Curves.easeOutCubic),
      ),
    );

    // Tagline
    taglineOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: taglineController, curve: Curves.easeOut),
    );
    taglineSlide =
        Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero).animate(
      CurvedAnimation(parent: taglineController, curve: Curves.easeOutCubic),
    );

    // Dots
    dot1Opacity = Tween<double>(begin: 0.2, end: 1.0).animate(
      CurvedAnimation(
        parent: dotsController,
        curve: const Interval(0.0, 0.33, curve: Curves.easeInOut),
      ),
    );
    dot2Opacity = Tween<double>(begin: 0.2, end: 1.0).animate(
      CurvedAnimation(
        parent: dotsController,
        curve: const Interval(0.2, 0.53, curve: Curves.easeInOut),
      ),
    );
    dot3Opacity = Tween<double>(begin: 0.2, end: 1.0).animate(
      CurvedAnimation(
        parent: dotsController,
        curve: const Interval(0.4, 0.73, curve: Curves.easeInOut),
      ),
    );

    // Exit
    exitOpacity = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(parent: exitController, curve: Curves.easeIn),
    );
    exitScale = Tween<double>(begin: 1.0, end: 1.06).animate(
      CurvedAnimation(parent: exitController, curve: Curves.easeIn),
    );
  }

  // ── Sequence ─────────────────────────────────────────────────────────────────

  Future<void> startSequence() async {
    _setPhase(SplashPhase.logo);
    await Future.delayed(const Duration(milliseconds: 200));
    logoController.forward();

    await Future.delayed(const Duration(milliseconds: 600));
    _setPhase(SplashPhase.text);
    textController.forward();

    await Future.delayed(const Duration(milliseconds: 500));
    _setPhase(SplashPhase.tagline);
    taglineController.forward();

    await Future.delayed(const Duration(milliseconds: 1200));
    _setPhase(SplashPhase.exiting);
    dotsController.stop();
    await exitController.forward();

    _setPhase(SplashPhase.done);
  }

  void _setPhase(SplashPhase phase) {
    _phase = phase;
    notifyListeners();
  }

  // ── Listenable merge for AnimatedBuilder 

  Listenable get allAnimations => Listenable.merge([
        logoController,
        textController,
        taglineController,
        dotsController,
        exitController,
      ]);

  @override
  void dispose() {
    logoController.dispose();
    textController.dispose();
    taglineController.dispose();
    dotsController.dispose();
    exitController.dispose();
    super.dispose();
  }
}