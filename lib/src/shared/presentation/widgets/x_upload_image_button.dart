import 'dart:io';

import 'package:fauzan_test/src/core/helper/helper.dart';
import 'package:fauzan_test/src/shared/presentation/widgets/x_button.dart';
import 'package:fauzan_test/src/shared/presentation/widgets/x_image_picker_bottom_sheet.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class XUploadImageButton extends StatefulWidget {
  const XUploadImageButton({
    super.key,
    this.fileType = FileType.any,
    this.allowedExtensions,
    this.allowMultiples,
    this.label,
    this.onFilePicked,
    this.initialValue,
  });

  final FileType fileType;
  final List<String>? allowedExtensions;
  final bool? allowMultiples;
  final String? label;
  final List<File>? initialValue;
  final void Function(FilePickerResult file)? onFilePicked;

  @override
  State<XUploadImageButton> createState() => _XUploadImageButtonState();
}

class _XUploadImageButtonState extends State<XUploadImageButton> {
  List<File>? file;

  @override
  void initState() {
    super.initState();

    file = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return XButton(
      color: Colors.white,
      contentAlignment: Alignment.centerLeft,
      onTap: () async {
        FilePickerResult? picker;

        if (widget.fileType == FileType.image) {
          picker = await Helper.showBottomSheet<FilePickerResult>(
            context,
            const XImagePickerBottomSheet(),
          );
        } else {
          picker = await FilePicker.platform.pickFiles(
              type: widget.fileType,
              allowedExtensions: widget.allowedExtensions,
              allowMultiple: widget.allowMultiples ?? false);
        }

        if (picker == null) return;

        setState(() {
          file = picker!.files.map((e) => File(e.path!)).toList();
        });

        if (widget.onFilePicked != null) widget.onFilePicked!(picker);
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: SvgPicture.asset(
              Helper.getSvgPath('ic_ktp.svg'),
              height: 32,
              width: 32,
            ),
          ),
          const SizedBox(width: 10),
          Flexible(
            child: Text(
              file?.map((e) => e.path.split("/").last).join(", ") ??
                  widget.label ??
                  "Upload File",
              style: const TextStyle(
                color: Colors.black,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }
}
