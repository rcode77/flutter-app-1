import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:fl_chart/fl_chart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    void navigateToHome() {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    }

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xFF97c64d), // Warna latar belakang
          image: DecorationImage(
            image: AssetImage("assets/1.png"), // Path gambar
            fit: BoxFit
                .fitWidth, // Lebar penuh, tinggi bisa menyisakan ruang kosong
            alignment: Alignment.topCenter, // Pusatkan ke atas
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 20),
                  TextField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.7),
                      hintText: 'Username',
                      prefixIcon: Icon(Icons.person, color: Colors.blue),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.7),
                      hintText: 'Password',
                      prefixIcon: Icon(Icons.lock, color: Colors.blue),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: navigateToHome,
                    style: ElevatedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(
                            color: Colors.white, width: 2), // Border putih
                      ),
                      backgroundColor:
                          Colors.blue.withOpacity(0.5), // Warna tombol biru
                    ),
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white, // Warna teks putih
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomePage(), // Updated Home Page
    DashboardPage(), // Dashboard Page
    ProfilePage(), // Profile Page
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _getTitle(_currentIndex),
          style: TextStyle(color: Colors.white),
        ), // Dynamic title
        // backgroundColor: Color(0xFF1ac8db),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            color: Colors.white,
            onPressed: () {
              // Handle notification click
            },
          ),
        ],
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
      ),
    );
  }

  String _getTitle(int index) {
    switch (index) {
      case 0:
        return 'Home Page';
      case 1:
        return 'Dashboard Page';
      case 2:
        return 'Profile Page';
      default:
        return 'Main Screen';
    }
  }
}

class HomePage extends StatelessWidget {
  final List<String> quotes = [
    "Stimulasi yang tepat sejak dini adalah investasi besar. Bukan untuk sekarang saja, tapi untuk masa depan mereka yang cerah.",
    "Belajar adalah harta yang akan mengikuti pemiliknya ke mana pun ia pergi.",
    "Pendidikan adalah senjata paling ampuh untuk mengubah dunia.",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/2.png'), // Gambar background
          fit: BoxFit.cover, // Agar gambar menutupi seluruh layar
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.4), // Atur opacity di sini (0.0 - 1.0)
            BlendMode.darken, // Mode pencampuran warna
          ),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Quote of the Day Section
            Container(
              margin: const EdgeInsets.all(16.0),
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                gradient: LinearGradient(
                  colors: [Colors.lightBlueAccent, Colors.blue],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                children: [
                  Text(
                    'Quote of the day',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Divider(
                      color: Colors.white,
                      thickness: 5,
                      endIndent: 50,
                      indent: 50),
                  SizedBox(height: 8),
                  CarouselSlider(
                    items: quotes.map((quote) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          children: [
                            Icon(Icons.format_quote,
                                color: Colors.redAccent, size: 40),
                            SizedBox(height: 8),
                            Text(
                              quote,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                    options: CarouselOptions(
                      height: 120,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      enableInfiniteScroll: true,
                      autoPlayInterval: Duration(seconds: 5),
                      viewportFraction: 0.9,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),

            // Top Feature Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Top Feature',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _featureCard(
                  context: context,
                  title: 'Educational Material',
                  icon: Icons.school,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EducationalMaterialPage()),
                    );
                  },
                ),
                _featureCard(
                  context: context,
                  title: 'Video Stimulasi',
                  icon: Icons.play_circle,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => VideoStimulasiPage()),
                    );
                  },
                ),
                _featureCard(
                  context: context,
                  title: 'Online Discussion',
                  icon: Icons.chat,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChatPage()),
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: 36),

            // Challenge Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Tantangan Pengetahuan Seru!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Scrollbar(
                thumbVisibility:
                    false, // Menyembunyikan scrollbar secara default
                radius: Radius.circular(
                    10), // Menambahkan sudut membulat pada scrollbar
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _scrollableChallengeCard(
                        title: 'Tumbuh Cerdas!',
                        description:
                            'Ikuti quiz seru ini dan temukan seberapa jauh Anda memahami tuberkulosis!',
                        buttonText: 'Mulai',
                        icon: Icons.lightbulb,
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => GoogleFormPage(
                                  formUrl:
                                      "https://docs.google.com/forms/d/e/1FAIpQLSegw5IwowS0l8FW_AMMhDumRdbspwXL8vbzWtZEoDrTL8UKDw/viewform?usp=header", // Pass the dynamic URL
                                ),
                              ));
                        },
                      ),
                      SizedBox(width: 12),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _featureCard({
    required BuildContext context,
    required String title,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap, // Menambahkan aksi klik
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, size: 40, color: Colors.blue),
          ),
          SizedBox(height: 8),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _scrollableChallengeCard(
      {required String title,
      required String description,
      required String buttonText,
      required IconData icon,
      required VoidCallback onTap}) {
    return Container(
      width: 250,
      height: 200, // Tinggi kartu tetap
      margin: EdgeInsets.symmetric(vertical: 8), // Tambahkan margin vertikal
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 4,
            spreadRadius: 2,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 40, color: Colors.blueAccent),
          SizedBox(height: 12),
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Expanded(
            child: Text(
              description,
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              maxLines: 3, // Batasi teks agar tidak overflow
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: onTap,
              child: Text(
                buttonText,
                style: TextStyle(
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class EducationalMaterialPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      // Background Image
      Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/2.png'), // Gambar background
              fit: BoxFit.cover, // Agar gambar menutupi seluruh layar
              colorFilter: ColorFilter.mode(
                Colors.black
                    .withOpacity(0.5), // Atur opacity di sini (0.0 - 1.0)
                BlendMode.darken, // Mode pencampuran warna
              ),
            ),
          ),
          child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                backgroundColor: Colors.blue,
                elevation: 0,
                leading: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                title: Text(
                  'Educational Material',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MaterialCard(
                        title: 'Materi 1',
                        description: 'Latar Belakang TBC',
                        pdfUrl:
                            'https://drive.google.com/file/d/152ABrb5p6y7VPKgMEnV8KHsful1V1IXn/view',
                      ),
                      SizedBox(height: 16),
                      MaterialCard(
                        title: 'Materi 2',
                        description: 'Jenis - Jenis Tuberkulosis',
                        pdfUrl:
                            'https://drive.google.com/file/d/1qzBMZnbiHh87frJMGPEc4C6hIDJAfSvw/view',
                      ),
                      SizedBox(height: 16),
                      MaterialCard(
                        title: 'Materi 3',
                        description: 'Tanda dan Gejala Tuberkulosis',
                        pdfUrl:
                            'https://drive.google.com/file/d/1Y_BtWYqvGp4JK_VaN43Rstbn-2M08Pw3/view',
                      ),
                      SizedBox(height: 16),
                      MaterialCard(
                        title: 'Materi 4',
                        description: 'Penularan Tuberkulosis',
                        pdfUrl:
                            'https://drive.google.com/file/d/1OazdTzuPFy1lp-eFcXqZxS4sjx3L9KIq/view',
                      ),
                      SizedBox(height: 16),
                      MaterialCard(
                        title: 'Materi 5',
                        description: 'Pencegahan Tuberkulosis',
                        pdfUrl:
                            'https://drive.google.com/file/d/1tVCEFQBY3ia6kxx-3eA39uilzpFaqzC_/view',
                      ),
                      SizedBox(height: 16),
                      MaterialCard(
                        title: 'Materi 6',
                        description:
                            'Hal yang Harus Dilakukan Jika Menemukan Orang dengan Tuberkulosis',
                        pdfUrl:
                            'https://drive.google.com/file/d/1U9t2zczLn2Dz1g2Ag8WQ3a9Rh0yWo8Jb/view',
                      ),
                      SizedBox(height: 16),
                      MaterialCard(
                        title: 'Materi 7',
                        description:
                            'Skrining Tuberculosis dan Investigasi Kontak',
                        pdfUrl:
                            'https://drive.google.com/file/d/1MtWd1TfkMvOeDkVcoUhWTDzHmN3OeGBM/view',
                      ),
                      SizedBox(height: 16),
                      MaterialCard(
                        title: 'Materi 8',
                        description:
                            'Penemuan Kasus TB Anak dengan Investigasi Kontak',
                        pdfUrl:
                            'https://drive.google.com/file/d/1a1K84R0fjw0fFKy93j_Rc927DcTq37DA/view',
                      ),
                      SizedBox(height: 16),
                      MaterialCard(
                        title: 'Materi 9',
                        description:
                            'Pemeriksaan Penunjang untuk Diagnosis TB Anak',
                        pdfUrl:
                            'https://drive.google.com/file/d/1n3bykli57msEX_3x4rJHsyAKj2qvOemj/view',
                      ),
                      SizedBox(height: 16),
                      MaterialCard(
                        title: 'Materi 10',
                        description: 'Jalur Diagnosis TBC pada Anak',
                        pdfUrl:
                            'https://drive.google.com/file/d/1U9mUeSjr-wfeGzzFRYXzvlSfkfmY6IMC/view',
                      ),
                      SizedBox(height: 16),
                      MaterialCard(
                        title: 'Materi 11',
                        description: 'Definisi TB Anak',
                        pdfUrl:
                            'https://drive.google.com/file/d/11Rh6QnG1LIi5-IlVsJCDQxJV3cjS7A54/view',
                      ),
                      SizedBox(height: 16),
                      MaterialCard(
                        title: 'Materi 12',
                        description: 'Tatalaksana TB Anak',
                        pdfUrl:
                            'https://drive.google.com/file/d/1RuJV_KN70pkT4os3LWXJA_AXmljObI-5/view',
                      ),
                      SizedBox(height: 16),
                      MaterialCard(
                        title: 'Materi 13',
                        description:
                            'Cara Meminum Obat Tuberkulosis yang Benar',
                        pdfUrl:
                            'https://drive.google.com/file/d/1DTLB1cYSjOC9_HMPf_zb7o8E-q7nE44F/view',
                      ),
                      SizedBox(height: 16),
                      MaterialCard(
                        title: 'Materi 14',
                        description: 'Pemantauan dan Evaluasi TB Anak',
                        pdfUrl:
                            'https://drive.google.com/file/d/1TDybOCo-qj98bLxfPQzw_gYatEF362nq/view',
                      ),
                    ],
                  ),
                ),
              )))
    ]);
  }
}

class VideoStimulasiPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      // Background Image
      Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/2.png'), // Gambar background
              fit: BoxFit.cover, // Agar gambar menutupi seluruh layar
              colorFilter: ColorFilter.mode(
                Colors.black
                    .withOpacity(0.5), // Atur opacity di sini (0.0 - 1.0)
                BlendMode.darken, // Mode pencampuran warna
              ),
            ),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.blue,
              elevation: 0,
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: Text(
                'Video Stimulasi',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  VideoCard(
                    title: 'Materi 1',
                    description: 'Apa itu TBC',
                    videoUrl: 'https://www.youtube.com/embed/G4142KR9A8I',
                    videoDesc:
                        'Kali ini, Palang Merah Indonesia kembali bekerja sama dengan Neuron dalam menyediakan konten yang dapat berguna buat kalian loh! Yuk, sama - sama pelajari apa sebenarnya TBC itu ;)',
                    asset: 'assets/video-1.png',
                  ),
                  SizedBox(height: 16),
                  VideoCard(
                    title: 'Materi 2',
                    description: 'Kenali Gejala TBC',
                    videoUrl: 'https://www.youtube.com/embed/RsBpFz5Gkxs',
                    videoDesc:
                        'Kenali Gejala TBC \n \nTBC adalah penyakit menular yang disebabkan oleh kuman TB (Mycobacterium Tuberculosis) yang menyerang tubuh manusia, terutama pada paru. TBC ditularkan melalui udara, bukan penyakit turunan dan bukan juga disebabkan oleh kutukan ataupun guna-guna. TBC dapat disembuhkan. \n \nSebagian besar kuman TB menyerang paru, tetapi dapat juga mengenai organ tubuh atau bagian tubuh lainnya seperti tulang, kelenjar, kulit, dan lain-lain. TBC dapat menyerang kepada siapa saja, terutama kepada usia produktif atau usia masih aktif bekerja (15-50 tahun) dan anak-anak. TBC dapat menyebabkan kematian apabila tidak segera diobati. \n \nGejala utama tbc yaitu batuk berdahak maupun tidak berdahak. Gejala lainnya yaitu terasa nyeri dada, demam meriang, badan lemas, nafsu makan berkurang, dan berat badan berkurang. Apabila ada salah satu atau lebih gejala tersebut, segera periksa ke Puskesmas.',
                    asset: 'assets/video-2.png',
                  ),
                  SizedBox(height: 16),
                  VideoCard(
                    title: 'Materi 3',
                    description:
                        'Cara Mendiagnosa Tuberkulosis Pada Anak Dengan Skoring TB',
                    videoUrl: 'https://www.youtube.com/embed/tiYGe1d3ywA',
                    videoDesc:
                        'Cara Mendiagnosa Tuberkulosis Pada Anak Dengan Skoring TB',
                    asset: 'assets/video-3.png',
                  ),
                  SizedBox(height: 16),
                  VideoCard(
                    title: 'Materi 4',
                    description: 'Langkah-langkah Pemeriksaan Pada TBC Anak',
                    videoUrl: 'https://www.youtube.com/embed/ECsrddqofRg',
                    videoDesc:
                        'Perhatikan Langkah-langkah Pemeriksaan Pada TBC Anak',
                    asset: 'assets/video-4.png',
                  ),
                  SizedBox(height: 16),
                  VideoCard(
                    title: 'Materi 5',
                    description:
                        'Apakah TBC Pada Anak Dapat Cepat Menular ke Anak Lain?',
                    videoUrl: 'https://www.youtube.com/embed/X73lc7_TeYw',
                    videoDesc:
                        'Apakah TBC Pada Anak Dapat Cepat Menular ke Anak Lain?',
                    asset: 'assets/video-5.png',
                  ),
                ],
              ),
            ),
          ))
    ]);
  }
}

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _controller = TextEditingController();
  List<String> _messages = []; // List to store chat messages

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _messages.add(_controller.text); // Add new message to list
      });
      _controller.clear(); // Clear the text field after sending
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Online Discussion',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Align(
                    alignment: index % 2 == 0
                        ? Alignment.centerLeft
                        : Alignment.centerRight,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                      decoration: BoxDecoration(
                        color: index % 2 == 0
                            ? Colors.blueAccent
                            : Colors.greenAccent,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        _messages[index],
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Type your message...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send, color: Colors.blue),
                  onPressed:
                      _sendMessage, // Send message when the button is pressed
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MaterialCard extends StatelessWidget {
  final String title;
  final String description;
  final String pdfUrl; // Tambahkan URL PDF

  MaterialCard({
    required this.title,
    required this.description,
    required this.pdfUrl,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PDFViewerPage(pdfUrl: pdfUrl),
          ),
        );
      },
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(8),
                ),
                child:
                    Icon(Icons.local_fire_department, color: Colors.blueAccent),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class VideoCard extends StatelessWidget {
  final String title;
  final String description;
  final String videoUrl;
  final String videoDesc;
  final String asset;

  VideoCard(
      {required this.title,
      required this.description,
      required this.videoUrl,
      required this.videoDesc,
      required this.asset});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => YouTubeViewerPage(
              videoUrl:
                  videoUrl, // Replace VIDEO_ID with the actual YouTube video ID
              description: videoDesc,
            ),
          ),
        );
      },
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                // child: Icon(Icons.video_label, color: Colors.blueAccent),
                child: Image.asset(
                  asset, // Ganti dengan path aset gambar kamu
                  width: 36, // Sesuaikan ukuran gambar
                  height: 36,
                  fit: BoxFit.contain, // Pastikan gambar tidak terpotong
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PDFViewerPage extends StatefulWidget {
  final String pdfUrl;

  PDFViewerPage({required this.pdfUrl});

  @override
  _PDFViewerPageState createState() => _PDFViewerPageState();
}

class _PDFViewerPageState extends State<PDFViewerPage> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    // Initialize WebViewController
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted) // Enable JavaScript
      ..setBackgroundColor(const Color(0x00000000)) // Transparent background
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            debugPrint('Page started loading: $url');
          },
          onPageFinished: (String url) {
            debugPrint('Page finished loading: $url');
          },
          onWebResourceError: (WebResourceError error) {
            debugPrint('Error: $error');
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.pdfUrl)); // Load the PDF URL
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'PDF Viewer',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: WebViewWidget(
          controller: _controller), // Use WebViewWidget with controller
    );
  }
}

class YouTubeViewerPage extends StatefulWidget {
  final String videoUrl; // YouTube embed URL
  final String description; // Video description

  YouTubeViewerPage({
    required this.videoUrl,
    required this.description,
  });

  @override
  _YouTubeViewerPageState createState() => _YouTubeViewerPageState();
}

class _YouTubeViewerPageState extends State<YouTubeViewerPage> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    // Initialize WebViewController for YouTube
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted) // Enable JavaScript
      ..setBackgroundColor(const Color(0x00000000)) // Transparent background
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            debugPrint('Page started loading: $url');
          },
          onPageFinished: (String url) {
            debugPrint('Page finished loading: $url');
          },
          onWebResourceError: (WebResourceError error) {
            debugPrint('Error: $error');
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.videoUrl)); // Load YouTube video URL
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'YouTube Video',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // YouTube video embed using WebView
            Container(
              height: 200, // Set the height for the video
              child: WebViewWidget(controller: _controller),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Description Text
                  Text(
                    widget.description,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[700],
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines:
                        30, // Limit the number of lines if the description is long
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GoogleFormPage extends StatefulWidget {
  final String formUrl; // Parameter to accept the URL

  GoogleFormPage({required this.formUrl}); // Constructor to receive the URL

  @override
  _GoogleFormPageState createState() => _GoogleFormPageState();
}

class _GoogleFormPageState extends State<GoogleFormPage> {
  late WebViewController _controller;

  @override
  void initState() {
    super.initState();
    // Initialize WebView controller
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted) // Enable JavaScript
      ..loadRequest(Uri.parse(widget.formUrl)); // Load Google Form URL
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Google Form',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: WebViewWidget(
        controller: _controller, // Pass WebViewController here
      ),
    );
  }
}

// Dashboard Section
class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  String? selectedEmotion;
  Map<String, List<String>> socialInteractionData = {
    "Bermain dengan keluarga": [],
    "Bermain dengan mainan": [],
    "Bermain dengan teman": [],
  };
  List<String> developmentNotes = [];
  TextEditingController customNoteController = TextEditingController();

  void addCustomNote() {
    if (customNoteController.text.isNotEmpty) {
      setState(() {
        developmentNotes.add(customNoteController.text);
        customNoteController.clear();
      });
    }
  }

  void updateSocialInteraction(String category, List<String> selections) {
    setState(() {
      socialInteractionData[category] = selections;
    });
  }

  void navigateToCheckboxPage(String category) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CheckboxPage(
          category: category,
          selectedItems: socialInteractionData[category] ?? [],
          onSelectionsChanged: (selections) =>
              updateSocialInteraction(category, selections),
        ),
      ),
    );
  }

  void navigateToCatatanPerkembangan() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CatatanPerkembanganPage(
          emotion: selectedEmotion,
          socialInteractions: socialInteractionData,
          notes: developmentNotes,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/2.png'), // Gambar background
            fit: BoxFit.cover, // Agar gambar menutupi seluruh layar
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.5), // Atur opacity di sini (0.0 - 1.0)
              BlendMode.darken, // Mode pencampuran warna
            ),
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Profile Section
                ProfileSection(),
                SizedBox(height: 24),

                // Emotional Range Section
                // Text(
                //   'Emotional Range',
                //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                // ),
                // SizedBox(height: 16),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   children: [
                //     _emotionCard('Bahagia', '😊'),
                //     _emotionCard('Sedih', '😢'),
                //     _emotionCard('Marah', '😡'),
                //   ],
                // ),
                // SizedBox(height: 32),

                // Interaksi Sosial Section
                // Text(
                //   'Interaksi Sosial',
                //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                // ),
                // SizedBox(height: 16),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   children: [
                //     _socialInteractionCard(
                //         'Bermain dengan keluarga', Colors.orange),
                //     _socialInteractionCard('Bermain dengan mainan', Colors.pink),
                //     _socialInteractionCard('Bermain dengan teman', Colors.green),
                //   ],
                // ),
                // SizedBox(height: 32),

                // Line Chart sebelum tombol "Lihat Riwayat Kesehatan"
                Text(
                  'Catatan Berat Badan (Bulan 0-24)',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(height: 16),
                WeightChart(),
                SizedBox(height: 24),

                Text(
                  'Catatan Berat Badan (Bulan 25-60)',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(height: 16),
                WeightChart2(),
                SizedBox(height: 32),

                // Riwayat Kesehatan Section
                Text(
                  'Riwayat Kesehatan',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                TextField(
                  controller: customNoteController,
                  maxLines: 3,
                  decoration: InputDecoration(
                    hintText: 'Tambahkan Riwayat Kesehatan',
                    hintStyle: TextStyle(color: Colors.white70),
                    border: OutlineInputBorder(),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: addCustomNote,
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF1ac8db),
                    padding: EdgeInsets.symmetric(vertical: 12),
                  ),
                  child: Center(
                    child: Text(
                      'Catat',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 32),

                // Navigate to Riwayat Kesehatan
                ElevatedButton(
                  onPressed: navigateToCatatanPerkembangan,
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blueAccent,
                    padding: EdgeInsets.symmetric(vertical: 12),
                  ),
                  child: Center(
                    child: Text(
                      'Lihat Riwayat Kesehatan',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Widget _emotionCard(String title, String emoji) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedEmotion = title;
        });
      },
      child: Column(
        children: [
          CircleAvatar(
            radius: 36,
            backgroundColor: selectedEmotion == title
                ? Colors.blueAccent
                : Colors.yellow[100],
            child: Text(
              emoji,
              style: TextStyle(fontSize: 32),
            ),
          ),
          SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  Widget _socialInteractionCard(String title, Color color) {
    return GestureDetector(
      onTap: () {
        navigateToCheckboxPage(title);
      },
      child: Container(
        width: 100,
        height: 120, // Menentukan tinggi tetap untuk kartu
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // Pusatkan konten secara vertikal
          children: [
            Icon(Icons.people,
                color: Colors.white, size: 36), // Sesuaikan ukuran ikon
            SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WeightChart extends StatefulWidget {
  @override
  _WeightChartState createState() => _WeightChartState();
}

class _WeightChartState extends State<WeightChart> {
  int selectedMonth = 0; // Default bulan ke-0
  TextEditingController weightController = TextEditingController();
  List<FlSpot> weightData = []; // Data berat badan dalam bentuk titik chart

  void addWeightData() {
    double? weight = double.tryParse(weightController.text);
    if (weight != null) {
      setState(() {
        weightData.add(FlSpot(selectedMonth.toDouble(), weight));
        weightData.sort(
            (a, b) => a.x.compareTo(b.x)); // Urutkan data berdasarkan bulan
        weightController.clear(); // Kosongkan input setelah memasukkan data
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // TextField di kiri & Dropdown di kanan
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Berat Badan (kg)",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  SizedBox(
                    height: 48, // Menyamakan tinggi
                    child: TextField(
                      controller: weightController,
                      keyboardType: TextInputType.number,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Colors.blueAccent),
                        ),
                        hintText: "Contoh: 5.2",
                        hintStyle: TextStyle(color: Colors.white70),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 16), // Jarak antara textfield & dropdown
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Pilih Bulan",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  SizedBox(
                    height: 48, // Menyamakan tinggi
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: DropdownButton<int>(
                        value: selectedMonth,
                        dropdownColor: Colors.black,
                        icon: Icon(Icons.arrow_drop_down, color: Colors.white),
                        items: List.generate(
                            25,
                            (index) => DropdownMenuItem(
                                value: index,
                                child: Text("$index",
                                    style: TextStyle(color: Colors.white)))),
                        onChanged: (value) =>
                            setState(() => selectedMonth = value!),
                        isExpanded: true,
                        underline: SizedBox(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 16),
        // Button di kanan
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              onPressed: addWeightData,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                foregroundColor: Colors.white,
              ),
              child: Text("Tambahkan Data"),
            ),
          ],
        ),
        SizedBox(height: 32),
        // Grafik
        SizedBox(
          height: 250,
          child: LineChart(
            LineChartData(
              gridData: FlGridData(
                show: true,
                getDrawingHorizontalLine: (value) => FlLine(
                  color: Colors.white.withOpacity(0.2),
                  strokeWidth: 1,
                ),
                getDrawingVerticalLine: (value) => FlLine(
                  color: Colors.white.withOpacity(0.2),
                  strokeWidth: 1,
                ),
              ),
              titlesData: FlTitlesData(
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 40,
                    getTitlesWidget: (value, meta) => Text(
                      "${value.toInt()}",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, meta) => Text(
                      "${value.toInt()}",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                    interval: 3,
                  ),
                ),
                rightTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                topTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
              ),
              borderData: FlBorderData(
                show: true,
                border: Border.all(color: Colors.white),
              ),
              lineBarsData: [
                LineChartBarData(
                  spots: weightData,
                  isCurved: true,
                  color: Colors.white,
                  barWidth: 3,
                  isStrokeCapRound: true,
                  belowBarData: BarAreaData(
                    show: true,
                    color: Colors.white.withOpacity(0.2),
                  ),
                ),
              ],
              minX: 0,
              maxX: 24,
              minY: 0,
              maxY: 15,
            ),
          ),
        ),
      ],
    );
  }
}

class WeightChart2 extends StatefulWidget {
  @override
  _WeightChartState2 createState() => _WeightChartState2();
}

class _WeightChartState2 extends State<WeightChart2> {
  int selectedMonth = 25; // Default bulan ke-25
  TextEditingController weightController = TextEditingController();
  List<FlSpot> weightData = []; // Data berat badan dalam bentuk titik chart

  void addWeightData() {
    double? weight = double.tryParse(weightController.text);
    if (weight != null) {
      setState(() {
        weightData.add(FlSpot(selectedMonth.toDouble(), weight));
        weightData.sort(
            (a, b) => a.x.compareTo(b.x)); // Urutkan data berdasarkan bulan
        weightController.clear(); // Kosongkan input setelah memasukkan data
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // TextField di kiri & Dropdown di kanan
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Berat Badan (kg)",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  SizedBox(
                    height: 48, // Menyamakan tinggi
                    child: TextField(
                      controller: weightController,
                      keyboardType: TextInputType.number,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Colors.blueAccent),
                        ),
                        hintText: "Contoh: 5.2",
                        hintStyle: TextStyle(color: Colors.white70),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 16), // Jarak antara textfield & dropdown
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Pilih Bulan",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  SizedBox(
                    height: 48, // Menyamakan tinggi
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: DropdownButton<int>(
                        value: selectedMonth,
                        dropdownColor: Colors.black,
                        icon: Icon(Icons.arrow_drop_down, color: Colors.white),
                        items: List.generate(
                            36, // Dari 25 hingga 60 (36 angka)
                            (index) => DropdownMenuItem(
                                value: 25 + index,
                                child: Text("${25 + index}",
                                    style: TextStyle(color: Colors.white)))),
                        onChanged: (value) =>
                            setState(() => selectedMonth = value!),
                        isExpanded: true,
                        underline: SizedBox(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 16),
        // Button di kanan
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              onPressed: addWeightData,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                foregroundColor: Colors.white,
              ),
              child: Text("Tambahkan Data"),
            ),
          ],
        ),
        SizedBox(height: 32),
        // Grafik
        SizedBox(
          height: 250,
          child: LineChart(
            LineChartData(
              gridData: FlGridData(
                show: true,
                getDrawingHorizontalLine: (value) => FlLine(
                  color: Colors.white.withOpacity(0.2),
                  strokeWidth: 1,
                ),
                getDrawingVerticalLine: (value) => FlLine(
                  color: Colors.white.withOpacity(0.2),
                  strokeWidth: 1,
                ),
              ),
              titlesData: FlTitlesData(
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 40,
                    getTitlesWidget: (value, meta) => Text(
                      "${value.toInt()}",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, meta) => Text(
                      "${value.toInt()}",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                    interval: 5, // Menampilkan label per 5 bulan
                  ),
                ),
                rightTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                topTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
              ),
              borderData: FlBorderData(
                show: true,
                border: Border.all(color: Colors.white),
              ),
              lineBarsData: [
                LineChartBarData(
                  spots: weightData,
                  isCurved: true,
                  color: Colors.white,
                  barWidth: 3,
                  isStrokeCapRound: true,
                  belowBarData: BarAreaData(
                    show: true,
                    color: Colors.white.withOpacity(0.2),
                  ),
                ),
              ],
              minX: 25, // Ubah batas bawah X jadi 25
              maxX: 60, // Ubah batas atas X jadi 60
              minY: 0,
              maxY: 15,
            ),
          ),
        ),
      ],
    );
  }
}

class ProfileSection extends StatefulWidget {
  @override
  _ProfileSectionState createState() => _ProfileSectionState();
}

class _ProfileSectionState extends State<ProfileSection> {
  String name = ""; // Nama awal kosong
  String age = ""; // Usia awal kosong
  bool isEditing = false; // Mode Edit Profile

  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: isEditing
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: 'Nama',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 8),
                TextField(
                  controller: ageController,
                  decoration: InputDecoration(
                    labelText: 'Usia',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          name = nameController.text; // Simpan nama
                          age = ageController.text; // Simpan usia
                          isEditing = false; // Keluar dari mode edit
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue, // Warna tombol submit
                      ),
                      child:
                          Text('Submit', style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              ],
            )
          : Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name.isNotEmpty ? name : 'Nama belum diisi',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        age.isNotEmpty ? '$age Tahun' : 'Usia belum diisi',
                        style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isEditing = true; // Masuk ke mode edit
                      nameController.text =
                          name; // Isi input dengan data sebelumnya
                      ageController.text = age;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blueAccent, // Warna tombol edit
                  ),
                  child: Text('Edit Profile',
                      style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
    );
  }
}

class CheckboxPage extends StatefulWidget {
  final String category;
  final List<String> selectedItems;
  final Function(List<String>) onSelectionsChanged;

  CheckboxPage({
    required this.category,
    required this.selectedItems,
    required this.onSelectionsChanged,
  });

  @override
  _CheckboxPageState createState() => _CheckboxPageState();
}

class _CheckboxPageState extends State<CheckboxPage> {
  List<String> options = ['Option 1', 'Option 2', 'Option 3', 'Option 4'];
  late List<String> selectedOptions;

  @override
  void initState() {
    super.initState();
    selectedOptions = List.from(widget.selectedItems);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category),
      ),
      body: ListView(
        children: options.map((option) {
          return CheckboxListTile(
            title: Text(option),
            value: selectedOptions.contains(option),
            onChanged: (isSelected) {
              setState(() {
                if (isSelected == true) {
                  selectedOptions.add(option);
                } else {
                  selectedOptions.remove(option);
                }
              });
              widget.onSelectionsChanged(selectedOptions);
            },
          );
        }).toList(),
      ),
    );
  }
}

class CatatanPerkembanganPage extends StatelessWidget {
  final String? emotion;
  final Map<String, List<String>> socialInteractions;
  final List<String> notes;

  CatatanPerkembanganPage({
    required this.emotion,
    required this.socialInteractions,
    required this.notes,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Riwayat Kesehatan',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Text('Emosi Terpilih: ${emotion ?? "Belum dipilih"}',
            //     style: TextStyle(fontSize: 16)),
            // SizedBox(height: 16),
            // ...socialInteractions.entries.map((entry) {
            //   return Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Text(entry.key,
            //           style: TextStyle(fontWeight: FontWeight.bold)),
            //       ...entry.value.map((item) => Text('- $item')),
            //       SizedBox(height: 8),
            //     ],
            //   );
            // }).toList(),
            SizedBox(height: 12),
            Text('Catatan Riwayat Kesehatan :',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ...notes.map((note) => Text('- $note')),
          ],
        ),
      ),
    );
  }
}

// Profile Section
class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/2.png'), // Gambar background
          fit: BoxFit.cover, // Agar gambar menutupi seluruh layar
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.5), // Atur opacity di sini (0.0 - 1.0)
            BlendMode.darken, // Mode pencampuran warna
          ),
        ),
      ),
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
            ),
            SizedBox(height: 16),
            Text(
              'Full Name',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color:
                    Colors.white, // Warna teks agar kontras dengan background
              ),
            ),
            SizedBox(height: 16),
            Divider(color: Colors.white), // Divider agar lebih terlihat
            _buildListTile(Icons.person, 'Personal Information', context),
            _buildListTile(Icons.settings, 'Settings', context),
            _buildListTile(Icons.help, 'Help Center', context),
            _buildListTile(Icons.logout, 'Log Out', context, isLogout: true),
          ],
        ),
      ),
    );
  }

  Widget _buildListTile(IconData icon, String title, BuildContext context,
      {bool isLogout = false}) {
    return ListTile(
      leading: Icon(icon, color: isLogout ? Colors.red : Colors.white),
      title: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
      trailing: Icon(Icons.arrow_forward_ios, color: Colors.white),
      onTap: () {
        if (isLogout) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LoginPage()),
          );
        }
      },
    );
  }
}
