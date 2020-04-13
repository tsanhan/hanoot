import 'package:food4good_app/app/data/model/product.dart';

List<Product> _milk = [
  Product(
      name: "חלב טרי",
      price: 5.90,
      unitName: "ליטר",
      units: 1,
      image: "https://www.tara.co.il/wp-content/uploads/2018/01/milk_3-1.png"
  ),
  Product(
      name: "חלב טרי",
      price: 5.90,
      unitName: "ליטר",
      units: 1,
      image: "https://www.tara.co.il/wp-content/uploads/2018/01/milk_3-1.png"
  ),
  Product(
      name: "חלב טרי",
      price: 5.90,
      unitName: "ליטר",
      units: 1,
      image: "https://www.tara.co.il/wp-content/uploads/2018/01/milk_3-1.png"
  ),
  Product(
      name: "חלב טרי",
      price: 5.90,
      unitName: "ליטר",
      units: 1,
      image: "https://www.tara.co.il/wp-content/uploads/2018/01/milk_3-1.png"
  ),
  Product(
      name: "חלב טרי",
      price: 5.90,
      unitName: "ליטר",
      units: 1,
      image: "https://www.tara.co.il/wp-content/uploads/2018/01/milk_3-1.png"
  ),
];

List<Product> _fruits = [
  Product(
      name: "תפוח",
      price: 12.90,
      unitName: "ק\"ג",
      units: 1,
      image: "https://www.tara.co.il/wp-content/uploads/2018/01/milk_3-1.png"
  ),
  Product(
      name: "תפוח",
      price: 14.90,
      unitName: "ק\"ג",
      units: 1,
      image: "https://www.tara.co.il/wp-content/uploads/2018/01/milk_3-1.png"
  ),
  Product(
      name: "תפוח",
      price: 14.90,
      unitName: "ק\"ג",
      units: 1,
      image: "https://www.tara.co.il/wp-content/uploads/2018/01/milk_3-1.png"
  ),
];

List<Product> _veggies = [
  Product(
      name: "מלפפון",
      price: 0.60,
      unitName: "ק\"ג",
      units: 1,
      image: "https://res.cloudinary.com/quik/images/w_140,q_auto/quik/prod/assets/imgs/productsXL/187/%20%D7%9E%D7%9C%D7%A4%D7%A4%D7%95%D7%9F%201%20%D7%A7%20%D7%92.png"
  ),
  Product(
      name: "גזר ארוז",
      price: 0.51,
      unitName: "ק\"ג",
      units: 1,
      image: "https://res.cloudinary.com/quik/images/w_140,q_auto/quik/prod/assets/imgs/productsXL/151/%20%D7%92%D7%96%D7%A8%20%D7%90%D7%A8%D7%95%D7%96%201%20%D7%A7%20%D7%92.png"
  ),
  Product(
      name: "עגבנייות מובחרות",
      price: 0.69,
      unitName: "ק\"ג",
      units: 1,
      image: "https://res.cloudinary.com/quik/images/w_180,q_auto/quik/prod/assets/imgs/productsXL/197/%20%D7%A2%D7%92%D7%91%D7%A0%D7%99%D7%95%D7%AA%20%D7%9E%D7%95%D7%91%D7%97%D7%A8%D7%95%D7%AA%201%20%D7%A7%20%D7%92.png"
  ),
];

List<Product> _meat = [
  Product(
      name: "נקניקיות פרנקפורטר",
      price: 7.78,
      unitName: "גרם",
      units: 320,
      image: "https://res.cloudinary.com/quik/images/w_350,q_auto/quik/prod/assets/imgs/productsXL/7290003072828_1581239193855/%20%D7%A0%D7%A7%D7%A0%D7%99%D7%A7%D7%99%D7%95%D7%AA%20%D7%A4%D7%A8%D7%A0%D7%A7%D7%A4%D7%95%D7%A8%D7%98%D7%A8%20320%20%D7%92%D7%A8%D7%9D.png"
  ),
];

Map<String, Object> db = {
  "milk": _milk,
  "veggies": _veggies,
  "fruits": _fruits,
  "meat": _meat,
};