<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/mystyle.css" />">
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
	</script>
</head>
<body>

<h1>
	<img src="<c:url value="${product.productBrand.location}" />" width="80px" height="80px"/>
	TUI Coffee Shop
</h1>



<h2>Product Details</h2>

<table>
	<form:form commandName="cartItem" action="add_cart_item" method="post">
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
		<td>${prodAttr.name}:</td>
		<td>
			<form:select path="attributes[${status.index}].id" multiple="false"  
						 onchange="javascript:{updatePrice();}">
				<option value="0">-- Please select --</option>
				<form:options items="${prodAttr.productAttributeValues}" itemLabel="value" itemValue="id" />
			</form:select> 
		</td>
	</tr>
	</c:forEach>
	<tr>
		<td>Quantity:</td>
		<td>
			<form:input path="quantity" onkeyup="javascript:{updatePrice();}"/>
		</td>
	</tr>
	<tr>
		<td>Price:</td>
		<td>
			<c:if test="${totalPrice!=null}">
				${totalPrice}
			</c:if>
			<c:if test="${totalPrice==null}">
				&nbsp;
			</c:if>
			
		</td>
	</tr>
	<tr>
		<td>
			<input type="button" value="Buy" onclick="javascript:{submitForm();}"/>
		</td>
		<td>
			<input type="button" value="Back" onclick="javascript:{backToProdList();}"/>
		</td>
	</tr>
	</form:form>
</table>

</body>
</html>
