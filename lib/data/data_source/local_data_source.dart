import '../responses/responses.dart';

const CACHE_HOME_KEY="CACHE_HOME_KEY";
abstract class LocalDataSource{
  Future<HomeResponse> getHome();

  Future<void> saveHomeToCache(HomeResponse homeResponse);
}

class LocalDataSourceImplementer implements LocalDataSource{

  // run time cache
  Map<String, CachedItem> cacheMap = Map();

  @override
  Future<HomeResponse> getHome() {

  }

  @override
  Future<void> saveHomeToCache(HomeResponse homeResponse) {
    //cacheMap[CACHE_HOME_KEY] = CachedItem(homeResponse);
  }

}

class CachedItem{
  dynamic data;
  int cacheTime = DateTime.now().millisecondsSinceEpoch;

  CachedItem(this.data, this.cacheTime);
}
