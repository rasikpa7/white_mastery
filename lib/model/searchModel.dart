// To parse this JSON data, do
//
//     final search = searchFromJson(jsonString);

import 'dart:convert';

Search searchFromJson(String str) => Search.fromJson(json.decode(str));

String searchToJson(Search data) => json.encode(data.toJson());

class Search {
    int? total;
    int? totalPages;
    List<Result>? results;

    Search({
        this.total,
        this.totalPages,
        this.results,
    });

    factory Search.fromJson(Map<String, dynamic> json) => Search(
        total: json["total"],
        totalPages: json["total_pages"],
        results: json["results"] == null ? [] : List<Result>.from(json["results"]!.map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "total": total,
        "total_pages": totalPages,
        "results": results == null ? [] : List<dynamic>.from(results!.map((x) => x.toJson())),
    };
}

class Result {
    String? id;
    String? slug;
    DateTime? createdAt;
    DateTime? updatedAt;
    DateTime? promotedAt;
    int? width;
    int? height;
    String? color;
    String? blurHash;
    String? description;
    String? altDescription;
    List<dynamic>? breadcrumbs;
    Urls? urls;
    ResultLinks? links;
    int? likes;
    bool? likedByUser;
    List<dynamic>? currentUserCollections;
    dynamic sponsorship;
    ResultTopicSubmissions? topicSubmissions;
    User? user;
    List<Tag>? tags;

    Result({
        this.id,
        this.slug,
        this.createdAt,
        this.updatedAt,
        this.promotedAt,
        this.width,
        this.height,
        this.color,
        this.blurHash,
        this.description,
        this.altDescription,
        this.breadcrumbs,
        this.urls,
        this.links,
        this.likes,
        this.likedByUser,
        this.currentUserCollections,
        this.sponsorship,
        this.topicSubmissions,
        this.user,
        this.tags,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        slug: json["slug"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        promotedAt: json["promoted_at"] == null ? null : DateTime.parse(json["promoted_at"]),
        width: json["width"],
        height: json["height"],
        color: json["color"],
        blurHash: json["blur_hash"],
        description: json["description"],
        altDescription: json["alt_description"],
        breadcrumbs: json["breadcrumbs"] == null ? [] : List<dynamic>.from(json["breadcrumbs"]!.map((x) => x)),
        urls: json["urls"] == null ? null : Urls.fromJson(json["urls"]),
        links: json["links"] == null ? null : ResultLinks.fromJson(json["links"]),
        likes: json["likes"],
        likedByUser: json["liked_by_user"],
        currentUserCollections: json["current_user_collections"] == null ? [] : List<dynamic>.from(json["current_user_collections"]!.map((x) => x)),
        sponsorship: json["sponsorship"],
        topicSubmissions: json["topic_submissions"] == null ? null : ResultTopicSubmissions.fromJson(json["topic_submissions"]),
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        tags: json["tags"] == null ? [] : List<Tag>.from(json["tags"]!.map((x) => Tag.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "promoted_at": promotedAt?.toIso8601String(),
        "width": width,
        "height": height,
        "color": color,
        "blur_hash": blurHash,
        "description": description,
        "alt_description": altDescription,
        "breadcrumbs": breadcrumbs == null ? [] : List<dynamic>.from(breadcrumbs!.map((x) => x)),
        "urls": urls?.toJson(),
        "links": links?.toJson(),
        "likes": likes,
        "liked_by_user": likedByUser,
        "current_user_collections": currentUserCollections == null ? [] : List<dynamic>.from(currentUserCollections!.map((x) => x)),
        "sponsorship": sponsorship,
        "topic_submissions": topicSubmissions?.toJson(),
        "user": user?.toJson(),
        "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x.toJson())),
    };
}

class ResultLinks {
    String? self;
    String? html;
    String? download;
    String? downloadLocation;

    ResultLinks({
        this.self,
        this.html,
        this.download,
        this.downloadLocation,
    });

    factory ResultLinks.fromJson(Map<String, dynamic> json) => ResultLinks(
        self: json["self"],
        html: json["html"],
        download: json["download"],
        downloadLocation: json["download_location"],
    );

    Map<String, dynamic> toJson() => {
        "self": self,
        "html": html,
        "download": download,
        "download_location": downloadLocation,
    };
}

class Tag {
    String? type;
    String? title;
    Source? source;

    Tag({
        this.type,
        this.title,
        this.source,
    });

    factory Tag.fromJson(Map<String, dynamic> json) => Tag(
        type: json["type"],
        title: json["title"],
        source: json["source"] == null ? null : Source.fromJson(json["source"]),
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "title": title,
        "source": source?.toJson(),
    };
}

class Source {
    Ancestry? ancestry;
    String? title;
    String? subtitle;
    String? description;
    String? metaTitle;
    String? metaDescription;
    CoverPhoto? coverPhoto;

    Source({
        this.ancestry,
        this.title,
        this.subtitle,
        this.description,
        this.metaTitle,
        this.metaDescription,
        this.coverPhoto,
    });

    factory Source.fromJson(Map<String, dynamic> json) => Source(
        ancestry: json["ancestry"] == null ? null : Ancestry.fromJson(json["ancestry"]),
        title: json["title"],
        subtitle: json["subtitle"],
        description: json["description"],
        metaTitle: json["meta_title"],
        metaDescription: json["meta_description"],
        coverPhoto: json["cover_photo"] == null ? null : CoverPhoto.fromJson(json["cover_photo"]),
    );

    Map<String, dynamic> toJson() => {
        "ancestry": ancestry?.toJson(),
        "title": title,
        "subtitle": subtitle,
        "description": description,
        "meta_title": metaTitle,
        "meta_description": metaDescription,
        "cover_photo": coverPhoto?.toJson(),
    };
}

class Ancestry {
    Category? type;
    Category? category;
    Category? subcategory;

    Ancestry({
        this.type,
        this.category,
        this.subcategory,
    });

    factory Ancestry.fromJson(Map<String, dynamic> json) => Ancestry(
        type: json["type"] == null ? null : Category.fromJson(json["type"]),
        category: json["category"] == null ? null : Category.fromJson(json["category"]),
        subcategory: json["subcategory"] == null ? null : Category.fromJson(json["subcategory"]),
    );

    Map<String, dynamic> toJson() => {
        "type": type?.toJson(),
        "category": category?.toJson(),
        "subcategory": subcategory?.toJson(),
    };
}

class Category {
    String? slug;
    String? prettySlug;

    Category({
        this.slug,
        this.prettySlug,
    });

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        slug: json["slug"],
        prettySlug: json["pretty_slug"],
    );

    Map<String, dynamic> toJson() => {
        "slug": slug,
        "pretty_slug": prettySlug,
    };
}

class CoverPhoto {
    String? id;
    String? slug;
    DateTime? createdAt;
    DateTime? updatedAt;
    DateTime? promotedAt;
    int? width;
    int? height;
    String? color;
    String? blurHash;
    String? description;
    String? altDescription;
    List<dynamic>? breadcrumbs;
    Urls? urls;
    ResultLinks? links;
    int? likes;
    bool? likedByUser;
    List<dynamic>? currentUserCollections;
    dynamic sponsorship;
    CoverPhotoTopicSubmissions? topicSubmissions;
    User? user;
    bool? premium;
    bool? plus;

    CoverPhoto({
        this.id,
        this.slug,
        this.createdAt,
        this.updatedAt,
        this.promotedAt,
        this.width,
        this.height,
        this.color,
        this.blurHash,
        this.description,
        this.altDescription,
        this.breadcrumbs,
        this.urls,
        this.links,
        this.likes,
        this.likedByUser,
        this.currentUserCollections,
        this.sponsorship,
        this.topicSubmissions,
        this.user,
        this.premium,
        this.plus,
    });

    factory CoverPhoto.fromJson(Map<String, dynamic> json) => CoverPhoto(
        id: json["id"],
        slug: json["slug"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        promotedAt: json["promoted_at"] == null ? null : DateTime.parse(json["promoted_at"]),
        width: json["width"],
        height: json["height"],
        color: json["color"],
        blurHash: json["blur_hash"],
        description: json["description"],
        altDescription: json["alt_description"],
        breadcrumbs: json["breadcrumbs"] == null ? [] : List<dynamic>.from(json["breadcrumbs"]!.map((x) => x)),
        urls: json["urls"] == null ? null : Urls.fromJson(json["urls"]),
        links: json["links"] == null ? null : ResultLinks.fromJson(json["links"]),
        likes: json["likes"],
        likedByUser: json["liked_by_user"],
        currentUserCollections: json["current_user_collections"] == null ? [] : List<dynamic>.from(json["current_user_collections"]!.map((x) => x)),
        sponsorship: json["sponsorship"],
        topicSubmissions: json["topic_submissions"] == null ? null : CoverPhotoTopicSubmissions.fromJson(json["topic_submissions"]),
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        premium: json["premium"],
        plus: json["plus"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "promoted_at": promotedAt?.toIso8601String(),
        "width": width,
        "height": height,
        "color": color,
        "blur_hash": blurHash,
        "description": description,
        "alt_description": altDescription,
        "breadcrumbs": breadcrumbs == null ? [] : List<dynamic>.from(breadcrumbs!.map((x) => x)),
        "urls": urls?.toJson(),
        "links": links?.toJson(),
        "likes": likes,
        "liked_by_user": likedByUser,
        "current_user_collections": currentUserCollections == null ? [] : List<dynamic>.from(currentUserCollections!.map((x) => x)),
        "sponsorship": sponsorship,
        "topic_submissions": topicSubmissions?.toJson(),
        "user": user?.toJson(),
        "premium": premium,
        "plus": plus,
    };
}

class CoverPhotoTopicSubmissions {
    BusinessWork? currentEvents;
    BusinessWork? texturesPatterns;

    CoverPhotoTopicSubmissions({
        this.currentEvents,
        this.texturesPatterns,
    });

    factory CoverPhotoTopicSubmissions.fromJson(Map<String, dynamic> json) => CoverPhotoTopicSubmissions(
        currentEvents: json["current-events"] == null ? null : BusinessWork.fromJson(json["current-events"]),
        texturesPatterns: json["textures-patterns"] == null ? null : BusinessWork.fromJson(json["textures-patterns"]),
    );

    Map<String, dynamic> toJson() => {
        "current-events": currentEvents?.toJson(),
        "textures-patterns": texturesPatterns?.toJson(),
    };
}

class BusinessWork {
    String? status;
    DateTime? approvedOn;

    BusinessWork({
        this.status,
        this.approvedOn,
    });

    factory BusinessWork.fromJson(Map<String, dynamic> json) => BusinessWork(
        status: json["status"],
        approvedOn: json["approved_on"] == null ? null : DateTime.parse(json["approved_on"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "approved_on": approvedOn?.toIso8601String(),
    };
}

class Urls {
    String? raw;
    String? full;
    String? regular;
    String? small;
    String? thumb;
    String? smallS3;

    Urls({
        this.raw,
        this.full,
        this.regular,
        this.small,
        this.thumb,
        this.smallS3,
    });

    factory Urls.fromJson(Map<String, dynamic> json) => Urls(
        raw: json["raw"],
        full: json["full"],
        regular: json["regular"],
        small: json["small"],
        thumb: json["thumb"],
        smallS3: json["small_s3"],
    );

    Map<String, dynamic> toJson() => {
        "raw": raw,
        "full": full,
        "regular": regular,
        "small": small,
        "thumb": thumb,
        "small_s3": smallS3,
    };
}

class User {
    String? id;
    DateTime? updatedAt;
    String? username;
    String? name;
    String? firstName;
    String? lastName;
    String? twitterUsername;
    String? portfolioUrl;
    String? bio;
    String? location;
    UserLinks? links;
    ProfileImage? profileImage;
    String? instagramUsername;
    int? totalCollections;
    int? totalLikes;
    int? totalPhotos;
    bool? acceptedTos;
    bool? forHire;
    Social? social;

    User({
        this.id,
        this.updatedAt,
        this.username,
        this.name,
        this.firstName,
        this.lastName,
        this.twitterUsername,
        this.portfolioUrl,
        this.bio,
        this.location,
        this.links,
        this.profileImage,
        this.instagramUsername,
        this.totalCollections,
        this.totalLikes,
        this.totalPhotos,
        this.acceptedTos,
        this.forHire,
        this.social,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        username: json["username"],
        name: json["name"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        twitterUsername: json["twitter_username"],
        portfolioUrl: json["portfolio_url"],
        bio: json["bio"],
        location: json["location"],
        links: json["links"] == null ? null : UserLinks.fromJson(json["links"]),
        profileImage: json["profile_image"] == null ? null : ProfileImage.fromJson(json["profile_image"]),
        instagramUsername: json["instagram_username"],
        totalCollections: json["total_collections"],
        totalLikes: json["total_likes"],
        totalPhotos: json["total_photos"],
        acceptedTos: json["accepted_tos"],
        forHire: json["for_hire"],
        social: json["social"] == null ? null : Social.fromJson(json["social"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "updated_at": updatedAt?.toIso8601String(),
        "username": username,
        "name": name,
        "first_name": firstName,
        "last_name": lastName,
        "twitter_username": twitterUsername,
        "portfolio_url": portfolioUrl,
        "bio": bio,
        "location": location,
        "links": links?.toJson(),
        "profile_image": profileImage?.toJson(),
        "instagram_username": instagramUsername,
        "total_collections": totalCollections,
        "total_likes": totalLikes,
        "total_photos": totalPhotos,
        "accepted_tos": acceptedTos,
        "for_hire": forHire,
        "social": social?.toJson(),
    };
}

class UserLinks {
    String? self;
    String? html;
    String? photos;
    String? likes;
    String? portfolio;
    String? following;
    String? followers;

    UserLinks({
        this.self,
        this.html,
        this.photos,
        this.likes,
        this.portfolio,
        this.following,
        this.followers,
    });

    factory UserLinks.fromJson(Map<String, dynamic> json) => UserLinks(
        self: json["self"],
        html: json["html"],
        photos: json["photos"],
        likes: json["likes"],
        portfolio: json["portfolio"],
        following: json["following"],
        followers: json["followers"],
    );

    Map<String, dynamic> toJson() => {
        "self": self,
        "html": html,
        "photos": photos,
        "likes": likes,
        "portfolio": portfolio,
        "following": following,
        "followers": followers,
    };
}

class ProfileImage {
    String? small;
    String? medium;
    String? large;

    ProfileImage({
        this.small,
        this.medium,
        this.large,
    });

    factory ProfileImage.fromJson(Map<String, dynamic> json) => ProfileImage(
        small: json["small"],
        medium: json["medium"],
        large: json["large"],
    );

    Map<String, dynamic> toJson() => {
        "small": small,
        "medium": medium,
        "large": large,
    };
}

class Social {
    String? instagramUsername;
    String? portfolioUrl;
    String? twitterUsername;
    dynamic paypalEmail;

    Social({
        this.instagramUsername,
        this.portfolioUrl,
        this.twitterUsername,
        this.paypalEmail,
    });

    factory Social.fromJson(Map<String, dynamic> json) => Social(
        instagramUsername: json["instagram_username"],
        portfolioUrl: json["portfolio_url"],
        twitterUsername: json["twitter_username"],
        paypalEmail: json["paypal_email"],
    );

    Map<String, dynamic> toJson() => {
        "instagram_username": instagramUsername,
        "portfolio_url": portfolioUrl,
        "twitter_username": twitterUsername,
        "paypal_email": paypalEmail,
    };
}

class ResultTopicSubmissions {
    BusinessWork? people;
    BusinessWork? businessWork;

    ResultTopicSubmissions({
        this.people,
        this.businessWork,
    });

    factory ResultTopicSubmissions.fromJson(Map<String, dynamic> json) => ResultTopicSubmissions(
        people: json["people"] == null ? null : BusinessWork.fromJson(json["people"]),
        businessWork: json["business-work"] == null ? null : BusinessWork.fromJson(json["business-work"]),
    );

    Map<String, dynamic> toJson() => {
        "people": people?.toJson(),
        "business-work": businessWork?.toJson(),
    };
}
