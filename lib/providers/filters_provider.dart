import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Filter { gluttenFree, lactoseFree, vegeterian, vegan }

class filterNotifier extends StateNotifier<Map<Filter, bool>> {
  filterNotifier()
      : super({
          Filter.gluttenFree: false,
          Filter.lactoseFree: false,
          Filter.vegan: false,
          Filter.vegeterian: false
        });
        void setFilter(Filter filter,bool isactive)
        {
          state={...state,filter:isactive};
        }
        void setFilters(Map<Filter,bool> choosenfilter)
        {
          state=choosenfilter;
        }
}

final filtersprovider = StateNotifierProvider<filterNotifier,Map<Filter,bool>>((ref) => filterNotifier());
