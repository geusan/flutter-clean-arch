enum StorageKeys {
  accessToken,
  refreshToken,
  withAccessToken,
}

extension StorageKeysExt on StorageKeys {
  get value {
    switch (this) {
      case StorageKeys.accessToken:
        return 'accessToken';
      case StorageKeys.refreshToken:
        return 'refreshToken';
      case StorageKeys.withAccessToken:
        return 'withAccessToken';
      default:
        return '';
    }
  }
}
