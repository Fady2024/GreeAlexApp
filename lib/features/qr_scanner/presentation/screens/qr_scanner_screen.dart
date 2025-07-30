import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:mobile_scanner/mobile_scanner.dart';
import '../../../../core/theme/colors.dart';

class QRScannerScreen extends StatefulWidget {
  const QRScannerScreen({super.key});

  @override
  State<QRScannerScreen> createState() => _QRScannerScreenState();
}

class _QRScannerScreenState extends State<QRScannerScreen>
    with SingleTickerProviderStateMixin {
  MobileScannerController? _scannerController;
  late final AnimationController _animationController;
  bool _isFlashOn = false;
  late Animation<double> _laserAnimation;

  @override
  void initState() {
    super.initState();
    if (!kIsWeb) {
      _scannerController = MobileScannerController(
        detectionSpeed: DetectionSpeed.normal,
        facing: CameraFacing.back,
        torchEnabled: false,
      );
    }
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: false);
    _laserAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_animationController);
  }

  @override
  void dispose() {
    _scannerController?.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scanWindow = Rect.fromCenter(
      center: MediaQuery.of(context).size.center(Offset.zero),
      width: 250,
      height: 250,
    );

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          kIsWeb || _scannerController == null
              ? Container(color: Colors.black)
              : MobileScanner(
                  controller: _scannerController!,
                  onDetect: (capture) {
                    final List<Barcode> barcodes = capture.barcodes;
                    if (barcodes.isNotEmpty) {
                      final String code =
                          barcodes.first.rawValue ?? 'No code found';
                      if (mounted) {
                        Navigator.pop(context, code);
                      }
                    }
                  },
                ),
          CustomPaint(
            painter: ScannerOverlayPainter(scanWindow: scanWindow),
            size: MediaQuery.of(context).size,
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: AnimatedBuilder(
                animation: _laserAnimation,
                builder: (context, child) {
                  return CustomPaint(
                    painter: LaserPainter(
                      animationValue: _laserAnimation.value,
                      scanWindow: scanWindow,
                    ),
                    size: Size(scanWindow.width, scanWindow.height),
                  );
                },
              ),
            ),
          ),
          // Top Bar (Back Button)
          Positioned(
            top: 40,
            left: 16,
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          // Bottom Controls (Flash & Gallery)
          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildControlButton(
                  icon: Icon(
                    _isFlashOn ? Icons.flash_on : Icons.flash_off,
                    color: _isFlashOn ? AppColors.primary : Colors.white,
                  ),
                  onPressed: () {
                    if (_scannerController == null) return;
                    setState(() {
                      _isFlashOn = !_isFlashOn;
                    });
                    _scannerController!.toggleTorch();
                  },
                ),
                _buildControlButton(
                  icon: const Icon(Icons.image, color: Colors.white),
                  onPressed: () {
                    if (kIsWeb) return;
                    // TODO: Implement gallery picking
                    // --- HANDLE GALLERY PICK ---
                    // You can implement image picking logic here
                  },
                ),
              ],
            ),
          ),
          // Instructional Text
          Positioned(
            bottom: scanWindow.bottom + 20,
            left: 0,
            right: 0,
            child: const Text(
              'وجه الكاميرا نحو الرمز للمسح',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'Poppins',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildControlButton({required Widget icon, required VoidCallback onPressed}) {
    return CircleAvatar(
      radius: 30,
      backgroundColor: Colors.black.withOpacity(0.4),
      child: IconButton(
        icon: icon,
        iconSize: 30,
        onPressed: onPressed,
      ),
    );
  }
}

// --- CUSTOM PAINTERS FOR OVERLAY AND LASER ---

class ScannerOverlayPainter extends CustomPainter {
  final Rect scanWindow;

  ScannerOverlayPainter({required this.scanWindow});

  @override
  void paint(Canvas canvas, Size size) {
    final backgroundPath = Path()..addRect(Rect.fromLTWH(0, 0, size.width, size.height));
    final cutoutPath = Path()
      ..addRRect(RRect.fromRectAndCorners(
        scanWindow,
        topLeft: const Radius.circular(12),
        topRight: const Radius.circular(12),
        bottomLeft: const Radius.circular(12),
        bottomRight: const Radius.circular(12),
      ));

    final overlayPath = Path.combine(
      PathOperation.difference,
      backgroundPath,
      cutoutPath,
    );

    final paint = Paint()
      ..color = AppColors.overlay
      ..style = PaintingStyle.fill;

    canvas.drawPath(overlayPath, paint);

    final borderPaint = Paint()
      ..color = AppColors.primary
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

    canvas.drawRRect(
        RRect.fromRectAndRadius(scanWindow, const Radius.circular(12)),
        borderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class LaserPainter extends CustomPainter {
  final double animationValue;
  final Rect scanWindow;

  LaserPainter({required this.animationValue, required this.scanWindow});

  @override
  void paint(Canvas canvas, Size size) {
    final laserY = size.height * animationValue;
    final laserPaint = Paint()
      ..color = AppColors.primary
      ..strokeWidth = 3
      ..shader = const LinearGradient(
        colors: [Colors.transparent, AppColors.primary, Colors.transparent],
        stops: [0.1, 0.5, 0.9],
      ).createShader(Rect.fromLTWH(0, laserY - 2, size.width, 4));

    canvas.drawLine(
      Offset(0, laserY),
      Offset(size.width, laserY),
      laserPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
