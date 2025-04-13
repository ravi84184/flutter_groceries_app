import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.store), label: "Shop"),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: "Explore"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: "Cart"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border), label: "Favourite"),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "Account",
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Location
              Row(
                children: [
                  Icon(Icons.location_on_outlined),
                  SizedBox(width: 8),
                  Text(
                    "Gandhinagar",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),

              // Search bar
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Search Store",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[100],
                ),
              ),

              SizedBox(height: 16),

              // Banner

              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  "assets/images/banner.png",
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 24),

              // Offer Section
              _buildSection(
                title: "Exclusive Offer",
                children: [
                  ProductCard(
                    image: 'assets/images/bananas.png',
                    name: "Organic Bananas",
                    quantity: "7pcs, Pricing",
                    price: "4.99",
                  ),
                  ProductCard(
                    image: 'assets/images/apple.png',
                    name: "Red Apple",
                    quantity: "1kg, Pricing",
                    price: "4.99",
                  ),
                ],
              ),
              SizedBox(height: 24),
              // Best Selling
              _buildSection(
                title: "Best Selling",
                children: [
                  ProductCard(
                    image: 'assets/images/strawberry.png',
                    name: "Fresh Strawberry",
                    quantity: "1kg, Pricing",
                    price: "10",
                  ),
                  ProductCard(
                    image: 'assets/images/celery.png',
                    name: "Fresh Celery",
                    quantity: "1kg, Pricing",
                    price: "4.99",
                  ),
                ],
              ),
              SizedBox(height: 24),

              // Category Section
              _buildSection(
                title: "Groceries",
                children: [
                  CategoryCard(
                    image: 'assets/images/pulses.png',
                    title: "Pulses",
                    color: Colors.orange[50]!,
                  ),
                  CategoryCard(
                    image: 'assets/images/rice.png',
                    title: "Rice",
                    color: Colors.green[50]!,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required List<Widget> children,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            TextButton(onPressed: () {}, child: Text("See all"))
          ],
        ),
        SizedBox(
          height: 16,
        ),
        Row(
          children: children
              .map(
                (child) => Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4),
                    child: child,
                  ),
                ),
              )
              .toList(),
        )
      ],
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String image;
  final String title;
  final Color color;
  const CategoryCard(
      {super.key,
      required this.image,
      required this.title,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            Image.asset(
              image,
              height: 40,
              width: 40,
            ),
            SizedBox(
              width: 12,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String image;
  final String name;
  final String quantity;
  final String price;
  const ProductCard(
      {super.key,
      required this.image,
      required this.name,
      required this.quantity,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[200]!),
          borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                image,
                height: 100,
                width: 100,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Text(
              quantity,
              style: TextStyle(color: Colors.grey[600]),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$$price',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(4),
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
