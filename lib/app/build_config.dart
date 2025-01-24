enum BuildType {
  development,
  staging,
  production,
}

class BuildConfig {
  static BuildType? buildType;

  static String get name => buildType?.name ?? '';

  static String get title {
    switch (buildType) {
      case BuildType.development:
        return 'Clust Customer';
      case BuildType.staging:
        return 'Clust Customer';
      case BuildType.production:
        return 'Clust Customer';
      default:
        return 'title';
    }
  }
}
