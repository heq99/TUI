<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/mystyle.css" />">
	<script type="text/javascript">
	var prodDefPrice = {};
	var attrPrice = {};
	
	function updatePrice(productId) {
		var attrs = document.getElementsByName("attrSelect"+productId);
		var price = 0;
		price += prodDefPrice["prod"+productId];
		for (var i=0; i<attrs.length; i++) {
			var attrSelect = attrs[i];
			var attrId = attrSelect.options[attrSelect.selectedIndex].value;
			if (attrId !== "none") {
				price += attrPrice["attr"+attrId];
			}
		}
		
		var qty = document.getElementById("quantity"+productId).value;
		if (qty==null || qty=="") {
			qty = 0;
		}
		
		var totalPrice = price * qty;
		
		document.getElementById("totalPrice"+productId).innerHTML = "£"+totalPrice/100.0;
	}
	
	function buyProduct(productId) {
		var attrs = document.getElementsByName("attrSelect"+productId);
		for (var i=0; i<attrs.length; i++) {
			var attrSelect = attrs[i];
			var attrId = attrSelect.options[attrSelect.selectedIndex].value;
			if (attrId == "none") {
				alert("Please select ");
				return;
			}
		}
		var url="";
	}
	</script>
</head>
<body>

<h1>
	<img src="<c:url value="${productBrand.location}" />" width="80px" height="80px"/>
	TUI Coffee Shop
</h1>



<h2>Please choose the products:</h2>

<table>
	<tr>
		<th width="200px">Product</th>
		<th width="300px">Description</th>
		<th width="180px">Options</th>
		<th width="100px">Quantity</th>
		<th width="100px">Price</th>
		<th width="100px">&nbsp;</th>
	</tr>
	<c:forEach items="${productList}" var="product">
	<tr>
		<td>${product.name}</td>
		<td>
			${product.description}
			<script type="text/javascript">
				prodDefPrice["prod<c:out value="${product.id}"/>"] = <c:out value="${product.defaultPrice}" />;
			</script>
		</td>
		<td>
			<c:forEach items="${product.productAttributes}" var="attr" varStatus="status">
				${attr.name}
				<select name="attrSelect${product.id}" onchange="javascript:{updatePrice(${product.id});}">
					<option value="none">Please Select</option>
					<c:forEach items="${attr.productAttributeValues}" var="val">
					<script type="text/javascript">
						<c:if test="${val.price!=null}" >
							attrPrice["attr<c:out value="${val.id}"/>"] = <c:out value="${val.price}"/>;
						</c:if>
						<c:if test="${val.price==null}" >
							attrPrice["attr<c:out value="${val.id}"/>"] = 0;
						</c:if>
					</script>
					<option value="${val.id}">
						${val.value} 
						<c:if test="${val.price!=null}" > - £${val.price / 100.0}</c:if>
					</option>
					</c:forEach>
				</select>
				<br/>
			</c:forEach>
		</td>
		<td width="100px">
			<input id="quantity${product.id}" size="2" onkeyup="javascript:{updatePrice(${product.id});}"/>
		</td>
		<td width="100px">
			<div id="totalPrice${product.id}">&nbsp;</div>
		</td>
		<td>
			<input type="submit" value="Buy" onclick="javascript:{buyProduct(${product.id});}"/>
		</td>
	</tr>
	</c:forEach>
</table>

</body>
</html>
