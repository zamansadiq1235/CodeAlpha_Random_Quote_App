// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/utils/app_theme.dart';
import '../../viewmodels/splash_viewmodel.dart';
import 'home_screen.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with TickerProviderStateMixin {
  late SplashViewModel vm;

  @override
  void initState() {
    super.initState();

    vm = SplashViewModel();
    vm.init(this);

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await vm.startSequence();

      if (!mounted) return;

      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => const HomeView(),
          transitionsBuilder: (_, animation, __, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          transitionDuration: const Duration(milliseconds: 400),
        ),
      );
    });
  }

  @override
  void dispose() {
    vm.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: vm,
      child: Consumer<SplashViewModel>(
        builder: (context, vm, _) {
          return Scaffold(
            backgroundColor: AppTheme.backgroundLight,
            body: AnimatedBuilder(
              animation: vm.allAnimations,
              builder: (context, _) {
                return FadeTransition(
                  opacity: vm.exitOpacity,
                  child: ScaleTransition(
                    scale: vm.exitScale,
                    child: Stack(
                      children: [
                        _buildBackground(vm),

                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // LOGO
                              Opacity(
                                opacity: vm.logoOpacity.value,
                                child: Transform.scale(
                                  scale: vm.logoScale.value,
                                  child: Transform.rotate(
                                    angle: vm.logoRotate.value,
                                    child: _buildLogoMark(),
                                  ),
                                ),
                              ),

                              const SizedBox(height: 28),

                              // ORNAMENT
                              Opacity(
                                opacity: vm.lineOpacity.value,
                                child: _buildOrnamentalLine(
                                  vm.lineWidth.value,
                                ),
                              ),

                              const SizedBox(height: 28),

                              // TITLE
                              SlideTransition(
                                position: vm.titleSlide,
                                child: FadeTransition(
                                  opacity: vm.titleOpacity,
                                  child: Text(
                                    'Daily Wisdom',
                                    style:
                                        GoogleFonts.cormorantGaramond(
                                      fontSize: 42,
                                      fontWeight: FontWeight.w600,
                                      color: AppTheme.inkDark,
                                      letterSpacing: -0.5,
                                      height: 1.0,
                                    ),
                                  ),
                                ),
                              ),

                              const SizedBox(height: 8),

                              // SUBTITLE
                              SlideTransition(
                                position: vm.subtitleSlide,
                                child: FadeTransition(
                                  opacity: vm.subtitleOpacity,
                                  child: Text(
                                    'Inspire your every moment',
                                    style: GoogleFonts.inter(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                      color: AppTheme.mutedLight,
                                      letterSpacing: 0.4,
                                    ),
                                  ),
                                ),
                              ),

                              const SizedBox(height: 60),

                              // TAGLINE
                              SlideTransition(
                                position: vm.taglineSlide,
                                child: FadeTransition(
                                  opacity: vm.taglineOpacity,
                                  child: _buildTaglineQuote(),
                                ),
                              ),
                            ],
                          ),
                        ),

                        // LOADING DOTS
                        Positioned(
                          bottom: 60,
                          left: 0,
                          right: 0,
                          child: FadeTransition(
                            opacity: vm.taglineOpacity,
                            child: _buildLoadingDots(vm),
                          ),
                        ),

                        // VERSION
                        Positioned(
                          bottom: 28,
                          left: 0,
                          right: 0,
                          child: FadeTransition(
                            opacity: vm.subtitleOpacity,
                            child: Text(
                              'v1.0.0',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.inter(
                                fontSize: 11,
                                color: AppTheme.mutedLight
                                    .withOpacity(0.5),
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildBackground(SplashViewModel vm) {
    return Stack(
      children: [
        Positioned(
          top: -80,
          right: -80,
          child: Opacity(
            opacity: 0.06,
            child: Container(
              width: 260,
              height: 260,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppTheme.goldAccent,
              ),
            ),
          ),
        ),

        Positioned(
          bottom: -100,
          left: -60,
          child: Opacity(
            opacity: 0.05,
            child: Container(
              width: 300,
              height: 300,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppTheme.inkDark,
              ),
            ),
          ),
        ),

        Positioned(
          top: 100,
          left: 32,
          child: Opacity(
            opacity: vm.logoOpacity.value * 0.4,
            child: Container(
              width: 6,
              height: 6,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppTheme.goldAccent,
              ),
            ),
          ),
        ),

        Positioned(
          bottom: 120,
          right: 40,
          child: Opacity(
            opacity: vm.logoOpacity.value * 0.3,
            child: Container(
              width: 4,
              height: 4,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppTheme.goldAccent,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLogoMark() {
    return Container(
      width: 90,
      height: 90,
      decoration: BoxDecoration(
        color: AppTheme.inkDark,
        borderRadius: BorderRadius.circular(26),
      ),
      child: Image.asset(
        'assets/app_icon.png',
        fit: BoxFit.cover
      ),
    );
  }

  Widget _buildOrnamentalLine(double progress) {
    return SizedBox(
      width: 160,
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 1,
              color: AppTheme.goldAccent
                  .withOpacity(0.6 * progress),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Opacity(
              opacity: progress,
              child: Container(
                width: 5,
                height: 5,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppTheme.goldAccent,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 1,
              color: AppTheme.goldAccent
                  .withOpacity(0.6 * progress),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTaglineQuote() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 48),
      child: Column(
        children: [
          Text(
            '"The journey of a thousand miles\nbegins with a single step."',
            textAlign: TextAlign.center,
            style: GoogleFonts.cormorantGaramond(
              fontSize: 17,
              fontStyle: FontStyle.italic,
              color: AppTheme.inkDark.withOpacity(0.55),
              height: 1.6,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            '— Lao Tzu',
            style: GoogleFonts.inter(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppTheme.mutedLight,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingDots(SplashViewModel vm) {
    Widget dot(double opacity) {
      return Opacity(
        opacity: opacity,
        child: Container(
          width: 6,
          height: 6,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppTheme.goldAccent,
          ),
        ),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        dot(vm.dot1Opacity.value),
        dot(vm.dot2Opacity.value),
        dot(vm.dot3Opacity.value),
      ],
    );
  }
}