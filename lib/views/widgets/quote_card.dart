// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/utils/app_theme.dart';
import '../../models/quotes_model.dart';

class QuoteCard extends StatelessWidget {
  final Quote quote;
  final bool isDark;

  const QuoteCard({
    super.key,
    required this.quote,
    required this.isDark,
  });

  void _copyToClipboard(BuildContext context) {
    Clipboard.setData(ClipboardData(text: '"${quote.text}" — ${quote.author}'));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Quote copied to clipboard',
          style: GoogleFonts.inter(fontSize: 13, color: Colors.white),
        ),
        backgroundColor: AppTheme.inkDark,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        margin: const EdgeInsets.all(16),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cardColor = isDark ? AppTheme.cardDark : AppTheme.cardLight;
    final textColor = isDark ? AppTheme.inkLight : AppTheme.inkDark;
    final mutedColor = isDark ? AppTheme.mutedDark : AppTheme.mutedLight;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: (isDark ? Colors.black : AppTheme.inkDark).withOpacity(0.08),
            blurRadius: 30,
            offset: const Offset(0, 10),
          ),
          BoxShadow(
            color: (isDark ? Colors.black : AppTheme.inkDark).withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
              decoration: BoxDecoration(
                color: AppTheme.goldAccent.withOpacity(0.12),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: AppTheme.goldAccent.withOpacity(0.3),
                  width: 1,
                ),
              ),
              child: Text(
                quote.category.toUpperCase(),
                style: GoogleFonts.inter(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.goldAccent,
                  letterSpacing: 1.8,
                ),
              ),
            ),
            const SizedBox(height: 28),
            Text(
              '\u201C',
              style: GoogleFonts.cormorantGaramond(
                fontSize: 80,
                color: AppTheme.goldAccent.withOpacity(0.7),
                height: 0.6,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              quote.text,
              style: GoogleFonts.cormorantGaramond(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: textColor,
                height: 1.65,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 28),
            Container(
              width: 40,
              height: 1.5,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppTheme.goldAccent,
                    AppTheme.goldAccent.withOpacity(0),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    quote.author,
                    style: GoogleFonts.inter(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: textColor,
                      letterSpacing: 0.2,
                    ),
                  ),
                ),
                Row(
                  children: [
                    
                    const SizedBox(width: 8),
                    _ActionButton(
                      icon: Icons.copy_rounded,
                      color: mutedColor,
                      onTap: () => _copyToClipboard(context),
                      tooltip: 'Copy',
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final VoidCallback onTap;
  final String tooltip;

  const _ActionButton({
    required this.icon,
    required this.color,
    required this.onTap,
    required this.tooltip,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          width: 38,
          height: 38,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color.withOpacity(0.08),
          ),
          child: Icon(icon, size: 18, color: color),
        ),
      ),
    );
  }
}
