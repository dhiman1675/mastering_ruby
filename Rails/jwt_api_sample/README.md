# README

This API's will allow users to:

* Register and log in.
* Obtain a JSON Web Token (JWT) upon successful authentication.
* Access protected endpoints with a valid JWT.
* Perform token-based actions like fetching user profile data.

## Example Api's

1. Register User
   POST /api/v1/register
   
Body
   

    {
    "name": "John Doe",
    "email": "john@example.com",
    "password": "password123",
    "password_confirmation": "password123"
    }

2. Login User
   POST /api/v1/login
   
Body

    {
    "email": "john@example.com",
    "password": "password123"
    }

3. Get User Details
   GET /api/v1/user
   
Body

      {
      "Authorization": "Bearer <your_jwt_token>"
      }

## To set jwt_secret

You can use 'rails credentials:edit'