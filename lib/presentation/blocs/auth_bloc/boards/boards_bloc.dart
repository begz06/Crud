import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:crud_example/data/repository/board_repo.dart';
import 'package:crud_example/utils/import.dart';


part 'boards_event.dart';
part 'boards_state.dart';

class BoardsBloc extends Bloc<BoardsEvent, BoardsState> {
  final BoardRepo _repo = BoardRepo();
  BoardsBloc() : super(const BoardsState(boardList: [])) {
    on<GetBoardList>(_getBoardsListHandler);
  }

  FutureOr<void> _getBoardsListHandler(GetBoardList event, Emitter<BoardsState> emit) async{
    try{
      final List<Board> boardList = await _repo.getBoards();
      emit(state.copyWith(isLoading: false, boardList: boardList, exception: null));
    } on DioException catch(e){
      emit(state.copyWith(isLoading: false, exception: e));
    }
  }
}
