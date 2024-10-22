//
//  mock.swift
//  E-commerce-App
//
//  Created by Andy on 14/10/2024.
//

let loginMock = """
{
"status": "success",
"messege": "Log in successfully",
"user": {
    "id": "1",
    "userName": "abc@gmail.com",
    "password": "T4mb!234",
    "avatar": "https://images.pexels.com/photos/35537/child-children-girl-happy.jpg"
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InRlc3R1c2VyIiwiaWF0IjoxNjE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c"
}
}
"""

let creatMock = """

{
  "status": true,
  "message": "Tạo tài khoản thành công",
  "user": {
    "id": "123456",
    "username": "newUser123",
    "password": "securePassword123",
    "confirmPassword": "securePassword123"
  }
}

"""

let findPWSuccess = """
{
  "status": "success",
  "message": "Verification code has been sent to your email address.",
  "data": {
    "userName": "exampleUser",
    "email": "exampleUser@example.com",
    "verificationCode": "123456",
    "verificationExpiry": "2024-10-15T15:00:00Z"
  }
}
"""

let findPWError = """
{
  "status": "error",
  "message": "User not found. Please check the userName and try again.",
  "errorCode": "USER_NOT_FOUND"
}
"""
