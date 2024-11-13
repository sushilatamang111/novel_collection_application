<%@page import="aiwa.entity.Item"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>welcome to my novel collection</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
	
	<%
	
	Item item =(Item) request.getAttribute("item");
	
	%>
</head>
<body>

<div class="container col-6">
	
	<button class="btn btn-primary mb-3" onclick="history.back()">戻る</button>
	 	
	 	<table class="table table-striped">
	 		<tr>
	 			<th>商品ID</th><td><%=item.getItemId() %></td>
	 		</tr>
	 		<tr>
	 			<th>商品名</th><td><%=item.getItemName() %></td>
	 			
	 		</tr>
	 		<tr>
	 			<th>価格</th><td><%=item.getPrice() %></td>
	 		<tr>
	 			<th>説明</th><td><%=item.getDetail().replace("\n", "<br>") %></td>
	 		</tr>
	 		
	 		<tr>
	 		
	 		   <th>評価</th><td><%=item.getRating() %></td>
	 		
	 		</tr>
	 	
	 		</tr>
	 		<tr>
	 			 <th>画像</th><td><img class="img-fluid" src="<%= item.getImage()%>"> </td>
	 		</tr>
	 	
	 	
	 	
	 	</table>
	</div>

</body>
</html>