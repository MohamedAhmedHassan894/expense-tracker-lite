import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../logic/bloc/add_expense_bloc.dart';
import '../../logic/bloc/add_expense_event.dart';

class ReceiptUploadField extends StatelessWidget {
  final String? receiptPath;

  const ReceiptUploadField({
    super.key,
    this.receiptPath,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final ImagePicker picker = ImagePicker();
        final XFile? image =
            await picker.pickImage(source: ImageSource.gallery);
        if (image != null) {
          context
              .read<AddExpenseBloc>()
              .add(AddExpenseEvent.receiptSelected(image.path));
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          color: const Color(0xFFF5F6FA),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              receiptPath != null ? 'Receipt attached' : 'Upload Image',
              style: TextStyle(
                fontSize: 16,
                color: receiptPath != null
                    ? const Color(0xFF2D3142)
                    : Colors.grey[400],
              ),
            ),
            const Icon(Icons.camera_alt, size: 20),
          ],
        ),
      ),
    );
  }
}
