import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class XImagePickerBottomSheet extends StatefulWidget {
  const XImagePickerBottomSheet({super.key});

  @override
  State<XImagePickerBottomSheet> createState() =>
      _XImagePickerBottomSheetState();
}

class _XImagePickerBottomSheetState extends State<XImagePickerBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Pilih gambar", style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: 25),
        Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: () async {
                  final picker = await ImagePicker().pickImage(
                    source: ImageSource.camera,
                  );

                  if (!mounted) return;
                  if (picker == null) {
                    Navigator.pop<FilePickerResult>(context, null);
                  }

                  Navigator.pop<FilePickerResult>(
                      context,
                      FilePickerResult([
                        PlatformFile(
                          name: picker!.name,
                          path: picker.path,
                          size: await picker.length(),
                        )
                      ]));
                },
                child: const Column(
                  children: [
                    Icon(Icons.camera),
                    SizedBox(height: 10),
                    Text("Ambil gambar")
                  ],
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: InkWell(
                onTap: () async {
                  final picker = await FilePicker.platform.pickFiles(
                    type: FileType.image,
                  );

                  if (!mounted) return;

                  Navigator.pop<FilePickerResult>(context, picker);
                },
                child: const Column(
                  children: [
                    Icon(Icons.image),
                    SizedBox(height: 10),
                    Text("Galeri")
                  ],
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
