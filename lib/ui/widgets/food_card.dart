part of 'widgets.dart';

class FoodCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(spreadRadius: 3, blurRadius: 15, color: Colors.black26),
        ],
      ),
      child: Column(
        children: [
          RatingStars(5),
        ],
      ),
    );
  }
}
