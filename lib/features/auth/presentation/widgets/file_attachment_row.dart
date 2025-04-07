import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/styles/colors/app_color.dart';
import '../../../../core/styles/fonts/my_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class FileAttachmentRow extends StatefulWidget {
  const FileAttachmentRow({super.key, required this.labelText});

  final String labelText;

  @override
  State<FileAttachmentRow> createState() => _FileAttachmentRowState();
}

class _FileAttachmentRowState extends State<FileAttachmentRow> {
  File? _file;

  Future<void> _pickFile() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _file = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.labelText,
          style: AppFonts.styleMedium600_16.copyWith(color: AppColor.black),
        ),
        const SizedBox(height: 10),
        Container(
          padding: EdgeInsets.only(right: 14.w),
          decoration: BoxDecoration(
            color: AppColor.yellow.withAlpha(30),
            borderRadius: BorderRadius.circular(100),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: _pickFile,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColor.purple,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Text(
                    "Attaching the file",
                    style: AppFonts.styleBold_10
                        .copyWith(color: AppColor.lightBlack),
                  ),
                ),
              ),
              SizedBox(width: 40.w),
              Text(_file != null ? _file!.path.split('/').last : "photo.jpg",
                  style: AppFonts.styleRegular_14
                      .copyWith(color: AppColor.darkBlack)),
            ],
          ),
        ),
        SizedBox(height: 20.h),
      ],
    );
  }
}
