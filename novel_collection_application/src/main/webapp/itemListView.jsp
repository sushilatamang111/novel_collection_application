<%@page import="aiwa.entity.Item"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Best Novel Collection</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    
   
    <style>
       
        .hero-section {
            background-color: #f8f9fa;
            text-align: center;
            padding: 60px 20px;
            margin-bottom: 40px;
            background-image: url('your-image-url.jpg'); 
            background-size: cover;
            background-position: center;
        }
        .hero-section h1 {
            font-size: 3em;
            color: #343a40;
            margin-bottom: 20px;
        }
        .hero-section p {
            font-size: 1.2em;
            color: #6c757d;
            margin-bottom: 30px;
        }
        .hero-section .btn {
            font-size: 1.1em;
            padding: 10px 30px;
            border-radius: 25px;
        }

        
        .card-img-top {
            height: 300px;
            object-fit: cover;
        }

        .card-body {
            padding: 15px;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            height: 250px; 
        }

        
        .stars {
            color: #f39c12;
        }

        .rating-number {
            font-size: 1.2em;
            color: #6c757d;
        }

        
        .card {
            height: 100%; 
        }

        
        .search-bar input {
            width: 300px;
        }
    </style>
</head>

<body>

    
    <header class="hero-section">
        <h1>Best Novel Collection</h1>
        <p>Discover Your Next Great Read</p>
        <a href="#catalog" class="btn btn-primary">Explore Now</a>
    </header>

   
    <div class="container search-bar mb-4">
        <form action="ItemListController">
            <div class="mb-3">
                <input class="form-control" type="text" name="keyword" placeholder="Search for books or items">
            </div>
            <div class="mb-3">
                <button class="btn btn-primary" type="submit">Search</button>
            </div>
        </form>
    </div>

    
    <div class="container" id="catalog">
        <div class="row">
           
            <%
                ArrayList<Item> items = (ArrayList<Item>) request.getAttribute("items");
                String word = (String) request.getAttribute("word");
                for (Item item : items) {
                    double rating = item.getRating(); 
                    int fullStars = (int) rating; 
                    boolean hasHalfStar = (rating - fullStars) >= 0.5; 
                    int emptyStars = 5 - fullStars - (hasHalfStar ? 1 : 0); 
            %>
            <div class="col-md-3 col-sm-6 mb-4">
                <div class="card">
                    <img src="<%= item.getImage() %>" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title"><%= item.getItemName() %></h5>
                        <p class="card-text">
                            <%= item.getPrice() %>円
                        </p>
                        <div class="stars">
                            
                            <%= new String(new char[fullStars]).replace("\0", "★") %>
                            
                            <%= hasHalfStar ? "½" : "" %>
                            
                            <%= new String(new char[emptyStars]).replace("\0", "☆") %>
                        </div>
                        <p class="rating-number">
                            Rating: <%= rating %> / 5
                        </p>
                        <a href="ItemDetailController?itemid=<%= item.getItemId() %>" class="btn btn-primary">詳細を表示</a>
                    </div>
                </div>
            </div>
            <% } %>
        </div>
    </div>

</body>
</html>