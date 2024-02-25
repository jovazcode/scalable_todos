part of 'text_field_bloc.dart';

final class TextFieldState extends Equatable {
  const TextFieldState({
    this.title = '',
    this.description = '',
  });

  final String title;
  final String description;

  TextFieldState copyWith({
    String? title,
    String? description,
  }) {
    return TextFieldState(
      title: title ?? this.title,
      description: description ?? this.description,
    );
  }

  @override
  List<Object?> get props => [title, description];
}
