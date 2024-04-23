
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_filex/open_filex.dart';

import '../../bloc/book_bloc.dart';
import '../../bloc/book_event.dart';
import '../../bloc/book_state.dart';
import '../../data/models/file_data_model.dart';
import '../../data/repositories/file_repository.dart';
import '../../utils/appcolors.dart';

class FileManagerScreen extends StatelessWidget {
  const FileManagerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: const Text("File Managaer Screen"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: List.generate(
          context.read<FileRepository>().files.length,
              (index) {
            FileDataModel fileDataModel =
            context.read<FileRepository>().files[index];

            FileManagerBloc fileManagerBloc = FileManagerBloc();

            return BlocProvider.value(
              value: fileManagerBloc,
              child: BlocBuilder<FileManagerBloc, FileManagerState>(
                builder: (context, state) {
                  debugPrint("CURRENT MB: ${state.progress}");
                  return Column(
                    children: [
                      ListTile(
                        title: Text(fileDataModel.fileName),
                        subtitle: Text(fileDataModel.fileUrl),
                        trailing: IconButton(
                          onPressed: () async {
                            if (state.newFileLocation.isEmpty) {
                              fileManagerBloc.add(
                                DownloadFileEvent(
                                  fileDataModel: fileDataModel,
                                ),
                              );
                            } else {
                              await OpenFilex.open(state.newFileLocation);
                            }
                          },
                          icon: Icon(
                            state.newFileLocation.isEmpty
                                ? Icons.download
                                : Icons.check,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      Visibility(
                        visible: state.progress != 0,
                        child: LinearProgressIndicator(
                          value: state.progress,
                          backgroundColor: Colors.grey,
                        ),
                      )
                    ],
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
