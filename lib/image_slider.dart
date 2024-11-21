import 'package:flutter/material.dart';

class ImageSlider extends StatefulWidget {
  ImageSlider({Key? key}) : super(key: key);

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  final List<String> imageUrls = [
    'https://i.pinimg.com/736x/80/d6/59/80d6591c72e3747db435c1e441e7b9c5.jpg',
    'https://i.pinimg.com/736x/07/61/87/0761874d6c6619fc423407b0347438f9.jpg',
    'https://i.pinimg.com/736x/ea/dc/47/eadc477957d79b65744bc31e83552b56.jpg',
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xFFF8E5D2), 
        ),
        child: Column(
          children: [

            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Salma Amalia Zhafira - Tugas Assets',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF795540), 
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),

            Expanded(
              child: PageView.builder(
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index; 
                  });
                },
                itemCount: imageUrls.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 5.0,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.network(
                        imageUrls[index],
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(imageUrls.length, (index) {
                return AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  width: _currentIndex == index ? 12.0 : 8.0,
                  height: 8.0,
                  decoration: BoxDecoration(
                    color: _currentIndex == index ? Colors.blue : Colors.grey,
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                );
              }),
            ),
            SizedBox(height: 20.0), 
          ],
        ),
      ),
    );
  }
}
