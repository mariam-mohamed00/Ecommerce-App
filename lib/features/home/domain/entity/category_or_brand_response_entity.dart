class CategoryOrBrandEntity {
  String? id;
  String? name;
  String? slug;
  String? image;

  CategoryOrBrandEntity({this.id, this.name, this.slug, this.image});
}

class CategoryOrBrandResponseEntity {
  num? results;
  List<CategoryOrBrandEntity>? dataList;

  CategoryOrBrandResponseEntity({this.results, this.dataList});
}
