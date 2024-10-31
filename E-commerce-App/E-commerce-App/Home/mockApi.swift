//
//  mock.swift
//  E-commerce-App
//
//  Created by Andy on 17/10/2024.
//

import Foundation

let userInfor = """
{
  "id": "12345",
  "username": "tester",
  "email": "testuser@example.com",
  "avatar": "https://images.pexels.com/photos/35537/child-children-girl-happy.jpg",
  "created_at": "2023-01-01T12:00:00Z"
}
"""

let itemcatefory = """
{
  "id": "123456",
  "categories": [
    {
      "image": "https://images.pexels.com/photos/3732652/pexels-photo-3732652.jpeg",
      "title": "Beauty"
    },
    {
      "image": "https://images.pexels.com/photos/794064/pexels-photo-794064.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
      "title": "Fashion"
    },
    {
      "image": "https://images.pexels.com/photos/1912868/pexels-photo-1912868.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
      "title": "Kid"
    },
    {
      "image": "https://images.pexels.com/photos/1036623/pexels-photo-1036623.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
      "title": "Women"
    },
    {
      "image": "https://images.pexels.com/photos/1043474/pexels-photo-1043474.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
      "title": "Men"
    },
    {
      "image": "https://images.pexels.com/photos/6787970/pexels-photo-6787970.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
      "title": "Summer"
    },
    {
      "image": "https://images.pexels.com/photos/6787970/pexels-photo-6787970.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
      "title": "Newborn"
    },
    {
      "image": "https://images.pexels.com/photos/6787970/pexels-photo-6787970.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
      "title": "Older"
    },
    {
      "image": "https://images.pexels.com/photos/6787970/pexels-photo-6787970.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
      "title": "Other"
    }
  ]
}
"""

let saleoffInfor = """
{
  "id": "123456",
  "sale_off": [
    {
      "id": "123",
      "image": "https://images.pexels.com/photos/10738239/pexels-photo-10738239.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
      "title": "50% Off",
      "productName": "Nike Shoes",
      "color": "Red"
    },
    {
      "id": "345",
      "image": "https://images.pexels.com/photos/974911/pexels-photo-974911.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
      "title": "30% Off",
      "productName": "Summer Dress",
      "color": "Black"
    },
    {
      "id": "564",
      "image": "https://images.pexels.com/photos/5427990/pexels-photo-5427990.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
      "title": "20% Off",
      "productName": "Newborn",
      "color": "Blue"
    }
  ]
}

"""

let deal = """
{
  "id": "123456",
  "timeRemain": "22h 55m 20s remaining",
  "deal_off": [
    {
      "id": "244",
      "image": "https://images.pexels.com/photos/28985263/pexels-photo-28985263/free-photo-of-elegant-woman-in-summer-dress-sitting-outdoors.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "productName": "Women Printed Kurta",
      "productDetail": "Neque porro quisquam est qui dolorem ipsum quia",
      "currentPrice": 1500,
      "originPrice": 2499,
      "percentOff": 40,
      "rating": 56890
    },
    {
      "id": "243465",
      "image": "https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "productName": "Women Printed Kurta",
      "productDetail": "HRX by Hrithik Roshan",
      "currentPrice": 2499,
      "originPrice": 4999,
      "percentOff": 50,
      "rating": 344567
    },
    {
      "id": "35",
      "image": "https://images.pexels.com/photos/28985263/pexels-photo-28985263/free-photo-of-elegant-woman-in-summer-dress-sitting-outdoors.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "productName": "Women Printed Kurta",
      "productDetail": "Neque porro quisquam est qui dolorem ipsum quia",
      "currentPrice": 1500,
      "originPrice": 2499,
      "percentOff": 40,
      "rating": 56890
    },
    {
      "id": "3465",
      "image": "https://images.pexels.com/photos/1317712/pexels-photo-1317712.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "productName": "Man Yellow Jacket",
      "productDetail": "Neque porro quisquam est qui dolorem ipsum quia",
      "currentPrice": 1500,
      "originPrice": 2499,
      "percentOff": 40,
      "rating": 56890
    },
    {
      "id": "235",
      "image": "https://images.pexels.com/photos/5693889/pexels-photo-5693889.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "productName": "Pink Dress for girls",
      "productDetail": "Neque porro quisquam est qui dolorem ipsum quia",
      "currentPrice": 150,
      "originPrice": 249,
      "percentOff": 40,
      "rating": 56890
    },
    {
      "id": "35465",
      "image": "https://images.pexels.com/photos/3026856/pexels-photo-3026856.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "productName": "Baby's snakers",
      "productDetail": "Neque porro quisquam est qui dolorem ipsum quia",
      "currentPrice": 200,
      "originPrice": 400,
      "percentOff": 50,
      "rating": 56890
    }
  ]
}
"""

let specialOffer = """
{
  "id": "123456",
  "offer": {
      "image": "https://ibb.co/d0HK1gg",
      "productName": "Flat and Heels",
      "productDetail": "Stand a chance to get rewarded"
    }
}
"""
let trending = """
{
  "id": "123456",
  "lastDate": "29/02/22",
  "trending": [
    {
      "id": "465748",
      "image": "https://images.pexels.com/photos/2010018/pexels-photo-2010018.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "description": "IWC Schaffhausen 2021 Pilot's Watch \"SIHH 2019\" 44mm",
      "currentPrice": 650,
      "originPrice": 1599,
      "percentOff": 60
    },
    {
      "id": "456",
      "image": "https://images.pexels.com/photos/4876536/pexels-photo-4876536.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "description": "Labbin White Sneakers For Men and Female",
      "currentPrice": 650,
      "originPrice": 1250,
      "percentOff": 70
    },
    {
      "id": "75689",
      "image": "https://images.pexels.com/photos/3908800/pexels-photo-3908800.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "description": "Mammon Women's Handbag (Set of 3, Beige)",
      "currentPrice": 150,
      "originPrice": 1699,
      "percentOff": 60
    },
    {
      "id": "345678",
      "image": "https://images.pexels.com/photos/9267589/pexels-photo-9267589.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "description": "Flat mules for women (with 3cm heels, Beige)",
      "currentPrice": 650,
      "originPrice": 1599,
      "percentOff": 60
    },
    {
      "id": "56789",
      "image": "https://images.pexels.com/photos/20015773/pexels-photo-20015773/free-photo-of-choice-of-leather-wallets-with-embellishments.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "description": "Man Holding a Handmade Brown Leather Wallet",
      "currentPrice": 750,
      "originPrice": 1699,
      "percentOff": 60
    }
]
}
"""
let sponser = """
{
  "id": "123456",
  "sponserd": {
      "image": "https://images.pexels.com/photos/5872185/pexels-photo-5872185.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "detail": "up to 50% Off"
    }
}
"""

let mockWishlist = """
{
"id": "123456",
"productList": [
{
"id": "1234",
"image":
"https://images.pexels.com/photos/15536344/pexels-photo-15536344/free-photo-of-man-standing-in-woods.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
"productName": "Black Winter Jacket unisex",
"productDetail": "Autumn And Winter Casual cotton-padded jacket...",
"currentPrice": 499,
"rating": 6890
},
{
"id": "4567",
"image":
"https://images.pexels.com/photos/1043474/pexels-photo-1043474.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
"productName": "Mens Starry",
"productDetail": "Mens Starry Sky Printed Shirt 100% Cotton Fabric",
"currentPrice": 399,
"rating": 152344
},
{
"id": "128904456",
"image":
"https://images.pexels.com/photos/3050273/pexels-photo-3050273.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
"productName": "Black Dress",
"productDetail": "Solid Black Dress for Women, Sexy Chain Shorts Ladi...",
"currentPrice": 2000,
"rating": 523456
},
{
"id": "534565",
"image":
"https://images.pexels.com/photos/7140444/pexels-photo-7140444.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
"productName": "Pink Embroide For Girls",
"productDetail": "EARTHEN Rose Pink Embroidered Tiered Max...",
"currentPrice": 1900,
"rating": 3456787
},
{
"id": "464534",
"image":
"https://images.pexels.com/photos/6895333/pexels-photo-6895333.png?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
"productName": "Flare Dress",
"productDetail": "Antheaa Black & Rust Orange Floral Print Tiered Midi F...",
"currentPrice": 1990,
"rating": 123456
},
{
"id": "36756",
"image":
"https://images.pexels.com/photos/27367835/pexels-photo-27367835/free-photo-of-woman-wearing-denim-dress-on-a-street-in-new-york.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
"productName": "denim dress",
"productDetail": "Blue cotton denim dress Look 2 Printed cotton dr...",
"currentPrice": 999,
"rating": 27344
},
{

"id": "3565434",
"image":
"https://images.pexels.com/photos/28190520/pexels-photo-28190520/free-photo-of-two-purple-phones-with-one-camera-on-top.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
"productName": "Realme 7 ",
"productDetail": "6 GB RAM | 64 GB ROM | Expandable Upto 256...",
"currentPrice": 3499,
"rating": 567234
},
{
"id": "2456576",
"image":
"https://images.pexels.com/photos/5413296/pexels-photo-5413296.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
"productName": "Jordan Stay",
"productDetail": "The classic Air Jordan 12 to create a shoe that's fres...",
"currentPrice": 4999,
"rating": 567892
},
{
"id": "2456676",
"image":
"https://images.pexels.com/photos/4522994/pexels-photo-4522994.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
"productName": "Sony PS4",
"productDetail": "Sony PS4 Console, 1TB Slim with 3 Games: Gran Turis...",
"currentPrice": 1999,
"rating": 344665
},
{
"id": "345645",
"image":
"https://images.pexels.com/photos/7748383/pexels-photo-7748383.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
"productName": "Black Jacket 12...",
"productDetail": "This warm and comfortable jacket is great for learni...",
"currentPrice": 999,
"rating": 344665
},
{
"id": "243565",
"image":
"https://images.pexels.com/photos/16152553/pexels-photo-16152553/free-photo-of-photo-of-a-camera-with-a-long-zoom-on-a-brown-table.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
"productName": "D7200 Digital C...",
"productDetail": "D7200 Digital Camera (Nikon) In New Area...",
"currentPrice": 6999,
"rating": 344665
},
{
"id": "23576654",
"image":
"https://images.pexels.com/photos/15059775/pexels-photo-15059775/free-photo-of-close-up-shot-of-brown-leather-shoes.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
"productName": "men’s & boys brown shoes...",
"productDetail": "George Walker Derby Brown Formal Shoes",
"currentPrice": 999,
"rating": 344665
}
]
}
"""
let detail = """
{
"id": "123456",
"productList": {
"id": "1234",
"image": [
"https://images.pexels.com/photos/16304368/pexels-photo-16304368/free-photo-of-nike-off-white-jordan-1-university-blue.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
"https://images.pexels.com/photos/16304369/pexels-photo-16304369/free-photo-of-nike-off-white-jordan-1-university-blue.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
"https://images.pexels.com/photos/9214280/pexels-photo-9214280.png?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
"https://images.pexels.com/photos/9252069/pexels-photo-9252069.png?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
"https://images.pexels.com/photos/10195371/pexels-photo-10195371.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
],
"productName": "Nike Sneakers",
"description": "Vision Alta Men’s Shoes Size (All Colours)",
"currentPrice": 1599,
"originPrice": 2999,
"percentOff": 50,
"rating": 56890,
"productDetail": "Perhaps the most iconic sneaker of all-time, this original \"Chicago\"? colorway is the cornerstone to any sneaker collection. Made famous in 1985 by Michael Jordan, the shoe has stood the test of time, becoming the most famous colorway of the Air Jordan 1. This 2015 release saw the ...More",
"size": [
"6UK",
"7UK",
"8UK",
"9UK",
"10UK"
],
"deliveryTime": "1 within Hour"
}
}
"""
let similar = """
{
"id": "123456",
"productList": [
{
"id": "1234",
"image":
"https://images.pexels.com/photos/29127691/pexels-photo-29127691/free-photo-of-fashionable-woman-at-arc-de-triomphe-paris.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
"productName": "Black Winter Jacket unisex",
"description": "Autumn And Winter Casual cotton-padded jacket...",
"currentPrice": 1900,
"rating": 6890
},
{
"id": "45657",
"image":
"https://images.pexels.com/photos/6412694/pexels-photo-6412694.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
"productName": "Nike Sneakers",
"description": "Nike Air Jordan Retro 1 Low Mystic Black",
"currentPrice": 699,
"rating": 24567876
},
{
"id": "65798765",
"image":
"https://images.pexels.com/photos/1032110/pexels-photo-1032110.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
"productName": "Addidas shoes for Man and Women",
"description": "Two Unpaired Black and Gray Adidas Sply-350 V2",
"currentPrice": 1499,
"rating": 234654
},
{
"id": "345687",
"image":
"https://images.pexels.com/photos/1478442/pexels-photo-1478442.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
"productName": "Nike Sb Stefan Janoski ",
"description": "Person in Brown Camouflage Pants and Black Nike Sb Stefan Janoski With Black Socks",
"currentPrice": 899,
"rating": 234565
},
{
"id": "2345679876",
"image":
"https://images.pexels.com/photos/15336560/pexels-photo-15336560/free-photo-of-nike-dunk-high-retro-shoes-with-black-nike-socks-on-legs.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
"productName": "Nike Dunk High Retro",
"description": "Nike Dunk High Retro Shoes with Black Nike Socks on Legs",
"currentPrice": 1299,
"rating": 2345
},
{
"id": "123345658764",
"image":
"https://images.pexels.com/photos/5526492/pexels-photo-5526492.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
"productName": "Nike Running Shoes",
"description": "Close-Up Shot of Gray Sneakers on White Background",
"currentPrice": 1599,
"rating": 234565
}
]
}
"""
