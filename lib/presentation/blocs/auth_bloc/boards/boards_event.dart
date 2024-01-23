part of 'boards_bloc.dart';

 abstract class BoardsEvent extends Equatable {

  const BoardsEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GetBoardList extends BoardsEvent{

}