// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/utils/app_theme.dart';
import '../../viewmodels/quotes_viewmodel.dart';
import '../widgets/quote_button.dart';
import '../widgets/quote_card.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late AnimationController _slideController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  bool _isDark = false;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _slideController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 450),
    );
    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeInOut,
    );
    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.06), end: Offset.zero).animate(
          CurvedAnimation(parent: _slideController, curve: Curves.easeOutCubic),
        );

    _fadeController.forward();
    _slideController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _slideController.dispose();
    super.dispose();
  }

  void _animateNewQuote(QuoteViewModel vm) async {
    await _fadeController.reverse();
    vm.fetchNewQuote();
    await Future.delayed(const Duration(milliseconds: 50));
    _slideController.reset();
    _fadeController.forward();
    _slideController.forward();
  }

  @override
  Widget build(BuildContext context) {
    final mutedColor = _isDark ? AppTheme.mutedDark : AppTheme.mutedLight;
    final textColor = _isDark ? AppTheme.inkLight : AppTheme.inkDark;

    return Scaffold(
      backgroundColor: _isDark
          ? AppTheme.backgroundDark
          : AppTheme.backgroundLight,
      body: Consumer<QuoteViewModel>(
        builder: (context, vm, _) {
          return SafeArea(
            child: Column(
              children: [
                // Header
                Padding(
                  padding: const EdgeInsets.fromLTRB(28, 24, 24, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'DAILY',
                            style: GoogleFonts.inter(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              color: AppTheme.goldAccent,
                              letterSpacing: 3.0,
                            ),
                          ),
                          Text(
                            'Wisdom',
                            style: GoogleFonts.cormorantGaramond(
                              fontSize: 30,
                              fontWeight: FontWeight.w600,
                              color: textColor,
                              height: 1.1,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          if (vm.quoteCount > 0)
                            Container(
                              margin: const EdgeInsets.only(right: 12),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: AppTheme.goldAccent.withOpacity(0.12),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                '#${vm.quoteCount}',
                                style: GoogleFonts.inter(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: AppTheme.goldAccent,
                                ),
                              ),
                            ),
                          GestureDetector(
                            onTap: () => setState(() => _isDark = !_isDark),
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              width: 44,
                              height: 44,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: mutedColor.withOpacity(0.1),
                              ),
                              child: Icon(
                                _isDark
                                    ? Icons.light_mode_rounded
                                    : Icons.dark_mode_rounded,
                                size: 20,
                                color: mutedColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Main content
                Expanded(
                  child: Center(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 32),
                          if (vm.isLoading)
                            _buildLoadingCard(isDark: _isDark)
                          else if (vm.state == QuoteState.error)
                            _buildErrorCard(vm, textColor: textColor)
                          else if (vm.hasQuote)
                            FadeTransition(
                              opacity: _fadeAnimation,
                              child: SlideTransition(
                                position: _slideAnimation,
                                child: QuoteCard(
                                  quote: vm.currentQuote!,
                                  isDark: _isDark,
                                ),
                              ),
                            ),
                          const SizedBox(height: 40),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            child: NewQuoteButton(
                              onTap: vm.isLoading
                                  ? null
                                  : () => _animateNewQuote(vm),
                              isDark: _isDark,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            'Tap to discover a new perspective',
                            style: GoogleFonts.inter(
                              fontSize: 12.5,
                              color: mutedColor,
                              letterSpacing: 0.3,
                            ),
                          ),
                          const SizedBox(height: 36),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildLoadingCard({required bool isDark}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      height: 280,
      decoration: BoxDecoration(
        color: isDark ? AppTheme.cardDark : AppTheme.cardLight,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: AppTheme.inkDark.withOpacity(0.06),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 28,
              height: 28,
              child: CircularProgressIndicator(
                strokeWidth: 2.5,
                color: AppTheme.goldAccent,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Finding wisdom...',
              style: GoogleFonts.inter(
                fontSize: 13,
                color: AppTheme.mutedLight,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorCard(QuoteViewModel vm, {required Color textColor}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: _isDark ? AppTheme.cardDark : AppTheme.cardLight,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          Icon(
            Icons.error_outline_rounded,
            size: 40,
            color: Colors.red.shade300,
          ),
          const SizedBox(height: 16),
          Text(
            vm.errorMessage ?? 'Something went wrong',
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(fontSize: 14, color: textColor),
          ),
          const SizedBox(height: 20),
          TextButton(
            onPressed: vm.loadInitialQuote,
            child: Text(
              'Try Again',
              style: GoogleFonts.inter(color: AppTheme.goldAccent),
            ),
          ),
        ],
      ),
    );
  }
}
