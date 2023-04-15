import 'package:flu_proj/data/network/error_handler.dart';

import '../response/responses.dart';

const CACHE_HOME_KEY = "CACHE_HOME_KEY";
const CACHE_HOME_INTRVAL = 60 * 1000;

abstract class LocalDataSource {
  Future<HomeResponse> getHomeData();

  Future<void> saveHomeToCache(HomeResponse homeResponse);

  void clearCache();

  void removeFromCache(String key);
}

class LocalDataSourceImpl implements LocalDataSource {
  // run time cache

  Map<String, CachedItem> cacheMap = Map();

  @override
  Future<HomeResponse> getHomeData() async {
    CachedItem? cachedItem = cacheMap[CACHE_HOME_KEY];
    if (cachedItem != null && cachedItem.isValid(CACHE_HOME_INTRVAL)) {
      return cachedItem.data;
    } else {
      throw ErrorHandler.handle(DataSource.CACHE_ERROR);
    }
  }

  @override
  Future<void> saveHomeToCache(HomeResponse homeResponse) async {
    cacheMap[CACHE_HOME_KEY] = CachedItem(homeResponse);
  }

  @override
  void clearCache() {
    cacheMap.clear();
  }

  @override
  void removeFromCache(String key) {
    cacheMap.remove(key);
  }
}

class CachedItem {
  dynamic data;
  int cacheTime = DateTime.now().millisecondsSinceEpoch;

  CachedItem(this.data);
}

extension CachedItemExtension on CachedItem {
  bool isValid(int expirationTime) {
    int currentTime = DateTime.now().millisecondsSinceEpoch;
    bool isValid = currentTime - cacheTime <= expirationTime;
    return isValid;
  }
}
