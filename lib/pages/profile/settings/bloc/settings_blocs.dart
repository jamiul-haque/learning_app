import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app/pages/profile/settings/bloc/settings-states.dart';
import 'package:learning_app/pages/profile/settings/bloc/settings_events.dart';

class SettingsBlocs extends Bloc<SettingsEvents, SettingsStates> {
  SettingsBlocs() : super(const SettingsStates()) {
    on<TriggerSettings>(_triggerSettings);
  }
  _triggerSettings(SettingsEvents events, Emitter<SettingsStates> emit) {
    emit(const SettingsStates());
  }
}
