import 'package:get_it/get_it.dart';

import '../data/local/hiver_storage.dart';
import '../data/network/api_provider.dart';


final GetIt getIt = GetIt.instance;

void setUpDI(){
  getIt.registerSingleton<CurrencyController>(CurrencyController());
  getIt.registerSingleton<ApiProvider>(ApiProvider());
}