part of 'boards_bloc.dart';

class BoardsState extends Equatable {
  final List<Board> boardList;
  final bool? isLoading;
  final DioException? exception;

  const BoardsState({
    required this.boardList,
    this.isLoading,
    this.exception,
  });

  copyWith({List<Board>? boardList, bool? isLoading, DioException? exception}) {
    return BoardsState(
      boardList: boardList ?? this.boardList,
      isLoading: isLoading ?? this.isLoading,
      exception: exception ?? this.exception,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        boardList,
        isLoading,
        exception,
      ];
}
