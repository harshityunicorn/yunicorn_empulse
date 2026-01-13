import 'package:flutter/material.dart';

class CustomBottomSheet {
  static void show(
    BuildContext context, {
    required Widget child,
    double? height,
    bool isDismissible = true,
    Color overlayColor = Colors.black54,
  }) {
    showGeneralDialog(
      context: context,
      barrierDismissible: isDismissible,
      barrierLabel: 'Bottom Sheet',
      barrierColor: Colors.transparent,
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, animation, secondaryAnimation) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Material(
            color: Colors.transparent,
            child: _BottomSheetWrapper(
              animation: animation,
              overlayColor: overlayColor,
              isDismissible: isDismissible,
              height: height,
              child: child,
            ),
          ),
        );
      },
    );
  }
}

class _BottomSheetWrapper extends StatelessWidget {
  final Animation<double> animation;
  final Color overlayColor;
  final bool isDismissible;
  final double? height;
  final Widget child;

  const _BottomSheetWrapper({
    required this.animation,
    required this.overlayColor,
    required this.isDismissible,
    required this.child,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Animated overlay
        FadeTransition(
          opacity: animation,
          child: GestureDetector(
            onTap: isDismissible ? () => Navigator.of(context).pop() : null,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: overlayColor,
            ),
          ),
        ),
        // Bottom sheet
        Align(
          alignment: Alignment.bottomCenter,
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 1),
              end: Offset.zero,
            ).animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.easeOut,
              ),
            ),
            child: Container(
              width: double.infinity,
              constraints: BoxConstraints(
                maxHeight: height ?? MediaQuery.of(context).size.height * 0.75,
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Drag handle
                  Container(
                    margin: const EdgeInsets.only(top: 12),
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  // Content
                  Flexible(child: child),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// Example bottom sheet content
class BottomSheetContent extends StatelessWidget {
  const BottomSheetContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Select an Option',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          _buildOption(
            context,
            icon: Icons.photo_camera,
            title: 'Take Photo',
            subtitle: 'Capture a new photo',
            onTap: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Take Photo selected')),
              );
            },
          ),
          const Divider(height: 1),
          _buildOption(
            context,
            icon: Icons.photo_library,
            title: 'Choose from Gallery',
            subtitle: 'Select an existing photo',
            onTap: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Gallery selected')),
              );
            },
          ),
          const Divider(height: 1),
          _buildOption(
            context,
            icon: Icons.link,
            title: 'Add from URL',
            subtitle: 'Paste an image link',
            onTap: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('URL selected')),
              );
            },
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () => Navigator.pop(context),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                side: const BorderSide(color: Colors.grey),
              ),
              child: const Text(
                'Cancel',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOption(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: Colors.blue,
                size: 24,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: Colors.grey[400],
            ),
          ],
        ),
      ),
    );
  }
}