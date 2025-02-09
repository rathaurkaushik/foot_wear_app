import 'package:flutter/material.dart';

class ProductDesign extends StatelessWidget {
  final String productImageUrl;
  final String productName;
  final double productPrice;
  final String offerTag;
  final VoidCallback onTap;

  const ProductDesign({
    super.key,
    required this.productImageUrl,
    required this.productName,
    required this.productPrice,
    required this.offerTag,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return
      Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 3,
      shadowColor: Colors.grey.withOpacity(0.2),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image with Offer Tag
              Expanded(
                flex: 3, // Ensures image takes dynamic space
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        productImageUrl,
                        height: screenHeight * 0.20, // Responsive height
                        width: double.infinity,
                        fit: BoxFit.contain,
                      ),
                    ),
                    if (offerTag.isNotEmpty)
                      Positioned(
                        top: 8,
                        left: 8,
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                          decoration: BoxDecoration(
                            color: Colors.red.shade600,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            offerTag,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),

              const SizedBox(height: 8),

              // Product Name
              Expanded(
                flex: 1, // Ensures text adapts properly
                child: Text(
                  productName,
                  // maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: screenWidth < 600 ? 14 : 16,
                    color: Colors.black,
                  ),
                ),
              ),

              // const SizedBox(height: 3),

              // Product Price
              Text(
                'Rs ${productPrice.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: screenWidth < 600 ? 14 : 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.teal.shade700,
                ),
              ),

              const SizedBox(height: 6),

              // Buy Now Button
              Expanded(
                flex: 1, // Ensures button takes proper space
                child: SizedBox(
                  width: double.infinity,
                  child: InkWell(
                    onTap: onTap,
                    child: Container(
                     decoration: BoxDecoration(
                         color: Colors.blueAccent,
                         borderRadius: BorderRadius.circular(14)),
                      child: Center(
                        child: const Text(
                          'Buy Now',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
