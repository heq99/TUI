<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>

<h1>Welcome to TUI Coffee Shop!</h1>

<h2>Please choose the brand:</h2>

<table>
	<tr>
	<c:forEach items="${brandList}" var="brand">
		<td>
			<a href="/brand/${brand.id}">
				<img src="<c:url value="${brand.location}" />" />
			</a>
		</td>
	</c:forEach>
	</tr>
</table>

</body>
</html>
