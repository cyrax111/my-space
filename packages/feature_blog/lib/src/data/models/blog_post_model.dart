import '../../domain/entities/blog_post.dart';

/// Data transfer model for [BlogPost].
///
/// Handles serialization to/from JSON and conversion to domain entity.
class BlogPostModel {
  final String id;
  final String title;
  final String slug;
  final String excerpt;
  final String content;
  final String author;
  final DateTime publishedAt;
  final DateTime updatedAt;
  final List<String> tags;
  final String? coverImageUrl;
  final bool isDraft;
  final int readTimeMinutes;

  const BlogPostModel({
    required this.id,
    required this.title,
    required this.slug,
    required this.excerpt,
    required this.content,
    required this.author,
    required this.publishedAt,
    required this.updatedAt,
    this.tags = const [],
    this.coverImageUrl,
    this.isDraft = false,
    this.readTimeMinutes = 0,
  });

  factory BlogPostModel.fromJson(Map<String, dynamic> json) {
    return BlogPostModel(
      id: json['id'] as String,
      title: json['title'] as String,
      slug: json['slug'] as String,
      excerpt: json['excerpt'] as String,
      content: json['content'] as String,
      author: json['author'] as String,
      publishedAt: DateTime.parse(json['published_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      tags: (json['tags'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      coverImageUrl: json['cover_image_url'] as String?,
      isDraft: json['is_draft'] as bool? ?? false,
      readTimeMinutes: json['read_time_minutes'] as int? ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'slug': slug,
        'excerpt': excerpt,
        'content': content,
        'author': author,
        'published_at': publishedAt.toIso8601String(),
        'updated_at': updatedAt.toIso8601String(),
        'tags': tags,
        'cover_image_url': coverImageUrl,
        'is_draft': isDraft,
        'read_time_minutes': readTimeMinutes,
      };

  /// Convert to domain entity.
  BlogPost toEntity() => BlogPost(
        id: id,
        title: title,
        slug: slug,
        excerpt: excerpt,
        content: content,
        author: author,
        publishedAt: publishedAt,
        updatedAt: updatedAt,
        tags: tags,
        coverImageUrl: coverImageUrl,
        isDraft: isDraft,
        readTimeMinutes: readTimeMinutes,
      );

  /// Create from domain entity.
  factory BlogPostModel.fromEntity(BlogPost post) => BlogPostModel(
        id: post.id,
        title: post.title,
        slug: post.slug,
        excerpt: post.excerpt,
        content: post.content,
        author: post.author,
        publishedAt: post.publishedAt,
        updatedAt: post.updatedAt,
        tags: post.tags,
        coverImageUrl: post.coverImageUrl,
        isDraft: post.isDraft,
        readTimeMinutes: post.readTimeMinutes,
      );
}
