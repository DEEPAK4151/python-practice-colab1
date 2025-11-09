import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Video {
  final String title;
  final String thumbnailUrl;
  final String videoUrl;

  const Video({required this.title, required this.thumbnailUrl, required this.videoUrl});
}

class VideosScreen extends StatelessWidget {
  const VideosScreen({super.key});

  final List<Video> dummyVideos = const [
    Video(
      title: 'Introduction to Homeopathy by Dr. Verma',
      thumbnailUrl: 'https://via.placeholder.com/150/A7D7C5/FFFFFF?text=Video+1',
      videoUrl: 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', // Replace with actual YouTube video URL
    ),
    Video(
      title: 'Homeopathic Treatment for Chronic Diseases',
      thumbnailUrl: 'https://via.placeholder.com/150/88B04B/FFFFFF?text=Video+2',
      videoUrl: 'https://www.youtube.com/watch?v=dQw4w9WgXcQ',
    ),
    Video(
      title: 'Q&A with Dr. S.N. Verma',
      thumbnailUrl: 'https://via.placeholder.com/150/6B8E23/FFFFFF?text=Video+3',
      videoUrl: 'https://www.youtube.com/watch?v=dQw4w9WgXcQ',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildSectionTitle(context, 'Recent Videos'),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: dummyVideos.length,
            itemBuilder: (context, index) {
              final video = dummyVideos[index];
              return _buildVideoCard(context, video);
            },
          ),
          const SizedBox(height: 24),
          _buildGradientButton(
            context,
            'Visit Dr. Verma\'s YouTube Channel',
            () async {
              final Uri youtubeUri = Uri.parse('https://www.youtube.com/your_channel_link'); // Replace with actual YouTube channel link
              if (await canLaunchUrl(youtubeUri)) {
                await launchUrl(youtubeUri);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Could not launch YouTube channel')),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.teal[700],
            ),
      ),
    );
  }

  Widget _buildVideoCard(BuildContext context, Video video) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 16.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: InkWell(
        onTap: () async {
          final Uri videoUri = Uri.parse(video.videoUrl);
          if (await canLaunchUrl(videoUri)) {
            await launchUrl(videoUri);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Could not launch video')),
            );
          }
        },
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
                video.title,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.green[700],
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGradientButton(
      BuildContext context, String text, VoidCallback onPressed) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.green.shade400, Colors.teal.shade400],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(30.0),
        boxShadow: [
          BoxShadow(
            color: Colors.green.shade200.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
        child: Text(
          text,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }
}
