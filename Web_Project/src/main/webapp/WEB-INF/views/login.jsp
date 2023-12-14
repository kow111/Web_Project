<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!-- fontawesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
	integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<!-- bootstrap -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU"
	crossorigin="anonymous" />
<!-- main style -->
<link rel="stylesheet"
	href='<c:url value="/templates/user/css/main.css"/>' type="text/css">
<title>ALOHCMUTE</title>
</head>
<body class="bg-gray">
	<!-- Login -->
    <div class="container mt-5 pt-5 d-flex flex-column flex-lg-row justify-content-evenly">
      <!-- heading -->
      <div class="text-center text-lg-start mt-0 pt-0 mt-lg-5 pt-lg-5">
        <h1 class="text-primary fw-bold fs-0">ALOHCMUTE</h1>
        <p class="w-75 mx-auto fs-4 mx-lg-0">ALOHCMUTE helps you connect and share with the people in your life.</p>
      </div>
      <!-- form card -->
      <div style="max-width: 28rem; width: 100%">
        <!-- login form -->
        <!-- first was form tag -->
        <div class="bg-white shadow rounded p-3 input-group-lg">
        <form:form method="POST"
                     action = "/login"
                     modelAttribute="user">
          <form:input type="text" class="form-control my-3" placeholder="Username or phonenumber" path = "phoneNumber"/>
          <form:input type="password" class="form-control my-3" placeholder="Enter Password"  path = "password"/>
          <p class="error">${ERROR}</p>
          <input type="submit" class="btn btn-primary w-100 my-3" value="Login">
          <!-- <a href="./feed.html"><button class="btn btn-primary w-100 my-3">Log In</button></a>       --> 
          </form:form>
          <hr />
          <div class="text-center my-4">
            <button class="btn btn-success btn-lg" type="button" data-bs-toggle="modal" data-bs-target="#createModal">Create New Account</button>
          </div>
          <!-- create modal -->
          <div class="modal fade" id="createModal" tabindex="-1" aria-labelledby="createModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
              <div class="modal-content">
                <!-- head -->
                <div class="modal-header">
                  <div>
                    <h2 class="modal-title" id="exampleModalLabel">Sign Up</h2>
                    <span class="text-muted fs-7">It's quick and easy.</span>
                  </div>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <!-- body -->
                <div class="modal-body">
                  <form:form method="POST"
                               action = "/register"
                               modelAttribute="user"
                               enctype="multipart/form-data">
                  	<form:input type="text" class="form-control my-3" placeholder="Name" path = "Name"/>
                    <form:input type="text" class="form-control my-3" placeholder="Username" path = "phoneNumber"/>
                    <form:input type="password" class="form-control my-3" placeholder=" Enter Password" path = "password"/>
                    <input type = "file" name = "image"/><br>
                    <!-- disclaimer -->
                    <div>
                      <span class="text-muted fs-7">By clicking Sign Up, you agree to our Terms, Data Policy....</span>
                    </div>
                    <!-- btn -->
                    <div class="text-center mt-3">
<!--                       <button type="button" class="btn btn-success btn-lg" data-bs-dismiss="modal">Sign Up</button>-->                       
                       <input type="submit" class="btn btn-success btn-lg" value="Sign Up">
                    </div>
                  </form:form >
                </div>
              </div>
            </div>
          </div>
          <!-- modal end -->
        </div>
        <!-- tag -->
        <div class="my-5 pb-5 text-center">
          <p class="fw-bold"><a href="#" class="text-decoration-none text-dark">Createa a Page</a> <span class="fw-normal">for a celebrity, band or business.</span></p>
        </div>
      </div>
    </div>
	<!-- Footer -->
	<footer class="bg-white p-4 text-muted">
		<div class="container">
			<!-- language -->
			<div class="d-flex flex-wrap">
				<p class="mx-2 fs-7 mb-0">English (US)</p>
				<p class="mx-2 fs-7 mb-0">Tiếng Việt</p>
				<p class="mx-2 fs-7 mb-0">中文(台灣)</p>
				<p class="mx-2 fs-7 mb-0">한국어</p>
				<p class="mx-2 fs-7 mb-0">日本語</p>
			</div>
			<hr />
			<!-- actions -->
			<div class="d-flex flex-wrap">
				<p class="mx-2 fs-7 mb-0">Sign Up</p>
				<p class="mx-2 fs-7 mb-0">Login</p>
				<p class="mx-2 fs-7 mb-0">Messenger</p>
				<p class="mx-2 fs-7 mb-0">Alohcmute Lite</p>
				<p class="mx-2 fs-7 mb-0">Watch</p>
			</div>
			<!-- copy -->
			<div class="mt-4 mx-2">
				<p class="fs-7">Alohcmute &copy; 2021</p>
			</div>
		</div>
	</footer>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
		crossorigin="anonymous"></script>
	<script src="/templates/user/js/main.js"></script>
</body>
</html>