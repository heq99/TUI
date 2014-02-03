<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/main.css" />">
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
					<th width="350px" align="left">Description</th>
				</tr>
				<c:forEach items="${productList}" var="product">
				<tr>
					<td valign="top">
						<a href="<c:url value="/product/${product.id}"/>">
							${product.name}
						</a>
					</td>
					<td class="prodDesc">
						${product.description}<br/>
						&nbsp;
					</td>
				</tr>
				</c:forEach>
			</table>
		</td>
		<td width="100px">&nbsp;</td>
		<td valign="top">
			Shopping Cart:<br/>
			<table class="shoppingCart">
				<tr>
					<th class="shoppingCart" width="200px">Product Name</th>
					<th class="shoppingCart" width="120px"></th>
					<th class="shoppingCart" width="50px">Qty</th>
					<th class="shoppingCart" width="80px">Price</th>
					<th class="shoppingCart" width="60px">&nbsp;</th>
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
					<td>&pound;<c:out value="${cartItem.price / 100.0}" /></td>
					<td>
						<a href="<c:url value="/product/delete_cart_item/${status.index}"/>">Delete</a>
					</td>
				</tr>
				</c:forEach>
				<tr>
					<td class="cartTotalPrice" colspan="3" align="right">Total Price: &nbsp;</td>
					<td class="cartTotalPrice" colspan="2">${cartPrice}</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
</body>
</html>
