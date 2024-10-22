//
//  mock.swift
//  E-commerce-App
//
//  Created by Andy on 17/10/2024.
//

import Foundation

let userInfor = """
{
  "id": 12345,
  "username": "tester",
  "email": "testuser@example.com",
  "avatar": "https://images.pexels.com/photos/35537/child-children-girl-happy.jpg",
  "created_at": "2023-01-01T12:00:00Z"
}
"""

let itemcatefory = """
{
  "id": 123456,
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
  "id": 123456,
  "sale_off": [
    {
      "image": "https://images.pexels.com/photos/10738239/pexels-photo-10738239.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
      "title": "50% Off",
      "productName": "Nike Shoes",
      "color": "Red"
    },
    {
      "image": "https://images.pexels.com/photos/974911/pexels-photo-974911.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
      "title": "30% Off",
      "productName": "Summer Dress",
      "color": "Black"
    },
    {
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
  "id": 123456,
  "timeRemain": "22h 55m 20s remaining",
  "deal_off": [
    {
      "image": "https://images.pexels.com/photos/28985263/pexels-photo-28985263/free-photo-of-elegant-woman-in-summer-dress-sitting-outdoors.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "productName": "Women Printed Kurta",
      "productDetail": "Neque porro quisquam est qui dolorem ipsum quia",
      "currentPrice": 1500,
      "originPrice": 2499,
      "percentOff": 40,
      "rating": 56.890
    },
    {
      "image": "https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "productName": "Women Printed Kurta",
      "productDetail": "HRX by Hrithik Roshan",
      "currentPrice": 2499,
      "originPrice": 4999,
      "percentOff": 50,
      "rating": 344.567
    },
    {
      "image": "https://images.pexels.com/photos/28985263/pexels-photo-28985263/free-photo-of-elegant-woman-in-summer-dress-sitting-outdoors.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "productName": "Women Printed Kurta",
      "productDetail": "Neque porro quisquam est qui dolorem ipsum quia",
      "currentPrice": 1500,
      "originPrice": 2499,
      "percentOff": 40,
      "rating": 56.890
    },
    {
      "image": "https://images.pexels.com/photos/1317712/pexels-photo-1317712.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "productName": "Man Yellow Jacket",
      "productDetail": "Neque porro quisquam est qui dolorem ipsum quia",
      "currentPrice": 1500,
      "originPrice": 2499,
      "percentOff": 40,
      "rating": 56.890
    },
    {
      "image": "https://images.pexels.com/photos/5693889/pexels-photo-5693889.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "productName": "Pink Dress for girls",
      "productDetail": "Neque porro quisquam est qui dolorem ipsum quia",
      "currentPrice": 150,
      "originPrice": 249,
      "percentOff": 40,
      "rating": 56.890
    },
    {
      "image": "https://images.pexels.com/photos/3026856/pexels-photo-3026856.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "productName": "Baby's snakers",
      "productDetail": "Neque porro quisquam est qui dolorem ipsum quia",
      "currentPrice": 200,
      "originPrice": 400,
      "percentOff": 50,
      "rating": 56.890
    }
  ]
}
"""

let specialOffer = """
{
  "id": 123456,
  "offer": {
      "image": "https://ibb.co/d0HK1gg",
      "productName": "Flat and Heels",
      "productDetail": "Stand a chance to get rewarded"
    }
}
"""
let trending = """
{
  "id": 123456,
  "lastDate": "29/02/22",
  "trending": [
    {
      "image": "https://images.pexels.com/photos/2010018/pexels-photo-2010018.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "description": "IWC Schaffhausen 2021 Pilot's Watch \"SIHH 2019\" 44mm",
      "currentPrice": 650,
      "originPrice": 1599,
      "percentOff": 60
    },
    {
      "image": "https://images.pexels.com/photos/4876536/pexels-photo-4876536.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "description": "Labbin White Sneakers For Men and Female",
      "currentPrice": 650,
      "originPrice": 1250,
      "percentOff": 70
    },
    {
      "image": "https://images.pexels.com/photos/3908800/pexels-photo-3908800.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "description": "Mammon Women's Handbag (Set of 3, Beige)",
      "currentPrice": 150,
      "originPrice": 1699,
      "percentOff": 60
    },
    {
      "image": "https://images.pexels.com/photos/9267589/pexels-photo-9267589.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "description": "Flat mules for women (with 3cm heels, Beige)",
      "currentPrice": 650,
      "originPrice": 1599,
      "percentOff": 60
    },
    {
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
  "id": 123456,
  "sponserd": {
      "image": "https://images.pexels.com/photos/5872185/pexels-photo-5872185.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "detail": "up to 50% Off"
    }
}
"""
