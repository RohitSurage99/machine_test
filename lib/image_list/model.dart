class ImageListViewResponseModel {
  String? status;
  List<Images>? images;

  ImageListViewResponseModel({this.status, this.images});

  ImageListViewResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(Images.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Images {
  String? xtImage;
  String? id;

  Images({this.xtImage, this.id});

  Images.fromJson(Map<String, dynamic> json) {
    xtImage = json['xt_image'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['xt_image'] = xtImage;
    data['id'] = id;
    return data;
  }
}

class ImageListViewRequestModel {
  String? userId;
  String? offset;
  String? type;

  ImageListViewRequestModel({this.userId, this.offset, this.type});

  ImageListViewRequestModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    offset = json['offset'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['offset'] = offset;
    data['type'] = type;
    return data;
  }
}
