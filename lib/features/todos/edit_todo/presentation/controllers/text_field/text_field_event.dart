part of 'text_field_bloc.dart';

sealed class TextFieldEvent extends Equatable {
  const TextFieldEvent();

  @override
  List<Object> get props => [];
}

final class TitleFieldChanged extends TextFieldEvent {
  const TitleFieldChanged(this.title);

  final String title;

  @override
  List<Object> get props => [title];
}

final class DescriptionFieldChanged extends TextFieldEvent {
  const DescriptionFieldChanged(this.description);

  final String description;

  @override
  List<Object> get props => [description];
}
