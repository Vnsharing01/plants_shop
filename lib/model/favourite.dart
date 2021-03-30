import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavouriteStateNotifier extends StateNotifier<bool> {
  FavouriteStateNotifier() : super(false);

  void liked() {
    if (state == false) {
      state = true;
    } else {
      state = false;
    }
  }

  @override
  set state(bool value) {
    super.state = value;
  }
}
