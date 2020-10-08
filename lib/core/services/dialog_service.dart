
import 'dart:async';

class DialogService {
  Function _showDialogListener;
  Completer _dialogCompleter;

  // Registers the callback function. Typically to show the dialog
  void registerDialogListener(Function showDialogListener){
    _showDialogListener = showDialogListener;
  }

  // Calls the dialog listener and returns a Future that will wait for dialogComplete
  Future showDialog(){
    _dialogCompleter = Completer();
    _showDialogListener();
    return _dialogCompleter.future;
  }

  // Completes the dialogCompleter to resume Future execution call
  void dialogComplete(){
    _dialogCompleter.complete();
    _dialogCompleter = null;
  }
}