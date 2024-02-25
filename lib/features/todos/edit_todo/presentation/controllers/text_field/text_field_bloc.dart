import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'text_field_event.dart';
part 'text_field_state.dart';

class TextFieldBloc extends Bloc<TextFieldEvent, TextFieldState> {
  TextFieldBloc({
    required String? title,
    required String? description,
  }) : super(
          TextFieldState(
            title: title ?? '',
            description: description ?? '',
          ),
        ) {
    on<TitleFieldChanged>(_onTitleChanged);
    on<DescriptionFieldChanged>(_onDescriptionChanged);
  }

  void _onTitleChanged(
    TitleFieldChanged event,
    Emitter<TextFieldState> emit,
  ) {
    emit(state.copyWith(title: event.title));
  }

  void _onDescriptionChanged(
    DescriptionFieldChanged event,
    Emitter<TextFieldState> emit,
  ) {
    emit(state.copyWith(description: event.description));
  }
}
