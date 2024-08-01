import 'package:food_pro/constant/images.dart';
import 'package:food_pro/model/food_model.dart';

// Descriptions
const String chickenBiryaniDes = 'Biryani is a celebratory rice and meat dish cherished in the Indian sub-continent. A traditional biryani consists of fluffy basmati rice layered over tender & succulent pieces of meat, accompanied with the mesmerizing aromas of spices, herbs & caramelized onions';
const String chickenNihariDes = 'It is traditionally prepared using chicken pieces, slow-cooked to perfection in a rich, flavorful gravy infused with a blend of aromatic spices. The dish is known for its tender chicken, velvety smooth gravy, and a depth of flavor that comes from hours of slow simmering.';
const String haleemDes = 'Traditionally Haleem is a slow-cooked dish that is smooth in texture. It is a mixture of several Pakistani staples, such as wheat and barley. It is traditionally prepared over the course of as much as five hours because the lentils and unique spices need to blend in with the minced meat effortlessly before serving.';
const String hotNsourSoupDes = 'The classic chicken soup consists of a clear chicken broth, often with pieces of chicken or vegetables; common additions are pasta, noodles, dumplings, or carrots, and grains such as rice and barley. Chicken soup is commonly considered a comfort food.';
const String nalliNihariDes = 'Nalli Nihari is a spicy flour-based Nalli stew made with fried onion, yogurt, ginger, garlic, and wheat flour. The aroma of mutton Nalli nihari is derived from a unique blend of Indian spices comprised of fennel seeds, cumin, coriander, cardamom, red chili, and other common spices.';
const String zingerBurgerDes = "Crispy, golden-brown chicken breast, seasoned to perfection and fried to crunchy perfection, topped with fresh lettuce, juicy tomatoes, and a tangy mayo sauce, all sandwiched between a soft, toasted bun. A zesty delight that's a true crowd-pleaser!";
const String pizzaDes = "A classic favorite with a twist! Our pepperoni pizza features a crispy, thin crust topped with a generous layer of tangy tomato sauce, melted mozzarella cheese, and spicy pepperoni slices. Baked to bubbly perfection, each bite offers a delicious combination of flavors and textures.";
const String beefSteakDes = "Succulent, tender beef steak, expertly grilled to your preferred level of doneness. Infused with a rich marinade of herbs and spices, this steak is served with a side of creamy mashed potatoes and a medley of seasonal vegetables. A hearty and satisfying choice for meat lovers.";
const String loadedFriesDes = "Golden, crispy fries smothered in a blend of melted cheddar and mozzarella cheeses, topped with crispy bacon bits, green onions, and a drizzle of tangy ranch dressing. Perfect for sharing or indulging all on your own, these loaded fries are the ultimate comfort food.";
const String noodlesDes = "A savory blend of tender, stir-fried noodles tossed with an array of fresh vegetables, including crisp bell peppers, crunchy carrots, and vibrant snow peas. Infused with a rich, umami-packed soy sauce, garlic, and ginger, and finished with a sprinkle of sesame seeds and green onions. Add your choice of protein—chicken, beef, shrimp, or tofu—for a personalized touch. A delightful, aromatic dish that brings the authentic flavors of China to your table.";

List<FoodModel> foodList = [
  FoodModel(
      name: 'Chicken Biryani',
      description: chickenBiryaniDes,
      type: 'Desi',
      calories: '360',
      price: '350',
      quantity: 20,
      image: chickenBiryaniImage,
      ingredients: ['Basmati Rice','Herbs','Saffron Infused Milk','Fried Onions','Gee']
  ),
  FoodModel(
      name: 'Chicken Nihari',
      description: chickenNihariDes,
      type: 'Desi',
      calories: '400',
      price: '550',
      quantity: 20,
      image: chickenNihariImage,
      ingredients: ['Herbs','Saffron Infused Milk','Fried Onions','Gee']
  ),
  FoodModel(
      name: 'Haleem',
      description: haleemDes,
      type: 'Desi',
      calories: '310',
      price: '280',
      quantity: 20,
      image: haleemImage,
      ingredients: ['Herbs','Saffron Infused Milk','Fried Onions','Gee']
  ),
  FoodModel(
      name: 'Hot n Sour Soup',
      description: hotNsourSoupDes,
      type: 'Chinese',
      calories: '310',
      price: '280',
      quantity: 20,
      image: hotNsourSoupImage,
      ingredients: ['Mushrooms','Tofu','Bamboo Shoots','Silky' ,'Egg ribbons']
  ),
  FoodModel(
      name: 'Nalli Nihari',
      description: nalliNihariDes,
      type: 'Desi',
      calories: '400',
      price: '800',
      quantity: 20,
      image: nalliNihariImage,
      ingredients: ['Herbs','Saffron Infused Milk','Fried Onions','Gee']
  ),
  FoodModel(
      name: 'Zinger Burger',
      description: zingerBurgerDes,
      type: 'Fast Food',
      calories: '400',
      price: '450',
      quantity: 20,
      image: zingerBurgerImage,
      ingredients: ['Soft Bun','Crispy Chicken','Ketchup']
  ),
  FoodModel(
      name: 'Beef Steak',
      description: beefSteakDes,
      type: 'Fast Food',
      calories: '300',
      price: '1800',
      quantity: 20,
      image: beefSteakImage,
      ingredients: ['Fresh Meat','Veges','Sauces']
  ),
  FoodModel(
      name: 'Pepperoni Pizza',
      description: pizzaDes,
      type: 'Fast Food',
      calories: '300',
      price: '1350',
      quantity: 20,
      image: pizzaImage,
      ingredients: ['Pepperoni','Chesse']
  ),
  FoodModel(
      name: 'Loaded Fries',
      description: loadedFriesDes,
      type: 'Fast Food',
      calories: '500',
      price: '800',
      quantity: 20,
      image: loadedFriesImage,
      ingredients: ['Fries','Sauces','Chicken','Chesse']
  ),
  FoodModel(
      name: 'Chinese Noodles',
      description: loadedFriesDes,
      type: 'Chinese',
      calories: '370',
      price: '750',
      quantity: 20,
      image: noodlesImage,
      ingredients: ['Stir-Fired Noodles','Vegas','Chicken','carrots']
  ),
];