import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:share_plus/share_plus.dart';

class Blog {
  final String title;
  final String imageUrl;
  final String content; // For simplicity, we'll just share the title and image URL for now.

  const Blog({required this.title, required this.imageUrl, required this.content});
}

class BlogsScreen extends StatelessWidget {
  const BlogsScreen({super.key});

  final List<Blog> dummyBlogs = const [
    Blog(
      title: 'Understanding Homeopathy: A Beginner\'s Guide',
      imageUrl: 'https://via.placeholder.com/150/A7D7C5/FFFFFF?text=Blog+1',
      content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    ),
    Blog(
      title: 'Top 5 Homeopathic Remedies for Colds',
      imageUrl: 'https://via.placeholder.com/150/88B04B/FFFFFF?text=Blog+2',
      content: 'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
    ),
    Blog(
      title: 'Boosting Immunity Naturally with Homeopathy',
      imageUrl: 'https://via.placeholder.com/150/6B8E23/FFFFFF?text=Blog+3',
      content: 'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
    ),
    Blog(
      title: 'Homeopathy for Stress and Anxiety',
      imageUrl: 'https://via.placeholder.com/150/3CB371/FFFFFF?text=Blog+4',
      content: 'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: dummyBlogs.length,
      itemBuilder: (context, index) {
        final blog = dummyBlogs[index];
        return _buildBlogCard(context, blog);
      },
    );
  }

  Widget _buildBlogCard(BuildContext context, Blog blog) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 16.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
            child: Container(
              width: double.infinity,
              height: 180,
              color: Colors.grey[200],
              child: const Center(
                child: FlutterLogo(size: 100),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              blog.title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.green[700],
                  ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              blog.content,
              style: Theme.of(context).textTheme.bodyMedium,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                icon: Icon(Icons.share, color: Colors.teal[700]),
                onPressed: () {
                  Share.share('${blog.title}\n${blog.imageUrl}\n${blog.content}');
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
