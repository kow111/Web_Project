
<% String username = Long.toString((Long) request.getSession().getAttribute("id")); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--<% String username = Long.toString((Long) request.getSession().getAttribute("id")); %>--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<title>ALOHCMUTE</title>
</head>
<body>
	<!-- ================= Appbar ================= -->
	<nav style="font-size: 17px">
		<div class="container-fluid">
		    <a class="navbar-brand" href="/article/getArticle" style="font-size: 20px; margin-top: 5px">ALOHCMUTE</a>
			<div class="row align-items-center">
				<!-- search -->
				<div class="col d-flex align-items-center">
					<form method="get" action="#">
						<!-- search bar -->
						<div class="input-group-text bg-gray border-0 rounded-pill"
							style="min-height: 40px; min-width: 230px">
							<i class="fas fa-search me-2 text-muted"></i> 
							<input type="text"
								class="rounded-pill border-0 bg-gray dropdown-item"
								placeholder="Search..." name="filter" autofocus style="font-size: 12px">
							<button class="search-button" formaction="/article/search" style="font-size: 12px">Search</button>
						</div>
					</form>
				</div>
				<!-- nav -->
				<div class="col d-none d-xl-flex justify-content-center">
					<!-- home -->
					<a href="/article/getArticle">
						<button type="button" class="btn px-4">
							<i class="fas fa-home text-muted fs-4" href="/article/getArticle"></i>
						</button>
					</a>
					<!-- group -->
					<a href="/user/getUser">
						<button type="button" class="btn px-4">
							<i type="button"
								class="position-relative fas fa-users text-muted fs-4"> </i>

						</button>
					</a>
				</div>
				<!-- menus -->
				<div class="col d-flex align-items-center justify-content-end">
					<!-- avatar -->
					<a href="/article/user/<%=username%>"
						class="d-flex text-decoration-none text-dark">
						<div
							class="align-items-center justify-content-center d-none d-xl-flex">
							<img
								src="https://firebasestorage.googleapis.com/v0/b/web-springboot-1a3ab.appspot.com/o/Web_project%2Fusers%2F${userOwn.image}?alt=media"
								class="rounded-circle me-2" alt="avatar"
								style="width: 38px; height: 38px; object-fit: cover" />
							<p class="m-0 ">${userOwn.name}</p>

						</div>
					</a>
					<!-- chat -->
					<a href="/user/Inbox/<%=username%>" class="d-flex text-decoration-none text-dark">
					<div
						class="rounded-circle p-1 bg-gray d-flex align-items-center justify-content-center mx-2"
						style="width: 38px; height: 38px" type="button">
						<i class="fas fa-comment"></i>			
					</div></a>
					<!-- notifications -->
					<div
						class="rounded-circle p-1 bg-gray d-flex align-items-center justify-content-center mx-2"
						style="width: 38px; height: 38px" type="button"
						data-bs-toggle="dropdown" aria-expanded="false"
						data-bs-auto-close="outside">
						<i class="fas fa-bell"></i> <a onclick="toggleNotifications()"></a>
					</div>
					
					
					<!-- notifications dd -->
					<ul class="dropdown-menu border-0 shadow p-3"
						aria-labelledby="notMenu"
						style="width: 50em; max-height: 600px; overflow-y: auto">

						<!-- header -->
						<li class="p-1">
							<div class="d-flex justify-content-between">
								<h2>Notifications</h2>
							</div>
						</li>

						<c:forEach var="i" items="${notics}">
							<c:if test="${i.type == 1}">
								<ul>	
									<li><a href="/article/Comment/${i.article.articleID}" style="font-size: 15px; text-decoration: none">
									<img class="rounded-circle"
											src="https://firebasestorage.googleapis.com/v0/b/web-springboot-1a3ab.appspot.com/o/Web_project%2Fusers%2F${i.sender.image}?alt=media"
											alt="avatar" width="50" height="50"> ${i.notif}</a><p  style="font-size: 14px"
										class="mf-date"><i class="fa fa-clock-o"></i>
											${i.time}</p></li>
								</ul>
							</c:if>
							<c:if test="${i.type == 2}">
								<ul>
									<li><a href="/article/user/${i.sender.userID}" style="font-size: 15px; text-decoration: none" ><img
											class="rounded-circle"
											src="https://firebasestorage.googleapis.com/v0/b/web-springboot-1a3ab.appspot.com/o/Web_project%2Fusers%2F${i.sender.image}?alt=media"
											alt="avatar" width="50" height="50" > ${i.notif}</a>
											<p  style="font-size: 14px" class="mf-date"><i class="fa fa-clock-o"></i>
											${i.time}</p></li>
								</ul>
							</c:if>
							<hr>
						</c:forEach>
					</ul>
					<div
						class="rounded-circle p-1 bg-gray d-flex align-items-center justify-content-center mx-2"
						style="width: 38px; height: 38px" type="button" id="secondMenu"
						data-bs-toggle="dropdown" aria-expanded="false"
						data-bs-auto-close="outside">
						<i class="fas fa-caret-down"></i>
					</div>
					<!-- secondary menu dd -->
					<ul class="dropdown-menu border-0 shadow p-3"
						aria-labelledby="secondMenu" style="width: 23em">
						<!-- avatar -->
						<li class="dropdown-item p-1 rounded d-flex"><a
							class="d-flex text-decoration-none text-dark"
							href="/article/user/<%=username%>"><img
								src="https://firebasestorage.googleapis.com/v0/b/web-springboot-1a3ab.appspot.com/o/Web_project%2Fusers%2F${userOwn.image}?alt=media"
								alt="avatar" class="rounded-circle me-2"
								style="width: 45px; height: 45px; object-fit: cover">
								<div
									class=" ms-3 d-flex justify-content-between align-items-center w-100">
									<p class="m-0" style="font-size: 15px">See your profile</p>
								</div> </a></li>
						<hr />
						<li class="nav-item"><a href="/logout"
							class="d-flex text-decoration-none text-dark"> <i
								class="fas fa-cog bg-gray p-2 rounded-circle"></i>
								<div
									class=" ms-3 d-flex justify-content-between align-items-center w-100">
									<p class="m-0" style="font-size: 15px">Log Out</p>
								</div>
						</a></li>
					</ul>
				</div>
			</div>
		</div>
	</nav>
</body>
</html>