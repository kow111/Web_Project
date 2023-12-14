<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String username = Long.toString((Long) request.getSession().getAttribute("id"));
%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<body>
	<link
		href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
		rel="stylesheet">
	<div class="container" style="font-size: 15px">
		<%--    <div class="col-md-7">--%>
		<div class="bg-white p-3 mt-3 rounded border shadow">
			<div class="d-flex">
				<a href="/article/user/${article.user.userID}" class="pull-left">
					<img alt="avatar" class="rounded-circle me-2"
					style="width: 38px; height: 38px; object-fit: cover"
					src="https://firebasestorage.googleapis.com/v0/b/web-springboot-1a3ab.appspot.com/o/Web_project%2Fusers%2F${article.user.image}?alt=media">
				</a>
				<div>
					<p class="m-0 fw-bold">
						<a href="/article/user/${article.user.userID}"
							style="text-decoration: none; color: #000">${article.user.name}</a>
					</p>
					<span class="text-muted fs-7" style="font-size: 12px">${article.time}</span>
				</div>
			</div>

			<div class="mt-3">
				<div>
					<p>${article.description}</p>
					<c:if test="${article.image!=null}">
						<img
							src='https://firebasestorage.googleapis.com/v0/b/web-springboot-1a3ab.appspot.com/o/Web_project%2Farticles%2F${article.image}?alt=media'
							class="img-responsive" alt="image1">
					</c:if>
				</div>


				<div class="post__comment mt-3 position-relative">
					<!-- likes -->
					<div
						class="d-flex align-items-center top-0 start-0 position-absolute post-container"
						style="height: 50px; z-index: 5">
						<div class="me-2">
							<i class="text-primary fas fa-thumbs-up"></i>
						</div>
						<div class="post-container" data-post-id="${article.articleID}">
							<p class="m-0 text-muted fs-7 likeCount"
								data-post-id="${article.articleID}" style="font-size: 15px">${article.likes}</p>
						</div>
					</div>
					<!-- comments start-->
					<div class="accordion" id="accordionExample">
						<div class="accordion-item border-0">
							<!-- comment collapse -->
							<h2 class="accordion-header" id="headingTwo">
								<div
									class="accordion-button collapsed pointer d-flex justify-content-end">
									<p class="m-0" style="color: white;">.</p>
								</div>
							</h2>
							<hr />
							<!-- comment & like bar -->
							<div class="d-flex justify-content-around">
								<div
									class="dropdown-item rounded d-flex justify-content-center align-items-center pointer text-muted p-1 post-container1"
									data-post-id="${article.articleID}">
									<c:if test="${article.usersWhoLiked.contains(userOwn)}">
										<p onclick="likePost(${article.articleID}, true)"
											data-post-id="${article.articleID}" class="m-0 btn123">
											<i class="fas fa-thumbs-up me-3"></i> Unlike
										</p>
									</c:if>
									<c:if test="${!article.usersWhoLiked.contains(userOwn)}">
										<p onclick="likePost(${article.articleID}, false)"
											data-post-id="${article.articleID}" class="m-0 btn123">
											<i class="fas fa-thumbs-up me-3"></i> Like
										</p>
									</c:if>
								</div>
								<a
									class="dropdown-item rounded d-flex justify-content-center align-items-center pointer text-muted p-1"
									href="/article/Comment/${article.articleID}"> <i
									class="fas fa-comment-alt me-3"></i> Comment
								</a>
							</div>
						</div>
					</div>
				</div>



				<div class="social-footer">
					<div class="social-comment">
						<form:form method="POST" action="#" modelAttribute="comment"
							enctype="multipart/form-data">
							<a href="" class="pull-left"> <img alt="image"
								src="https://firebasestorage.googleapis.com/v0/b/web-springboot-1a3ab.appspot.com/o/Web_project%2Fusers%2F${userOwn.image}?alt=media"
								class="rounded-circle me-2"
								style="width: 38px; height: 38px; object-fit: cover">
							</a>
							<div class="media-body">
								<form:textarea class="form-control" path="content"
									value="${comment.content}" placeholder="Write comment..."
									style="font-size: 15px" />
								<input name="images" type="file"
									style="margin-top: 10px; margin-bottom: 10px" />
								<c:if test="${comment.image!=null}">
									<img
										src='https://firebasestorage.googleapis.com/v0/b/web-springboot-1a3ab.appspot.com/o/Web_project%2Fcomments%2F${comment.image}?alt=media'
										class="img-responsive" alt="image1">
								</c:if>
							</div>
							<c:if test="${comment.id == null}">
								<button
									formaction="<c:url value="/article/addComment/${articleId}"/> "
									class="btn btn-primary w-90"
									style="font-size: 15px; margin-left: 43px">Add comment
								</button>
							</c:if>
							<c:if test="${comment.id != null}">
								<button
									formaction="<c:url value="/article/updateComment/${comment.id}"/> "
									class="btn btn-primary w-90"
									style="font-size: 15px; margin-left: 43px">Update
									comment</button>
							</c:if>
						</form:form>
					</div>
					<div class="accordion-body">
						<c:forEach var="i" items="${comments}">
							<div class="d-flex justify-content-between">
								<div class="d-flex">
									<a href="/article/user/${i.user.userID}" class="pull-left">
										<img alt="avatar"
										src="https://firebasestorage.googleapis.com/v0/b/web-springboot-1a3ab.appspot.com/o/Web_project%2Fusers%2F${i.user.image}?alt=media"
										class="rounded-circle me-2"
										style="width: 38px; height: 38px; object-fit: cover">
									</a>
									<div>
										<p class="m-0 fw-bold">
											<a href="/article/user/${i.user.userID}"
												style="text-decoration: none; color: #000">
												${i.user.name} </a>
										</p>
										<span class="text-muted">${i.time}</span>
									</div>
								</div>

								<div class="d-flex justify-content-end">
									<c:if test="${i.user==userOwn}">
										<i class="fas fa-ellipsis-h text-blue pointer"
											id="post1CommentMenuButton" data-bs-toggle="dropdown"
											aria-expanded="false"></i>
										<ul class="dropdown-menu border-0 shadow"
											aria-labelledby="post1CommentMenuButton">
											<li class="d-flex align-items-center"><a
												class="dropdown-item d-flex justify-content-around align-items-center fs-7"
												href="/article/updateComment/${i.id}"
												style="font-size: 15px"> Edit Comment</a></li>
											<li class="d-flex align-items-center"><a
												class="dropdown-item d-flex justify-content-around align-items-center fs-7"
												href="#" onclick="deleteComment(${i.id})"
												style="font-size: 15px"> Delete Comment</a></li>
										</ul>
									</c:if>
								</div>

							</div>

							<div class="p-3 rounded comment__input w-100">

								<div>
									<p style="font-size: 15px">${i.content}</p>
									<c:if test="${i.image!=null}">
										<img
											src='https://firebasestorage.googleapis.com/v0/b/web-springboot-1a3ab.appspot.com/o/Web_project%2Fcomments%2F${i.image}?alt=media'
											alt="post image" class="img-fluid rounded">
									</c:if>
								</div>
								<hr>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
	<script
		src="https://netdna.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<script type="text/javascript"></script>
</body>