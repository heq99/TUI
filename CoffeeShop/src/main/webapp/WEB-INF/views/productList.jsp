<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/main.css" />">
</head>
<body>

<h1>
	<img src="<c:url value="${productBrand.location}" />" width="80px" height="80px"/>
	TUI Coffee Shop
</h1>

<p><a href="<c:url value="/"/>">Home</a></p>

<h2>Product List:</h2>

<table>
	<tr>
		<td>
			<table>
				<tr>
					<th width="200px">Product</th>
					<th width="300px">Description</th>
					<th width="100px">&nbsp;</th>
				</tr>
				<c:forEach items="${productList}" var="product">
				<tr>
					<td>${product.name}</td>
					<td>
						${product.description}
					</td>
					<td>
						<a href="<c:url value="/product/${product.id}"/>">Buy</a>
					</td>
				</tr>
				</c:forEach>
			</table>
		</td>
		<td valign="top">
			Shopping Cart:<br/>
			<table>
				<tr>
					<th width="200px">Product Name</th>
					<th width="200px"></th>
					<th width="100px">Quantity</th>
					<th width="100px">Price</th>
					<th width="100px">&nbsp;</th>
				</tr>
				<c:forEach items="${cart.cartItems}" var="cartItem" varStatus="status">
				<tr>
					<td>${cartItem.product.name}</td>
					<td>
						<c:forEach items="${cartItem.attributes}" var="attr">
							<c:out value="${attr.value}" />
							<br/>
						</c:forEach>
					</td>
					<td>${cartItem.quantity}</td>
					<td><c:out value="£${cartItem.price / 100.0}" /></td>
					<td>
						<a href="<c:url value="/product/delete_cart_item/${status.index}"/>">Delete</a>
					</td>
				</tr>
				</c:forEach>
			</table>
			Total Price: ${cartPrice}
		</td>
	</tr>
</table>
</body>
</html>
