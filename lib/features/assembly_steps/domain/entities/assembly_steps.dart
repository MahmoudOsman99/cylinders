class AssemblySteps {
  final List<Types> assemblyTypes;
  final List<Map<dynamic, dynamic>> steps;

  AssemblySteps({
    required this.assemblyTypes,
    required this.steps,
  });
}

enum Types {
  Rougher,
  Intermediate,
  Finish,
}
