<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Stars</title>
<link href="bootstrap/css/bootstrap.css" rel="stylesheet" />
<link href="/datepicker/css/datepicker.css" rel="stylesheet" />
<link href="/assets/css/bootstrap-united.css" rel="stylesheet" />

<style>

.green {
	font-weight: bold;
	color: green;
}

.message {
	margin-bottom: 10px;
}

.error {
	color: #ff0000;
	font-size: 0.9em;
	font-weight: bold;
}

.errorblock {
	color: #000;
	background-color: #ffEEEE;
	border: 3px solid #ff0000;
	padding: 8px;
	margin: 16px;
}
</style>
</head>
<body>

	<div class="navbar navbar-default">

		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-responsive-collapse">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
		</div>

		<div class="navbar-collapse collapse navbar-responsive-collapse">
			<form class="navbar-form navbar-right">
				<input type="text" class="form-control" placeholder="Search">
			</form>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="">Home</a></li>
				<li class="active"><a href="stars.html">Stars Catalog</a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">Actions<b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="discoverers.html">Discoverers</a></li>
						<li><a href="newstar">Add Star</a></li>
					</ul></li>
			</ul>
		</div>
		<!-- /.nav-collapse -->
	</div>

	<script src="jquery-1.8.3.js">
		
	</script>

	<script src="bootstrap/js/bootstrap.js">
		
	</script>

	<script src="datepicker/js/bootstrap-datepicker.js">
		
	</script>


	<div class="container">
		<div class="jumbotron">
			<div>
				<h1>Welcome to Stars catalog</h1>
			</div>
		</div>

		<div></div>
	</div>

	<c:if test="${not empty message}">
		<div class="message green">${message}</div>
	</c:if>

	<div class="col-lg-6 col-lg-offset-3">

<form:errors path="discoverer" cssClass="error" />

<table class="col-lg-3 control-label" style="width:100%" align="left" border="1" colspan="30" rowspan="30">
    <thead>
            <th data-field="name">Name</th>
            <th data-field="a1">Altitude</th>
            <th data-field="a2">Longitude</th>
            <th data-field="a3">Class</th>
            <th data-field="a4">Discoverer</th>
            <th data-field="a5"> Edit </th>
            <th data-field="a6"> Delete </th>
       
    </thead>
	<c:if test="${not empty stars}">
  <c:forEach items="${stars}" var="star">
    <tr>
        <td>${star.name}</td>
        <td align="right">${star.altitude}</td>
        <td align="right">${star.longitude}</td>
        <td align="center">${star.clazz}</td>
        <td>${star.discoverer}</td> 
        <td><a href="<c:url value='/editstar?id=${star.id}' />" >Edit</a></td>  
        <td><a href="<c:url value='/deletestar?id=${star.id}' />" >Delete</a></td>
    </tr>
</c:forEach>
	</c:if>

</table>

	</div>



	<script>
		$(function() {
			var yesButton = $("#yesbutton");
			var progress = $("#doitprogress");

			yesButton.click(function() {
				yesButton.button("loading");

				var counter = 0;
				var countDown = function() {
					counter++;
					if (counter == 11) {
						yesButton.button("complete");
					} else {
						progress.width(counter * 10 + "%");
						setTimeout(countDown, 100);
					}
				};
				setTimeout(countDown, 100);
			});

		});
	</script>
	



</body>
</html>