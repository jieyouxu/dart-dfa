class State {
  final String name;

  State(this.name);

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is State && runtimeType == other.runtimeType && name == other.name;

  @override
  int get hashCode => name.hashCode;
}
