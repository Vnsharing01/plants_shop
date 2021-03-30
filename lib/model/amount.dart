import 'package:flutter/material.dart';
import 'package:state_notifier/state_notifier.dart';

class Amount {
  final int count;

  const Amount(this.count);
}

class AmountStateNotifier extends StateNotifier<Amount> {
  AmountStateNotifier() : super(_count);

  static const _count = Amount(1);

  void addPlants() {
    state = Amount(state.count + 1);
  }

  void removePlants() {
    if (state.count > 1) {
      state = Amount(state.count - 1);
    }
  }

  @override
  @protected
  set state(Amount value) {
    super.state = value;
  }
}
