import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc_concepts/logic/cubit/counter_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("CounterCubit", () {
    CounterCubit counterCubit;
    setUp(() {
      counterCubit = CounterCubit();
    });
    tearDown(() {
      counterCubit.close();
    });

    test(
        "The initial state for the CounterCubit is CounterState(counterValue: 0)",
        () {
      expect(counterCubit.state, CounterState(counterValue: 0));
    });

    blocTest("The cubit should emit a CounterState(CounterValue:1,"
        " wasIncrementer:true) when cubit.increment() function is called",
        build: () => counterCubit,
        act: (cubit) => cubit.increment(),
        expect: [CounterState(counterValue: 1, wasIncremented: true)]
    );

    blocTest("The cubit should emit a CounterState(CounterValue:-1,"
        " wasIncrementer:false) when cubit.decrement() function is called",
        build: () => counterCubit,
        act: (cubit) => cubit.decrement(),
        expect: [CounterState(counterValue: -1, wasIncremented: false)]
    );
  });
}
