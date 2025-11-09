import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildDoctorPhoto(),
          const SizedBox(height: 16),
          _buildSectionTitle(context, 'Dr. S.N. Verma'),
          _buildQualifications(context),
          const SizedBox(height: 24),
          _buildSectionTitle(context, 'Clinic Information'),
          _buildClinicInfo(context),
          const SizedBox(height: 24),
          _buildSectionTitle(context, 'Contact & Social Media'),
          _buildContactLinks(context),
        ],
      ),
    );
  }

  Widget _buildDoctorPhoto() {
    return CircleAvatar(
      radius: 80,
      backgroundImage: NetworkImage('https://via.placeholder.com/150/A7D7C5/FFFFFF?text=Dr.+Verma'), // Replace with actual doctor's photo
      backgroundColor: Colors.green.shade100,
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.teal[700],
            ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildQualifications(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Qualifications:',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              '• BHMS (Bachelor of Homeopathic Medicine and Surgery)\n• MD (Homeopathy)\n• Certified Homeopathic Practitioner',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 16),
            Text(
              'Experience:',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'With over 15 years of experience, Dr. S.N. Verma has successfully treated numerous patients with various chronic and acute conditions using classical homeopathy.',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildClinicInfo(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Clinic Name: Verma Homeopathy Clinic',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text(
              'Address: 123, Homeopathy Lane, Wellness City, State - 123456',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 8),
            Text(
              'Hours: Mon-Sat: 10:00 AM - 6:00 PM',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 8),
            Text(
              'Phone: +91 XXXXXXXXXX',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 8),
            Text(
              'Email: dr.snverma@example.com',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactLinks(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildSocialButton(
              context,
              FontAwesomeIcons.youtube,
              'https://www.youtube.com/your_channel_link', // Replace with actual YouTube channel link
            ),
            _buildSocialButton(
              context,
              FontAwesomeIcons.whatsapp,
              'https://wa.me/91XXXXXXXXXX', // Replace with actual WhatsApp number
            ),
            _buildSocialButton(
              context,
              FontAwesomeIcons.facebook,
              'https://www.facebook.com/your_page_link', // Replace with actual Facebook page link
            ),
            _buildSocialButton(
              context,
              FontAwesomeIcons.instagram,
              'https://www.instagram.com/your_profile_link', // Replace with actual Instagram profile link
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialButton(
      BuildContext context, IconData icon, String url) {
    return IconButton(
      icon: Icon(icon, color: Colors.teal[700], size: 30),
      onPressed: () async {
        final Uri uri = Uri.parse(url);
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Could not launch $url')),
          );
        }
      },
    );
  }
}
