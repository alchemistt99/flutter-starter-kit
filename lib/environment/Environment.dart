class Environment {
  static String imageAssets = 'assets/images/';
  static String logoAssets = 'assets/logo/';
  static String iconAssets = 'assets/icons/';

  static Map<String, String> headerPost = {};

  // production
  static String apiProd = 'https://sapawarga.jabarprov.go.id/api/v1';
  static String apiProdStorage =
      'https://sapawarga.jabarprov.go.id/api/storage'; //
  static String databaseNameProd = 'SapawargaDB.db';

  // staging
  static String apiStaging = 'https://sapawarga-staging.jabarprov.go.id/api/v1';
  static String apiStagingStorage =
      'https://sapawarga-staging.jabarprov.go.id/api/storage';
  static String databaseNameStaging = 'SapawargaDBStaging.db';

  // mock
  static String apiMock = 'http://52.74.74.33:3000/v1';
}
