class ParticlePatternChecker {
  bool isPatternsValid(List<int> dotIds, Map<int, List<int>> patterns) {
    var everyDotHasPattern = dotIds.map((id) => patterns[id]).every((pattern) => pattern != null && pattern.isNotEmpty);

    return everyDotHasPattern;
  }
}
