// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/utils/app_theme.dart';

class NewQuoteButton extends StatefulWidget {
  final VoidCallback? onTap;
  final bool isDark;

  const NewQuoteButton({required this.onTap, required this.isDark});

  @override
  State<NewQuoteButton> createState() => NewQuoteButtonState();
}

class NewQuoteButtonState extends State<NewQuoteButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _pressController;
  late Animation<double> _scaleAnim;

  @override
  void initState() {
    super.initState();
    _pressController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 120),
    );
    _scaleAnim = Tween<double>(
      begin: 1.0,
      end: 0.96,
    ).animate(CurvedAnimation(parent: _pressController, curve: Curves.easeIn));
  }

  @override
  void dispose() {
    _pressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _pressController.forward(),
      onTapUp: (_) {
        _pressController.reverse();
        widget.onTap?.call();
      },
      onTapCancel: () => _pressController.reverse(),
      child: ScaleTransition(
        scale: _scaleAnim,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: double.infinity,
          height: 58,
          decoration: BoxDecoration(
            color: widget.onTap == null
                ? AppTheme.goldAccent.withOpacity(0.5)
                : widget.isDark
                ? AppTheme.inkLight.withOpacity(0.9)
                : AppTheme.inkDark,
            borderRadius: BorderRadius.circular(16),
            boxShadow: widget.onTap == null
                ? []
                : [
                    BoxShadow(
                      color: AppTheme.inkDark.withOpacity(0.25),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    ),
                  ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.auto_awesome_rounded,
                size: 18,
                color: AppTheme.goldAccent,
              ),
              const SizedBox(width: 10),
              Text(
                'NEW QUOTE',
                style: GoogleFonts.inter(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: widget.isDark
                      ? AppTheme.inkDark.withOpacity(0.85)
                      : AppTheme.inkLight,
                  letterSpacing: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
