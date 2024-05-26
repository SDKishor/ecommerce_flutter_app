import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/models/banner_model.dart';
import 'package:ecommerce_app/models/brand_model.dart';
import 'package:ecommerce_app/models/category_model.dart';
import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/routes/routes.dart';

class DummyData {
  List<CategoryModel> catagoryList = [
    CategoryModel(
      id: "",
      name: "Sports",
      image:
          "https://firebasestorage.googleapis.com/v0/b/flutterecommerce-c058a.appspot.com/o/Categories%2Ficons8-bowling-64.png?alt=media&token=baef79cc-428c-4914-804e-b32fcad27820",
      isFeatured: true,
    ),
    CategoryModel(
      id: "",
      name: "Furniture",
      image:
          "https://firebasestorage.googleapis.com/v0/b/flutterecommerce-c058a.appspot.com/o/Categories%2Ficons8-dining-chair-64.png?alt=media&token=c791a1b8-ffdd-449a-91c8-8bfe9225321e",
      isFeatured: true,
    ),
    CategoryModel(
      id: "",
      name: "Electronics",
      image:
          "https://firebasestorage.googleapis.com/v0/b/flutterecommerce-c058a.appspot.com/o/Categories%2Ficons8-smartphone-64.png?alt=media&token=e745fa6e-2421-4833-9c49-7568278081c3",
      isFeatured: true,
    ),
    CategoryModel(
      id: "",
      name: "Clothes",
      image:
          "https://firebasestorage.googleapis.com/v0/b/flutterecommerce-c058a.appspot.com/o/Categories%2Ficons8-school-uniform-64.png?alt=media&token=43dbca61-d3c3-46f1-ae84-7552ad8db7c6",
      isFeatured: true,
    ),
    CategoryModel(
      id: "",
      name: "Animals",
      image:
          "https://firebasestorage.googleapis.com/v0/b/flutterecommerce-c058a.appspot.com/o/Categories%2Ficons8-dog-heart-64.png?alt=media&token=12f85e90-d3ca-401e-b503-dae321ac93a3",
      isFeatured: true,
    ),
    CategoryModel(
      id: "",
      name: "Shoes",
      image:
          "https://firebasestorage.googleapis.com/v0/b/flutterecommerce-c058a.appspot.com/o/Categories%2Ficons8-shoes-64.png?alt=media&token=c15664ad-6059-4dfe-bd07-e51cc38c2208",
      isFeatured: true,
    ),
    CategoryModel(
      id: "",
      name: "Cosmatics",
      image:
          "https://firebasestorage.googleapis.com/v0/b/flutterecommerce-c058a.appspot.com/o/Categories%2Ficons8-cosmetics-64.png?alt=media&token=7a9d6be4-415e-4e44-8a91-0ea1b724aa02",
      isFeatured: true,
    ),
    CategoryModel(
      id: "",
      name: "Jewelery",
      image:
          "https://firebasestorage.googleapis.com/v0/b/flutterecommerce-c058a.appspot.com/o/Categories%2Ficons8-sparkling-diamond-64.png?alt=media&token=40f5852a-7861-4186-9730-da7a015bf5c3",
      isFeatured: true,
    ),
  ];

  List<BannerModel> bannerList = [
    BannerModel(
        image:
            "https://firebasestorage.googleapis.com/v0/b/flutterecommerce-c058a.appspot.com/o/Banners%2Fbanner_1.jpg?alt=media&token=55418f54-cc25-46a7-8231-a89016634524",
        targetScreen: Routes.storePage,
        active: true),
    BannerModel(
        image:
            "https://firebasestorage.googleapis.com/v0/b/flutterecommerce-c058a.appspot.com/o/Banners%2Fbanner_2.jpg?alt=media&token=69958f66-618c-4906-8415-3b25ca030640",
        targetScreen: Routes.storePage,
        active: true),
    BannerModel(
        image:
            "https://firebasestorage.googleapis.com/v0/b/flutterecommerce-c058a.appspot.com/o/Banners%2Fbanner_3.jpg?alt=media&token=65690454-54bf-464d-9d55-5f165abfd961",
        targetScreen: Routes.wishlist,
        active: true),
  ];

  List<ProductModel> productsList = [
    ProductModel(
      title: "Acer Aspire Lite",
      stock: 15,
      price: 250,
      thumbnail:
          "https://firebasestorage.googleapis.com/v0/b/flutterecommerce-c058a.appspot.com/o/products%2Facer_laptop_1.png?alt=media&token=d2cca2ef-9629-47d4-bb01-ef08207859e7",
      catagoryID: "ufI92OyuhvxQ44Y8SXkY",
      brand: BrandModel(
          name: "acer",
          image:
              "https://firebasestorage.googleapis.com/v0/b/flutterecommerce-c058a.appspot.com/o/Brands%2Facer_logo.png?alt=media&token=407d9b44-aa58-4b48-a675-5c0945ad50ef"),
      description:
          "The Acer Aspire Lite AL15-52 Core i3 12th Gen 15.6 FHD Laptop offers dependable performance for multitasking and productivity with an Intel Core i3-1215U processor clocked at up to 4.40 GHz and paired with 8GB of DDR4 RAM. With a speedy 512GB PCIe Gen3 NVMe SSD, there is plenty of storage and quick access to files and apps. Sharp images can be seen on the 15.6 FHD TN display, and fluid graphics performance is provided by Intel UHD Graphics.",
      isFeatured: true,
      salePrice: 210,
      images: [
        "https://firebasestorage.googleapis.com/v0/b/flutterecommerce-c058a.appspot.com/o/products%2Facer_laptop_1.png?alt=media&token=d2cca2ef-9629-47d4-bb01-ef08207859e7",
        "https://firebasestorage.googleapis.com/v0/b/flutterecommerce-c058a.appspot.com/o/products%2Facer_laptop_2.png?alt=media&token=faf10dae-d369-4bee-9e7f-dbde2f6b3db7",
        "https://firebasestorage.googleapis.com/v0/b/flutterecommerce-c058a.appspot.com/o/products%2Facer_laptop_3.png?alt=media&token=130c0bdc-81e1-44d5-9e9d-514404a38772",
        "https://firebasestorage.googleapis.com/v0/b/flutterecommerce-c058a.appspot.com/o/products%2Facer_laptop_4.png?alt=media&token=6fb9e921-b463-4efd-94b8-08a8579b3cd6"
      ],
    ),
    ProductModel(
      title: "Acer TravelMate",
      stock: 10,
      price: 450,
      thumbnail:
          "https://firebasestorage.googleapis.com/v0/b/flutterecommerce-c058a.appspot.com/o/products%2Facer_laptop_var_1.png?alt=media&token=30604952-881e-4056-9635-b76111a5fbdc",
      catagoryID: "ufI92OyuhvxQ44Y8SXkY",
      brand: BrandModel(
          name: "acer",
          image:
              "https://firebasestorage.googleapis.com/v0/b/flutterecommerce-c058a.appspot.com/o/Brands%2Facer_logo.png?alt=media&token=407d9b44-aa58-4b48-a675-5c0945ad50ef"),
      description:
          "The Acer TravelMate TMP214-54 is a high-performance laptop designed to meet the demands of modern-day computing. Powered by the latest 12th-generation Intel Core i3-1215U processor, this laptop delivers exceptional speed and performance, making it ideal for multitasking, browsing, and streaming. With a massive 8GB DDR4 RAM and 1TB HDD storage, you can store all your important files, documents, and media with ease.",
      isFeatured: false,
      salePrice: 400,
      images: [
        "https://firebasestorage.googleapis.com/v0/b/flutterecommerce-c058a.appspot.com/o/products%2Facer_laptop_var_1.png?alt=media&token=30604952-881e-4056-9635-b76111a5fbdc",
        "https://firebasestorage.googleapis.com/v0/b/flutterecommerce-c058a.appspot.com/o/products%2Facer_laptop_var_2.png?alt=media&token=bb1d432f-3202-42cd-a3c5-8c16539e25df",
        "https://firebasestorage.googleapis.com/v0/b/flutterecommerce-c058a.appspot.com/o/products%2Facer_laptop_var_3.png?alt=media&token=e77d4c1c-227e-4a1d-ab5f-6fe225d06e56",
        "https://firebasestorage.googleapis.com/v0/b/flutterecommerce-c058a.appspot.com/o/products%2Facer_laptop_var_4.png?alt=media&token=99ed8f40-cedf-4989-9e77-40e1f46ed3e8"
      ],
    ),
    ProductModel(
      title: "Iphone 12",
      stock: 25,
      price: 850,
      thumbnail:
          "https://firebasestorage.googleapis.com/v0/b/flutterecommerce-c058a.appspot.com/o/products%2Fiphone_12_black.png?alt=media&token=88c57ce2-bacf-4879-a468-68331f326cb6",
      catagoryID: "ufI92OyuhvxQ44Y8SXkY",
      brand: BrandModel(
          name: "Iphone",
          image:
              "https://firebasestorage.googleapis.com/v0/b/flutterecommerce-c058a.appspot.com/o/Brands%2Fapple-logo.png?alt=media&token=6cc6ee92-bd71-4e11-8c48-46036100da05"),
      description:
          "Apple iPhone 12 is the bigger version of the regular iPhone 12 mini. The handset's hardware include a 6.1-inch OLED display, 5nm Apple A14 Bionic processor, and a dual-camera setup with a large sensor. 5G and Face ID are on board, too.",
      isFeatured: true,
      salePrice: 800,
      images: [
        "https://firebasestorage.googleapis.com/v0/b/flutterecommerce-c058a.appspot.com/o/products%2Fiphone_12_black.png?alt=media&token=88c57ce2-bacf-4879-a468-68331f326cb6",
        "https://firebasestorage.googleapis.com/v0/b/flutterecommerce-c058a.appspot.com/o/products%2Fiphone_12_blue.png?alt=media&token=dd20e0a6-5145-424d-9d46-52910d941f17",
        "https://firebasestorage.googleapis.com/v0/b/flutterecommerce-c058a.appspot.com/o/products%2Fiphone_12_green.png?alt=media&token=7658a853-1930-4aa1-8009-fe3cdf8497b7",
        "https://firebasestorage.googleapis.com/v0/b/flutterecommerce-c058a.appspot.com/o/products%2Fiphone_12_red.png?alt=media&token=53ecf89c-fb2a-4b97-a5d9-4d0e5c40efed"
      ],
    ),
    ProductModel(
      title: "Iphone 14 Pro",
      stock: 18,
      price: 1000,
      thumbnail:
          "https://firebasestorage.googleapis.com/v0/b/flutterecommerce-c058a.appspot.com/o/products%2Fiphone_14_pro.png?alt=media&token=a597adcf-443a-4fd9-bab1-a868b29a6f41",
      catagoryID: "ufI92OyuhvxQ44Y8SXkY",
      brand: BrandModel(
          name: "Iphone",
          image:
              "https://firebasestorage.googleapis.com/v0/b/flutterecommerce-c058a.appspot.com/o/Brands%2Fapple-logo.png?alt=media&token=6cc6ee92-bd71-4e11-8c48-46036100da05"),
      description:
          "The iPhone 14 and iPhone 14 Plus feature a 6.1-inch (15 cm) and 6.7-inch (17 cm) display, improvements to the rear-facing camera, and satellite connectivity for contacting emergency services when a user in trouble is beyond the range of Wi-Fi or cellular networks.",
      isFeatured: false,
      salePrice: 920,
      images: [
        "https://firebasestorage.googleapis.com/v0/b/flutterecommerce-c058a.appspot.com/o/products%2Fiphone_14_pro.png?alt=media&token=a597adcf-443a-4fd9-bab1-a868b29a6f41",
        "https://firebasestorage.googleapis.com/v0/b/flutterecommerce-c058a.appspot.com/o/products%2Fiphone_14_white.png?alt=media&token=ffb3b338-664c-42fa-a064-6e0d406ec41f",
      ],
    ),
    ProductModel(
      title: "Samsung S9",
      stock: 22,
      price: 450,
      thumbnail:
          "https://firebasestorage.googleapis.com/v0/b/flutterecommerce-c058a.appspot.com/o/products%2Fsamsung_s9_mobile.png?alt=media&token=f53176b3-c084-48e5-8274-6c7c530a6892",
      catagoryID: "ufI92OyuhvxQ44Y8SXkY",
      brand: BrandModel(
          name: "samsung",
          image:
              "https://firebasestorage.googleapis.com/v0/b/flutterecommerce-c058a.appspot.com/o/Brands%2Facer_logo.png?alt=media&token=407d9b44-aa58-4b48-a675-5c0945ad50ef"),
      description:
          "The Galaxy S9 is Samsung's first phone to let you drag and drop the Edge menu, a shortcuts bar for apps and people, anywhere you want on the left or right edges. In previous phones, you had to select its position in the settings.",
      isFeatured: false,
      salePrice: 450,
      images: [
        "https://firebasestorage.googleapis.com/v0/b/flutterecommerce-c058a.appspot.com/o/products%2Fsamsung_s9_mobile.png?alt=media&token=f53176b3-c084-48e5-8274-6c7c530a6892",
        "https://firebasestorage.googleapis.com/v0/b/flutterecommerce-c058a.appspot.com/o/products%2Fsamsung_s9_mobile_back.png?alt=media&token=4947583d-81fc-4d72-82c3-4f26a1ea9c99",
        "https://firebasestorage.googleapis.com/v0/b/flutterecommerce-c058a.appspot.com/o/products%2Fsamsung_s9_mobile_withback.png?alt=media&token=ee256066-5472-4758-b460-836c1c37c7c4",
      ],
    ),
    ProductModel(
      title: "Bedroom Bed ",
      stock: 8,
      price: 350,
      thumbnail:
          "https://firebasestorage.googleapis.com/v0/b/flutterecommerce-c058a.appspot.com/o/products%2Fbedroom_bed_grey.png?alt=media&token=fed8b4bc-4ba0-48b5-ae68-a0d7d362bd69",
      catagoryID: "dPXPmO4DEughjQPvR4Bv",
      brand: BrandModel(
          name: "Ikea",
          image:
              "https://firebasestorage.googleapis.com/v0/b/flutterecommerce-c058a.appspot.com/o/Brands%2Fikea_logo.png?alt=media&token=95cbe7fe-8d5e-4890-863f-2ad1367177b6"),
      description:
          "The Bed is made of durable Veneered Engineered Wood that lasts longer and better withstands wear and tear, 600-pound weight limit. Frame & Floor Touch Material: Solid Mahogany Wood.",
      isFeatured: true,
      salePrice: 290,
      images: [
        "https://firebasestorage.googleapis.com/v0/b/flutterecommerce-c058a.appspot.com/o/products%2Fbedroom_bed_grey.png?alt=media&token=fed8b4bc-4ba0-48b5-ae68-a0d7d362bd69",
        "https://firebasestorage.googleapis.com/v0/b/flutterecommerce-c058a.appspot.com/o/products%2Fbedroom_bed_simple_brown.png?alt=media&token=cb80a68d-64b6-4b2f-8d48-b7dfb2f681bc",
        "https://firebasestorage.googleapis.com/v0/b/flutterecommerce-c058a.appspot.com/o/products%2Fbedroom_bed_with_comforter.png?alt=media&token=b25cacc9-29d4-493f-b081-219c44a2d546",
      ],
    ),
    ProductModel(
      title: "Bedroom Lamp",
      stock: 5,
      price: 140,
      thumbnail:
          "https://firebasestorage.googleapis.com/v0/b/flutterecommerce-c058a.appspot.com/o/products%2Fbedroom_lamp.png?alt=media&token=1f85e3a7-971a-4d16-9fa4-93c038259f59",
      catagoryID: "dPXPmO4DEughjQPvR4Bv",
      brand: BrandModel(
          name: "Ikea",
          image:
              "https://firebasestorage.googleapis.com/v0/b/flutterecommerce-c058a.appspot.com/o/Brands%2Fikea_logo.png?alt=media&token=95cbe7fe-8d5e-4890-863f-2ad1367177b6"),
      description:
          "The lamp is made of durable Veneered Engineered Wood that lasts longer and better withstands wear and tear, 600-pound weight limit. Frame & Floor Touch Material: Solid Mahogany Wood.",
      isFeatured: false,
      salePrice: 120,
      images: [
        "https://firebasestorage.googleapis.com/v0/b/flutterecommerce-c058a.appspot.com/o/products%2Fbedroom_lamp.png?alt=media&token=1f85e3a7-971a-4d16-9fa4-93c038259f59",
      ],
    ),
    ProductModel(
      title: "Bedroom Sofa",
      stock: 7,
      price: 340,
      thumbnail:
          "https://firebasestorage.googleapis.com/v0/b/flutterecommerce-c058a.appspot.com/o/products%2Fbedroom_sofa.png?alt=media&token=7631f07d-fe27-4c4b-94ab-0be6c100d658",
      catagoryID: "dPXPmO4DEughjQPvR4Bv",
      brand: BrandModel(
          name: "Ikea",
          image:
              "https://firebasestorage.googleapis.com/v0/b/flutterecommerce-c058a.appspot.com/o/Brands%2Fikea_logo.png?alt=media&token=95cbe7fe-8d5e-4890-863f-2ad1367177b6"),
      description:
          "The sofa is made of durable Veneered Engineered Wood that lasts longer and better withstands wear and tear, 600-pound weight limit. Frame & Floor Touch Material: Solid Mahogany Wood.",
      isFeatured: false,
      salePrice: 280,
      images: [
        "https://firebasestorage.googleapis.com/v0/b/flutterecommerce-c058a.appspot.com/o/products%2Fbedroom_sofa.png?alt=media&token=7631f07d-fe27-4c4b-94ab-0be6c100d658",
      ],
    ),
    ProductModel(
      title: "Bedroom Wardrobe",
      stock: 6,
      price: 420,
      thumbnail:
          "https://firebasestorage.googleapis.com/v0/b/flutterecommerce-c058a.appspot.com/o/products%2Fbedroom_wardrobe.png?alt=media&token=4f03218b-4722-45eb-be6b-ed1755bcd478",
      catagoryID: "dPXPmO4DEughjQPvR4Bv",
      brand: BrandModel(
          name: "Ikea",
          image:
              "https://firebasestorage.googleapis.com/v0/b/flutterecommerce-c058a.appspot.com/o/Brands%2Fikea_logo.png?alt=media&token=95cbe7fe-8d5e-4890-863f-2ad1367177b6"),
      description:
          "The waredrobe is made of durable Veneered Engineered Wood that lasts longer and better withstands wear and tear, 600-pound weight limit. Frame & Floor Touch Material: Solid Mahogany Wood.",
      isFeatured: false,
      salePrice: 280,
      images: [
        "https://firebasestorage.googleapis.com/v0/b/flutterecommerce-c058a.appspot.com/o/products%2Fbedroom_wardrobe.png?alt=media&token=4f03218b-4722-45eb-be6b-ed1755bcd478",
      ],
    ),
    ProductModel(
      title: "BaseBall Bat",
      stock: 35,
      price: 150,
      thumbnail:
          "https://firebasestorage.googleapis.com/v0/b/flutterecommerce-c058a.appspot.com/o/products%2Fbaseball_bat.png?alt=media&token=ab3ae5a3-7894-479f-99f4-413a8a97eb1a",
      catagoryID: "M0wl7WMx8aGmFEdeGoG3",
      brand: BrandModel(
          name: "Adidas",
          image:
              "https://firebasestorage.googleapis.com/v0/b/flutterecommerce-c058a.appspot.com/o/Brands%2Fadidas-logo.png?alt=media&token=f2dcda0e-1f0b-4b77-9ea2-bc21605f93b5"),
      description:
          "matel baseball bat with firm grip soft cornar medium in size",
      isFeatured: false,
      salePrice: 110,
      images: [
        "https://firebasestorage.googleapis.com/v0/b/flutterecommerce-c058a.appspot.com/o/products%2Fbaseball_bat.png?alt=media&token=ab3ae5a3-7894-479f-99f4-413a8a97eb1a"
      ],
    ),
    ProductModel(
      title: "Cricket Bat",
      stock: 45,
      price: 150,
      thumbnail:
          "https://firebasestorage.googleapis.com/v0/b/flutterecommerce-c058a.appspot.com/o/products%2Fcricket_bat.png?alt=media&token=293d0464-cdd9-449f-8634-2444534db267",
      catagoryID: "M0wl7WMx8aGmFEdeGoG3",
      brand: BrandModel(
          name: "Adidas",
          image:
              "https://firebasestorage.googleapis.com/v0/b/flutterecommerce-c058a.appspot.com/o/Brands%2Fadidas-logo.png?alt=media&token=f2dcda0e-1f0b-4b77-9ea2-bc21605f93b5"),
      description:
          "matel baseball bat with firm grip soft cornar medium in size",
      isFeatured: false,
      salePrice: 110,
      images: [
        "https://firebasestorage.googleapis.com/v0/b/flutterecommerce-c058a.appspot.com/o/products%2Fcricket_bat.png?alt=media&token=293d0464-cdd9-449f-8634-2444534db267"
      ],
    ),
    ProductModel(
      title: "Adidas Football",
      stock: 35,
      price: 250,
      thumbnail:
          "https://firebasestorage.googleapis.com/v0/b/flutterecommerce-c058a.appspot.com/o/products%2FAdidas_Football.png?alt=media&token=2ca667a3-0503-45ae-9cbc-8acaf8e24748",
      catagoryID: "M0wl7WMx8aGmFEdeGoG3",
      brand: BrandModel(
          name: "Adidas",
          image:
              "https://firebasestorage.googleapis.com/v0/b/flutterecommerce-c058a.appspot.com/o/Brands%2Fadidas-logo.png?alt=media&token=f2dcda0e-1f0b-4b77-9ea2-bc21605f93b5"),
      description:
          "Al Rihla means the journey, and this adidas ball is only at the beginning of the journey. Write a new story with every touch. Official model of the FIFA World Cup Qatar 2022 ™, this seamless adidas Al Rihla Pro ball redefines the idea of reliability. The dhow-inspired Speedshell panel combines with texture and embossed rhombus details to enhance shot effect and accuracy. The bright graphics sparkle under the pearly finish.",
      isFeatured: true,
      salePrice: 210,
      images: [
        "https://firebasestorage.googleapis.com/v0/b/flutterecommerce-c058a.appspot.com/o/products%2FAdidas_Football.png?alt=media&token=2ca667a3-0503-45ae-9cbc-8acaf8e24748"
      ],
    ),
    ProductModel(
      title: "Nike Shoes",
      stock: 10,
      price: 480,
      thumbnail:
          "https://firebasestorage.googleapis.com/v0/b/flutterecommerce-c058a.appspot.com/o/products%2Fnike-shoes.png?alt=media&token=e9007c03-fb9b-4cd6-bc98-cdfdfe5fa2aa",
      catagoryID: "yaTWBoLtM07DhmRZN3fa",
      brand: BrandModel(
          name: "Nike",
          image:
              "https://firebasestorage.googleapis.com/v0/b/flutterecommerce-c058a.appspot.com/o/Brands%2Fnike.png?alt=media&token=80bd1c96-1dad-4568-95cd-df7c4f13285c"),
      description:
          "Comfort and Zen spirit: the characteristics that each race should have. For the Nike Flex Experience Run 11 shoe we have created a lightweight and clean design, as beautiful as it is comfortable. Absolute support is ensured, by such a naturalness in the movements that you would swear to wear those shoes for years.",
      isFeatured: true,
      salePrice: 450,
      images: [
        "https://firebasestorage.googleapis.com/v0/b/flutterecommerce-c058a.appspot.com/o/products%2Fnike-shoes.png?alt=media&token=e9007c03-fb9b-4cd6-bc98-cdfdfe5fa2aa",
        "https://firebasestorage.googleapis.com/v0/b/flutterecommerce-c058a.appspot.com/o/products%2FNikeWildhorse.png?alt=media&token=bd3545e7-d5ea-4acf-8908-502a03a5b7fa",
        "https://firebasestorage.googleapis.com/v0/b/flutterecommerce-c058a.appspot.com/o/products%2FNikeBasketballShoeGreenBlack.png?alt=media&token=f979208d-f8e6-4f9e-afe4-cace23d55f45",
        "https://firebasestorage.googleapis.com/v0/b/flutterecommerce-c058a.appspot.com/o/products%2FNikeAirMax.png?alt=media&token=01076f60-3dbb-482d-af3a-75cf04af0a7e"
      ],
    ),
    ProductModel(
      title: "Nike Air Jordon ",
      stock: 5,
      price: 650,
      thumbnail:
          "https://firebasestorage.googleapis.com/v0/b/flutterecommerce-c058a.appspot.com/o/products%2FNikeAirJOrdonBlackRed.png?alt=media&token=1d43aea0-3c5c-49f4-956e-4e75ab3cb869",
      catagoryID: "M0wl7WMx8aGmFEdeGoG3",
      brand: BrandModel(
          name: "Adidas",
          image:
              "https://firebasestorage.googleapis.com/v0/b/flutterecommerce-c058a.appspot.com/o/Brands%2Fadidas-logo.png?alt=media&token=f2dcda0e-1f0b-4b77-9ea2-bc21605f93b5"),
      description:
          "Al Rihla means the journey, and this adidas ball is only at the beginning of the journey. Write a new story with every touch. Official model of the FIFA World Cup Qatar 2022 ™, this seamless adidas Al Rihla Pro ball redefines the idea of reliability. The dhow-inspired Speedshell panel combines with texture and embossed rhombus details to enhance shot effect and accuracy. The bright graphics sparkle under the pearly finish.",
      isFeatured: true,
      salePrice: 610,
      images: [
        "https://firebasestorage.googleapis.com/v0/b/flutterecommerce-c058a.appspot.com/o/products%2FNikeAirJOrdonBlackRed.png?alt=media&token=1d43aea0-3c5c-49f4-956e-4e75ab3cb869",
        "https://firebasestorage.googleapis.com/v0/b/flutterecommerce-c058a.appspot.com/o/products%2FNikeAirJOrdonOrange.png?alt=media&token=1e38944a-626b-414c-a8f4-294e3eb322b0",
        "https://firebasestorage.googleapis.com/v0/b/flutterecommerce-c058a.appspot.com/o/products%2FNikeAirJordonSingleBlue.png?alt=media&token=b1f3b619-5e72-444d-8320-913c846729e5",
        "https://firebasestorage.googleapis.com/v0/b/flutterecommerce-c058a.appspot.com/o/products%2FNikeAirJordonwhiteMagenta.png?alt=media&token=aefbab31-a26f-4279-9880-2602ddc2a506"
      ],
    ),
    ProductModel(
      title: "Leather Jacket",
      stock: 35,
      price: 150,
      thumbnail:
          "https://firebasestorage.googleapis.com/v0/b/flutterecommerce-c058a.appspot.com/o/products%2Fleather_jacket_4.png?alt=media&token=106b9f98-2c82-4990-b6ca-4621475aa00f",
      catagoryID: "VgU3uXiwO83PxlKqdgXr",
      brand: BrandModel(
          name: "Zara",
          image:
              "https://firebasestorage.googleapis.com/v0/b/flutterecommerce-c058a.appspot.com/o/Brands%2Fzara-logo.png?alt=media&token=13337172-ef99-417a-a107-ebf3f74ad0d3"),
      description:
          "Material & Features || Made of 100% Genuine Milled Cowhide 1.2-1.3 mm Thick Leather + Classic Biker Timeless Look + Dual Inside Left and Right Storage Pockets + Patented Interior “Patch Access” Zipper Openings Making Patch Sewing Easier + Built-In Inside Lining + Full Sleeve Zip-Up Thermal Liner (interior material is cotton) + Built-in Hanging Loop + Available in Regular and Tall Sizes",
      isFeatured: false,
      salePrice: 130,
      images: [
        "https://firebasestorage.googleapis.com/v0/b/flutterecommerce-c058a.appspot.com/o/products%2Fleather_jacket_4.png?alt=media&token=106b9f98-2c82-4990-b6ca-4621475aa00f",
        "https://firebasestorage.googleapis.com/v0/b/flutterecommerce-c058a.appspot.com/o/products%2Fleather_jacket_2.png?alt=media&token=a1d46d6d-43f5-48b3-9d9f-150c46cf0bd5",
      ],
    ),
    ProductModel(
      title: "Zara T-shirt",
      stock: 25,
      price: 250,
      thumbnail:
          "https://firebasestorage.googleapis.com/v0/b/flutterecommerce-c058a.appspot.com/o/products%2Ftshirt_blue_collar.png?alt=media&token=8f4abdfb-cc24-4606-9dbf-dca288de8bd9",
      catagoryID: "VgU3uXiwO83PxlKqdgXr",
      brand: BrandModel(
          name: "Zara",
          image:
              "https://firebasestorage.googleapis.com/v0/b/flutterecommerce-c058a.appspot.com/o/Brands%2Fzara-logo.png?alt=media&token=13337172-ef99-417a-a107-ebf3f74ad0d3"),
      description:
          "Al Rihla means the journey, and this adidas ball is only at the beginning of the journey. Write a new story with every touch. Official model of the FIFA World Cup Qatar 2022 ™, this seamless adidas Al Rihla Pro ball redefines the idea of reliability. The dhow-inspired Speedshell panel combines with texture and embossed rhombus details to enhance shot effect and accuracy. The bright graphics sparkle under the pearly finish.",
      isFeatured: false,
      salePrice: 220,
      images: [
        "https://firebasestorage.googleapis.com/v0/b/flutterecommerce-c058a.appspot.com/o/products%2Ftshirt_blue_collar.png?alt=media&token=8f4abdfb-cc24-4606-9dbf-dca288de8bd9",
        "https://firebasestorage.googleapis.com/v0/b/flutterecommerce-c058a.appspot.com/o/products%2Ftshirt_green_collar.png?alt=media&token=92bd51d9-e806-4292-9c42-8f1fc4aa52ab",
        "https://firebasestorage.googleapis.com/v0/b/flutterecommerce-c058a.appspot.com/o/products%2Ftshirt_red_collar.png?alt=media&token=f29be0b4-84f0-4a99-9234-c646323de15a",
        "https://firebasestorage.googleapis.com/v0/b/flutterecommerce-c058a.appspot.com/o/products%2Ftshirt_yellow_collar.png?alt=media&token=e9145174-7fc7-42ef-9b9e-1485445cbb85"
      ],
    ),
    ProductModel(
      title: "Jeans",
      stock: 35,
      price: 150,
      thumbnail:
          "https://firebasestorage.googleapis.com/v0/b/flutterecommerce-c058a.appspot.com/o/products%2Fproduct-jeans.png?alt=media&token=e3498608-8121-4aca-afeb-a2bf3407a5dc",
      catagoryID: "VgU3uXiwO83PxlKqdgXr",
      brand: BrandModel(
          name: "Zara",
          image:
              "https://firebasestorage.googleapis.com/v0/b/flutterecommerce-c058a.appspot.com/o/Brands%2Fzara-logo.png?alt=media&token=13337172-ef99-417a-a107-ebf3f74ad0d3"),
      description:
          "Al Rihla means the journey, and this adidas ball is only at the beginning of the journey. Write a new story with every touch. Official model of the FIFA World Cup Qatar 2022 ™, this seamless adidas Al Rihla Pro ball redefines the idea of reliability. The dhow-inspired Speedshell panel combines with texture and embossed rhombus details to enhance shot effect and accuracy. The bright graphics sparkle under the pearly finish.",
      isFeatured: false,
      salePrice: 110,
      images: [
        "https://firebasestorage.googleapis.com/v0/b/flutterecommerce-c058a.appspot.com/o/products%2Fproduct-jeans.png?alt=media&token=e3498608-8121-4aca-afeb-a2bf3407a5dc",
      ],
    ),
  ];

  List<BrandModel> brandsList = [
    BrandModel(
      name: "acer",
      image:
          "https://firebasestorage.googleapis.com/v0/b/flutterecommerce-c058a.appspot.com/o/Brands%2Facer_logo.png?alt=media&token=407d9b44-aa58-4b48-a675-5c0945ad50ef",
    ),
    BrandModel(
      name: "Iphone",
      image:
          "https://firebasestorage.googleapis.com/v0/b/flutterecommerce-c058a.appspot.com/o/Brands%2Fapple-logo.png?alt=media&token=6cc6ee92-bd71-4e11-8c48-46036100da05",
    ),
    BrandModel(
        name: "Ikea",
        image:
            "https://firebasestorage.googleapis.com/v0/b/flutterecommerce-c058a.appspot.com/o/Brands%2Fikea_logo.png?alt=media&token=95cbe7fe-8d5e-4890-863f-2ad1367177b6"),
    BrandModel(
        name: "Adidas",
        image:
            "https://firebasestorage.googleapis.com/v0/b/flutterecommerce-c058a.appspot.com/o/Brands%2Fadidas-logo.png?alt=media&token=f2dcda0e-1f0b-4b77-9ea2-bc21605f93b5"),
    BrandModel(
        name: "Nike",
        image:
            "https://firebasestorage.googleapis.com/v0/b/flutterecommerce-c058a.appspot.com/o/Brands%2Fnike.png?alt=media&token=80bd1c96-1dad-4568-95cd-df7c4f13285c"),
    BrandModel(
        name: "Zara",
        image:
            "https://firebasestorage.googleapis.com/v0/b/flutterecommerce-c058a.appspot.com/o/Brands%2Fzara-logo.png?alt=media&token=13337172-ef99-417a-a107-ebf3f74ad0d3"),
  ];

  saveListData() {
    for (var element in productsList) {
      saveProductDummyData(element);
    }
  }

  saveProductDummyData(ProductModel data) async {
    final ProductModel product = ProductModel(
      title: data.title,
      stock: data.stock,
      price: data.price,
      thumbnail: data.thumbnail,
      catagoryID: data.catagoryID,
      brand: data.brand,
      description: data.description,
      images: data.images,
      isFeatured: data.isFeatured,
      salePrice: data.salePrice,
    );

    await FirebaseFirestore.instance
        .collection("Products")
        .doc()
        .set(product.toJson());
  }

  saveCategoryDummyData(CategoryModel data) async {
    final CategoryModel category = CategoryModel(
        id: "",
        name: data.name,
        image: data.image,
        isFeatured: data.isFeatured);

    await FirebaseFirestore.instance
        .collection("Categories")
        .doc()
        .set(category.toJson());
  }

  saveBannerDummyData(BannerModel data) async {
    final BannerModel banner = BannerModel(
        image: data.image,
        targetScreen: data.targetScreen,
        active: data.active);

    await FirebaseFirestore.instance
        .collection("Banners")
        .doc()
        .set(banner.toJson());
  }

  saveBrandDummyData(BrandModel data) async {
    final BrandModel brand = BrandModel(
        name: data.name,
        image: data.image,
        isFeatured: data.isFeatured,
        productCount: data.productCount);

    await FirebaseFirestore.instance
        .collection("Brands")
        .doc()
        .set(brand.toJson());
  }
}
