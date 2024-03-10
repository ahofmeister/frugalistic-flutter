import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'analysis_config.g.dart';

@Riverpod(keepAlive: true)
class MonthOverview extends _$MonthOverview {
  @override
  int build() => 0;
  @override
  set state(int newState) => super.state = newState;
}
