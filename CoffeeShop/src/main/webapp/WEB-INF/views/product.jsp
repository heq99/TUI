<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/main.css" />">
	<script type="text/javascript">
	function updatePrice() {
		var prodForm = document.getElementById("cartItem");
		prodForm.action = "/product/update_price";
		prodForm.submit();
	}
	function submitForm() {
		var prodForm = document.getElementById("cartItem");
		prodForm.action = "/product/add_cart_item";
		prodForm.submit();
	}
	function cancel() {
		window.location.href="<c:url value="/brand/${product.productBrand.id}"/>";
	}
	</script>
</head>
<body>

<h1>
	<img src="<c:url value="${product.productBrand.location}" />" width="80px" height="80px"/>
	TUI Coffee Shop
</h1>



<h2>Product Details</h2>

<form:form commandName="cartItem" action="add_cart_item" method="post">
<table>
	<tr>
		<td>Product name:</td>
		<td>${product.name}</td>
	</tr>
	<tr>
		<td>Description:</td>
		<td>${product.description}</td>
	</tr>
	<c:forEach items="${product.productAttributes}" var="prodAttr" varStatus="status">
	<tr>
		<td><label for="attributes[${status.index}].id">${prodAttr.name}:</label></td>
		<td>
			<form:select path="attributes[${status.index}].id" multiple="false"  
						 onchange="javascript:{updatePrice();}">
				<option value="0">-- Please select --</option>
				<form:options items="${prodAttr.productAttributeValues}" itemLabel="value" itemValue="id" />
			</form:select> 
			<form:errors path="attributes[${status.index}].id" cssClass="errorMsg"/>
		</td>
	</tr>
	</c:forEach>
	<tr>
		<td>
			<label for="quantity">Quantity:</label>
		</td>
		<td>
			<form:input path="quantity" onkeyup="javascript:{updatePrice();}"/>
			<form:errors path="quantity" cssClass="errorMsg"/>
		</td>
	</tr>
	<tr>
		<td>Price:</td>
		<td>
			<form:hidden path="price"/>
			<c:out value="£${cartItem.price / 100.0}" />
		</td>
	</tr>
	<tr>
		<td>
			<input type="button" value="Buy" onclick="javascript:{submitForm();}"/>
		</td>
		<td>
			<input type="button" value="Back" 
				onclick="javascript:{cancel();}"/>
		</td>
	</tr>
</table>
</form:form>

</body>
</html>
