import 'package:flutter/material.dart';

class ProductModel {
  final String? id;
  final String? name;
  final String? image;
  final int? originalPrice;
  final int? price;
  final double? review;
  final String? location;
  final String? tag;

  ProductModel({
    this.id,
    this.name,
    this.image,
    this.originalPrice,
    this.price,
    this.review,
    this.location,
    this.tag,
  });
}

List<ProductModel> allProducts = [
  ProductModel(
    id: '1',
    name: 'The Horizon Retreat',
    image: 'assets/images/the_horizon_retreat.jpg',
    price: 480,
    review: 4.5,
    location: 'Los Angeles, CA',
    tag: UniqueKey().toString(),
  ),
  ProductModel(
    id: '2',
    name: 'Opal Grove Inn',
    image: 'assets/images/opal_grove_inn.jpg',
    price: 190,
    review: 4.5,
    location: 'San Diego, CA',
    tag: UniqueKey().toString(),
  ),
  ProductModel(
    id: '3',
    name: 'Astra Grand Hotel',
    image: 'assets/images/astra_grand_hotel.jpg',
    price: 300,
    review: 4.5,
    location: 'New York, NY',
    tag: UniqueKey().toString(),
  ),
  ProductModel(
    id: '4',
    name: 'Serenity Sands',
    image: 'assets/images/serenity_sands.jpg',
    price: 270,
    review: 4.0,
    location: 'Honolulu, HI',
    tag: UniqueKey().toString(),
  ),
  ProductModel(
    id: '5',
    name: 'Elysian Suites',
    image: 'assets/images/elysian_suites.jpg',
    price: 320,
    review: 3.8,
    location: 'San Diego, CA',
    tag: UniqueKey().toString(),
  ),
  ProductModel(
    id: '6',
    name: 'Mystic Palms',
    image: 'assets/images/mystic_palms.jpg',
    price: 230,
    review: 4.0,
    location: 'Palm Springs, CA',
    tag: UniqueKey().toString(),
  ),
  ProductModel(
    id: '7',
    name: 'Sapphire Cove Hotel',
    image: 'assets/images/sapphire_cove_hotel.jpg',
    price: 290,
    review: 3.8,
    location: 'Key West, FL',
    tag: UniqueKey().toString(),
  ),
  ProductModel(
    id: '8',
    name: 'Tranquil Shores',
    image: 'assets/images/tranquil_shores.jpg',
    price: 120,
    review: 4.4,
    location: 'Santa Monica, CA',
    tag: UniqueKey().toString(),
  ),
  ProductModel(
    id: '9',
    name: 'Lumière Palace',
    image: 'assets/images/lumiere_palace.jpg',
    price: 248,
    review: 4.4,
    location: 'Las Vegas, NV',
    tag: UniqueKey().toString(),
  ),
  ProductModel(
    id: '10',
    name: 'Eliinate Galian Hotel',
    image: 'assets/images/eliinate_galian_hotel.jpg',
    price: 248,
    review: 4.4,
    location: 'Chestnut StreetRome, NY',
    tag: UniqueKey().toString(),
  ),
  ProductModel(
    id: '11',
    name: 'Cerulean Temple Hotel',
    image: 'assets/images/cerulean_temple_hotel.jpg',
    price: 156,
    review: 4.4,
    location: 'Chestnut StreetRome, NY',
    tag: UniqueKey().toString(),
  ),
  ProductModel(
    id: '12',
    name: 'Double Oak Hotel',
    image: 'assets/images/double_oak_hotel.jpg',
    price: 163,
    review: 4.4,
    location: 'Chestnut StreetRome, NY',
    tag: UniqueKey().toString(),
  ),
  ProductModel(
    id: '13',
    name: 'Jade Gem Resort',
    image: 'assets/images/jade_gem_resort.jpg',
    price: 211,
    review: 4.4,
    location: 'Chestnut StreetRome, NY',
    tag: UniqueKey().toString(),
  ),
];

List<ProductModel> mostPopularProducts = [
  ProductModel(
    id: '1',
    name: 'The Horizon Retreat',
    image: 'assets/images/the_horizon_retreat.jpg',
    price: 480,
    review: 4.5,
    location: 'Los Angeles, CA',
    tag: UniqueKey().toString(),
  ),
  ProductModel(
    id: '2',
    name: 'Opal Grove Inn',
    image: 'assets/images/opal_grove_inn.jpg',
    price: 190,
    review: 4.5,
    location: 'San Diego, CA',
    tag: UniqueKey().toString(),
  ),
  ProductModel(
    id: '3',
    name: 'Astra Grand Hotel',
    image: 'assets/images/astra_grand_hotel.jpg',
    price: 300,
    review: 4.5,
    location: 'New York, NY',
    tag: UniqueKey().toString(),
  ),
];

List<ProductModel> recommendedProducts = [
  ProductModel(
    id: '1',
    name: 'Serenity Sands',
    image: 'assets/images/serenity_sands.jpg',
    price: 270,
    review: 4.0,
    location: 'Honolulu, HI',
    tag: UniqueKey().toString(),
  ),
  ProductModel(
    id: '2',
    name: 'Elysian Suites',
    image: 'assets/images/elysian_suites.jpg',
    price: 320,
    review: 3.8,
    location: 'San Diego, CA',
    tag: UniqueKey().toString(),
  ),
];

List<ProductModel> bestTodayProducts = [
  ProductModel(
    id: '1',
    name: 'Tranquil Shores',
    image: 'assets/images/tranquil_shores.jpg',
    originalPrice: 199,
    price: 120,
    review: 4.4,
    location: 'Santa Monica, CA',
    tag: UniqueKey().toString(),
  ),
  ProductModel(
    id: '2',
    name: 'Lumière Palace',
    image: 'assets/images/lumiere_palace.jpg',
    originalPrice: 299,
    price: 248,
    review: 4.4,
    location: 'Las Vegas, NV',
    tag: UniqueKey().toString(),
  ),
];

List<ProductModel> myFavoriteProducts = [
  ProductModel(
    id: '1',
    name: 'Eliinate Galian Hotel',
    image: 'assets/images/eliinate_galian_hotel.jpg',
    price: 248,
    review: 4.4,
    location: 'Chestnut StreetRome, NY',
    tag: UniqueKey().toString(),
  ),
  ProductModel(
    id: '2',
    name: 'Cerulean Temple Hotel',
    image: 'assets/images/cerulean_temple_hotel.jpg',
    price: 156,
    review: 4.4,
    location: 'Chestnut StreetRome, NY',
    tag: UniqueKey().toString(),
  ),
  ProductModel(
    id: '3',
    name: 'Double Oak Hotel',
    image: 'assets/images/double_oak_hotel.jpg',
    price: 163,
    review: 4.4,
    location: 'Chestnut StreetRome, NY',
    tag: UniqueKey().toString(),
  ),
  ProductModel(
    id: '4',
    name: 'Jade Gem Resort',
    image: 'assets/images/jade_gem_resort.jpg',
    price: 211,
    review: 4.4,
    location: 'Chestnut StreetRome, NY',
    tag: UniqueKey().toString(),
  ),
];

List<ProductModel> recentlyViewedProducts = [
   ProductModel(
    id: '1',
    name: 'Mystic Palms',
    image: 'assets/images/mystic_palms.jpg',
    price: 230,
    review: 4.0,
    location: 'Palm Springs, CA',
    tag: UniqueKey().toString(),
  ),
  ProductModel(
    id: '2',
    name: 'Sapphire Cove Hotel',
    image: 'assets/images/sapphire_cove_hotel.jpg',
    price: 290,
    review: 3.8,
    location: 'Key West, FL',
    tag: UniqueKey().toString(),
  ),
  ProductModel(
    id: '3',
    name: 'Elysian Suites',
    image: 'assets/images/elysian_suites.jpg',
    price: 320,
    review: 3.8,
    location: 'San Diego, CA',
    tag: UniqueKey().toString(),
  ),
];

class CategoryModel {
  final String title;
  final String? icon;
  CategoryModel({required this.title, this.icon});
}

List<CategoryModel> categories = [
  CategoryModel(title: 'All'),
  CategoryModel(title: 'Villas', icon: 'assets/icons/villas.svg'),
  CategoryModel(title: 'Hotels', icon: 'assets/icons/hotels.svg'),
  CategoryModel(title: 'Apartments', icon: 'assets/icons/apartments.svg'),
];

List<ProductModel> recentSearches = [
  ProductModel( id: '1',name: 'Golden Sands Retreat', location: 'Clearwater, FL'),
  ProductModel( id: '2',name: 'Crystal Peak Lodge', location: 'Aspen, CO'),
  ProductModel( id: '3',name: 'Coral Bay Resort', location: 'Miami Beach, FL'),
];