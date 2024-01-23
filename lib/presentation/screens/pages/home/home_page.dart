import 'package:flutter/material.dart';

import '../../../../utils/import.dart';
import '../../../blocs/auth_bloc/boards/boards_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login page"),
        centerTitle: true,
      ),
      body: BlocConsumer<BoardsBloc, BoardsState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if(state.isLoading ?? false){
            return const Center(child: CircularProgressIndicator());
          } else if(state.boardList.isEmpty){
            return const Center(child: Text("Empty boards"),);
          } else if(state.exception != null){
            return Center(child: Text("Something went wrong"),);
          }else{
            final List<Board> boards = state.boardList;
            return ListView.builder(
              itemBuilder: (context, i) {
                return Card(
                  margin: EdgeInsets.all(16),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(boards[i].title ?? "no title", ),
                        Text(boards[i].creator?.phone ?? "no phone"),
                        Text(boards[i].createdAt ?? "no data"),
                        Text(boards[i].updateAt ?? "unchanged")
                      ],
                    ),
                  ),
                );
              },
              itemCount:boards.length,
            );
          }

        },
      ),
    );
  }
}
