part of 'widgets.dart';

class FoodCard extends StatelessWidget {
  final Food food;

  const FoodCard(this.food, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget imageFood() {
      return Container(
        height: 140,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          ),
          image: DecorationImage(
            image: NetworkImage(food.picturePath),
            fit: BoxFit.cover,
          ),
        ),
      );
    }

    Widget titleFood() {
      return Container(
        margin: const EdgeInsets.fromLTRB(12, 12, 12, 6),
        width: 200,
        child: Text(
          food.name,
          style: blackFontStyle2,
          maxLines: 1,
          overflow: TextOverflow.clip,
        ),
      );
    }

    Widget ratingFood() {
      return Padding(
        padding: const EdgeInsets.only(left: 12),
        child: RatingStars(food.rate),
      );
    }

    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            spreadRadius: 3,
            blurRadius: 15,
            color: Colors.black12,
          ),
        ],
      ),
      child: Column(
        children: [
          imageFood(),
          titleFood(),
          ratingFood(),
        ],
      ),
    );
  }
}
