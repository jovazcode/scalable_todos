part of 'edit_bloc.dart';

sealed class EditEvent extends Equatable {
  const EditEvent({
    required this.title,
    required this.description,
  });

  final String title;
  final String description;

  @override
  List<Object> get props => [];
}

final class SubmitEvent extends EditEvent {
  const SubmitEvent({
    required super.title,
    required super.description,
  });
}
