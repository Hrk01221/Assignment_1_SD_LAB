import 'package:flutter/material.dart';
//This was made in chrome beacause my pc isnt capable of
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstPage(),
    );
  }
}


class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: AppBar(
          title: const Text(
            'Book List',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w100),
          ),
          centerTitle: true,
          backgroundColor: Colors.red,
          actions: <Widget>[
            IconButton(
              onPressed: (){

              },
              icon: const Icon(Icons.search),
            ),

            Container(
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),

            ),
          ],
          leading: IconButton(
            onPressed: () {},
            icon: IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {},
            ),
          ),
        ),
      ),
      body: Container(
        child: ListView(
          padding: const EdgeInsets.all(90.0),
          children: const [
            BookCard('Atomic Habits', 'James Clear', '4.8', 'assets/images/book1.jpg'),
            BookCard('Harry Potter and the philosophers Stone', 'J. K. Rowling', '4.7', 'assets/images/book1.jpeg'),
            BookCard('SILMANS Complete Endgame Course', 'Jeremy Silman', '4.3', 'assets/images/book2.jpeg'),
            BookCard('Competitive programmers handbook', 'Antti Laaksonen', '4.9', 'assets/images/book3.jpg'),
            BookCard('The Theory of Relativity', 'Albert Einstein', '4.3', 'assets/images/book4.jpeg'),
          ],
        ),
      ),
    );
  }
}

class BookCard extends StatelessWidget {
  final String bookName;
  final String authorName;
  final String rating;
  final String img;

  const BookCard(this.bookName, this.authorName, this.rating, this.img);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150, // Set a fixed height for the Card
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Card(
        child: ListTile(
          contentPadding: const EdgeInsets.all(40.0),
          leading: Image.network(
            img,
            width: 50,
            height: 50,
          ),
          title: Text(
            bookName,
            style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 4.0),
              Text(
                'Author: $authorName',
                style: const TextStyle(fontSize: 14.0),
              ),
              const SizedBox(height: 4.0),
              Text(
                'Rating: $rating',
                style: const TextStyle(fontSize: 14.0),
              ),
            ],
          ),
          trailing: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.redAccent,
              padding: const EdgeInsets.all(10.0),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BuyNowPage(bookName, authorName, rating, img),
                ),
              );
            },
            icon: const Icon(Icons.shopping_cart),
            label: const Text('Buy Now'),
          ),
        ),
      ),
    );
  }
}
//2nd page
class BuyNowPage extends StatelessWidget {
  final String bookName;
  final String authorName;
  final String rating;
  final String img;

  const BuyNowPage(this.bookName, this.authorName, this.rating, this.img);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: AppBar(
          title: const Text(
            'Buy Now',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w100),
          ),
          centerTitle: true,
          backgroundColor: Colors.red,
          actions: [
            IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                // Scalable
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: ClipRRect(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Left side: Image
                  Image.network(
                    img,
                    width: 400,
                    height: 440,
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 100.0, horizontal: 10.0),
                      child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            bookName,
                            style: const TextStyle(fontSize: 35, fontWeight: FontWeight.w100),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Author: $authorName',
                            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w100),
                          ),
                          const Text(
                            'Description: Best for Students',
                            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w100),
                          ),
                          Text(
                            'Rating: $rating',
                            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w100),
                          ),
                          const Text(
                            'Price: 300/=',
                            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w100),
                          ),

                          const SizedBox(height: 30,width: 40,),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepOrange,
                            ),
                            onPressed: () {},
                            child: const Text('Add to Cart'),
                          ),
                          const SizedBox(height: 30,width: 40,),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepOrange,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Go Back'),
                          ),
                          const SizedBox(height: 10),
                          DropdownButton<String>(
                            items: ['View Your Cart', 'Ongoing Orders', 'Previous Orders']
                                .map((String value) => DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            ))
                                .toList(),
                            onChanged: (String? value) {
                            },
                            hint: const Text('Others'),
                          ),

                          ],
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
