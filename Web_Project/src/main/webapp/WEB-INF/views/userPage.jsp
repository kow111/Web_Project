<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>profile with left cover - Bootdey.com</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://netdna.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://netdna.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
  <link href='<c:url value="/templates/user/css/style.css"/>'rel="stylesheet" type="text/css">
  <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
  <script>
    function likePost(postId) {
      $.ajax({
        type: "POST",
        url: "/article/LikeArticle/" + postId,
        success: function(newLikeCount) {
          // Cập nhật số lượt thích trên UI
          $(".likeCount[data-post-id='" + postId + "']").text(newLikeCount);
        }
      });
    }
  </script>
  <style type="text/css">
    body{
      background:#eee;
      margin-top:20px;
    }

    .shadow {
      -webkit-box-shadow: 0px 1px 1px rgba(0, 0, 0, 0.05) !important;
      -moz-box-shadow: 0px 1px 1px rgba(0, 0, 0, 0.05) !important;
      box-shadow: 0px 1px 1px rgba(0, 0, 0, 0.05) !important;
    }

    .rounded {
      -webkit-border-radius: 3px !important;
      -moz-border-radius: 3px !important;
      border-radius: 3px !important;
    }

    .panel {
      border: none;
      position: relative;
      -webkit-border-radius: 0px;
      -moz-border-radius: 0px;
      border-radius: 0px;
      -webkit-box-shadow: none;
      -moz-box-shadow: none;
      box-shadow: none;
    }

    .btn{
      border-radius:0px;
    }

    .profile-cover {
      width: 100%;

    }

    .profile-cover .cover {
      position: relative;
      border: 10px solid #FFF;
      background:#fff;
    }

    .profile-cover .cover .inner-cover {
      overflow: hidden;
      height: auto;
    }

    .profile-cover .cover .inner-cover .cover-menu-mobile {
      position: absolute;
      top: 10px;
      right: 10px;
    }

    .full-width {
      top: 0;
      left: 0;

      /* Preserve aspet ratio */
      min-width: 100%;
      min-height: 100%;
    }

  </style>
</head>
<body>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<div class="container bootstrap snippets bootdey" style="font-size: 17px">
  <div class="row">
    <div class="col-md-3">
      <div class="panel rounded shadow">
        <div class="panel-body">
          <div class="inner-all">
            <ul class="list-unstyled">
              <li class="text-center">
                <img class="img-circle img-responsive img-bordered-primary" src="https://firebasestorage.googleapis.com/v0/b/web-springboot-1a3ab.appspot.com/o/Web_project%2Fusers%2F${user.image}?alt=media" alt="Marint month">
              </li>
              <li class="text-center">
                <h4 class="text-capitalize" style="font-size: 17px; margin-top: 12px">${user.name}</h4>
                <p class="text-muted text-capitalize">${user.phoneNumber}</p>
                <p class="text-muted text-capitalize">Number of post: ${countPost}</p>
                <p class="text-muted text-capitalize">Number of friend: ${countFriend}</p>
              </li>
              <c:if test="${userOwn!=user}">
              <li>
                <a href="/user/Inbox/${user.userID}" class="btn btn-success text-center btn-block" style="font-size: 17px">Message</a>
              </li>
              </c:if>
              <c:if test="${userOwn!=user}">
                <br>
                <c:if test="${friend.status==false and friend.receiver== userOwn}">
                    <li>
                      <a href="#" class="btn btn-success text-center btn-block" onclick="acceptFriend(${user.userID})" style="font-size: 17px">Accept</a>
                    </li>
                    <br>
                    <li>
                      <a href="#" class="btn btn-success text-center btn-block" onclick="deleteFriend(${user.userID})" style="font-size: 17px">Ignore</a>
                    </li>
                </c:if>
                <c:if test="${friend == null}">
                  <li>
                    <a href="#" class="btn btn-success text-center btn-block" onclick="addFriend(${user.userID})" style="font-size: 17px">Add Friend</a>
                  </li>
                </c:if>
                <c:if test="${friend != null and friend.sender == userOwn and friend.status==false}">
                  <li>
                    <a href="#" class="btn btn-success text-center btn-block" onclick="deleteFriend(${user.userID})" style="font-size: 17px">Cancel Request</a>
                  </li>
                </c:if>
                <c:if test="${friend.status == true}">
                  <li>
                    <a href="#" class="btn btn-success text-center btn-block" onclick="deleteFriend(${user.userID})" style="font-size: 17px"v>Cancel Friend</a>
                  </li>
                </c:if>
              </c:if>
              <li><br></li>
              <c:if test="${userOwn==user}">
              <li>
                <div class="btn-group-vertical btn-block">
                  <a href="/user/update" class="btn btn-default" style="font-size: 14px"><i class="fa fa-cog pull-right"></i>Edit Account</a>
                  <a href="/logout" class="btn btn-default" style="font-size: 14px"><i class="fa fa-sign-out pull-right"></i>Logout</a>
                </div>
              </li>
              </c:if>
            </ul>
          </div>
        </div>
      </div>
    </div>
    <div class="col-md-9">
      <div class="panel cover rounded shadow no-overflow">
        <div class="panel-body">
          <div class="inner-cover">
            <img src="https://beginnersbug.com/wp-content/uploads/2020/04/spring-boot-1.jpg" class="img-responsive full-width" alt="cover">
          </div>
        </div>
      </div>
      
      <div class="d-flex flex-column justify-content-center w-100 mx-auto">
            <div style="width: 977px">
              <c:if test="${userOwn ==user}">
              <div class="panel">
              <div class="bg-white p-3 mt-3 rounded border shadow">
				<!-- avatar -->
				<div class="d-flex" type="button">
					<div class="p-1">
						<img
							src="https://firebasestorage.googleapis.com/v0/b/web-springboot-1a3ab.appspot.com/o/Web_project%2Fusers%2F${userOwn.image}?alt=media"
							alt="avatar" class="rounded-circle me-2"
							style="width: 38px; height: 38px; object-fit: cover" />
					</div>
					<input type="text" style="font-size: 17px"
						class="form-control rounded-pill border-0 bg-gray pointer"
						placeholder="What are you thinking, ${userOwn.name} ?"
						data-bs-toggle="modal" data-bs-target="#createModal" />
				</div>
				<!-- create modal -->
				<div class="modal" id="createModal" tabindex="-1"
					aria-labelledby="createModalLabel" aria-hidden="true"
					data-bs-backdrop="false">
					<form:form method="POST" action="/article/insertArticle"
						modelAttribute="article" enctype="multipart/form-data">
						<div class="modal-dialog modal-dialog-centered">
							<div class="modal-content">
								<!-- head -->
								<div class="modal-header align-items-center">
									<h5 class="text-dark text-center w-100 m-0"
										id="exampleModalLabel">Create Post</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<!-- body -->
								<div class="modal-body">
									<div class="my-1 p-1">
										<div class="d-flex flex-column">
											<!-- name -->
											<div class="d-flex align-items-center">
												<div class="p-2">
													<img
														src="https://firebasestorage.googleapis.com/v0/b/web-springboot-1a3ab.appspot.com/o/Web_project%2Fusers%2F${userOwn.image}?alt=media"
														alt="from fb" class="rounded-circle"
														style="width: 38px; height: 38px; object-fit: cover;" />
												</div>
												<div>
													<p class="m-0 fw-bold" style="text-decoration: none; color: #000;">${userOwn.name}</p>
												</div>
											</div>
											<!-- text -->
											<div>
												<form:textarea path="description" cols="30" rows="5"
													class="form-control" />
											</div>
											<!-- options -->
											<div
												class=" d-flex justify-content-between border border-1 border-light rounded p-3 mt-3">
												<input name="images" type="file" />
											</div>
										</div>
									</div>
									<!-- end -->
								</div>
								<!-- footer -->
								<div class="modal-footer">
									<button type="submit" class="btn btn-primary w-100">
										Post</button>
								</div>
							</div>
						</div>
					</form:form>
				</div>
			</div>
 
                <%-- <div class="panel-body">
                  <form:form method="POST"
                             action = "/article/insertArticle"
                             modelAttribute="article"
                             enctype="multipart/form-data">
                    <form:textarea path="description" class="form-control" rows="2" placeholder="What are you thinking?"/>
                    <div class="mar-top clearfix">
                      <input name = "images" type="file"/>
                      <button class="btn btn-sm btn-primary pull-right" type="submit"><i class="fa fa-pencil fa-fw"></i> Share</button>
                    </div>
                  </form:form>
                </div> --%>
              </div>
              </c:if>
              
              <c:forEach var="i" items="${articles}">
			<div class="bg-white p-3 mt-3 rounded border shadow">
				<div class="d-flex justify-content-between">
				<div class="d-flex">
					<a href="/article/user/${i.user.userID}" class="pull-left"> <img
						alt="avatar" class="rounded-circle me-2" style="width: 38px; height: 38px; object-fit: cover"
						src="https://firebasestorage.googleapis.com/v0/b/web-springboot-1a3ab.appspot.com/o/Web_project%2Fusers%2F${i.user.image}?alt=media">
					</a>
					<div>
						<p class="m-0 fw-bold " ><a href="/article/user/${i.user.userID}" style="text-decoration: none; color: #000">${i.user.name}</a></p>
						<span class="text-muted fs-7" style="font-size: 12px">${i.time}</span>
					</div>
				</div>
				
				<c:if test="${i.user == userOwn}">
					<i class="fas fa-ellipsis-h" type="button" id="post1Menu" data-bs-toggle="dropdown" aria-expanded="false"></i>
					<ul class="dropdown-menu border-0 shadow" aria-labelledby="post1Menu">
	                  <li class="d-flex align-items-center">
	                    <a class="dropdown-item d-flex justify-content-around align-items-center fs-7" href="/article/updateArticle/${i.articleID}" style="font-size: 15px">
	                      Edit Post</a>
	                  </li>
	                  <li class="d-flex align-items-center">
	                    <a
	                      class="dropdown-item d-flex justify-content-around align-items-center fs-7" href="#" onclick="submitForm(${i.articleID})" style="font-size: 15px">
	                      Delete Post</a>
	                  </li>
	                </ul>
	                
<%-- 					<div class="pull-right social-action dropdown">
						<button data-toggle="dropdown" class="dropdown-toggle btn-white">
							<i class="fa fa-angle-down"></i>
						</button>

						<ul class="dropdown-menu m-t-xs">
							<li><a href="/article/updateArticle/${i.articleID}">Config</a></li>
							<li><a href="#" onclick="submitForm(${i.articleID})">Delete</a></li>
						</ul>
					</div> --%>
				</c:if>
				</div>
				<div class="mt-3">
					<div>
						<p>${i.description}</p>
						<c:if test="${i.image!=null}">
							<img						
								src='https://firebasestorage.googleapis.com/v0/b/web-springboot-1a3ab.appspot.com/o/Web_project%2Farticles%2F${i.image}?alt=media'
								alt="post image" class="img-fluid rounded">
						</c:if>
					</div>		
					<!-- likes & comments -->
                <div class="post__comment mt-3 position-relative">
                  <!-- likes -->
                  <div
                    class="d-flex align-items-center top-0 start-0 position-absolute post-container" style="height: 50px; z-index: 5">
                    <div class="me-2">
                      <i class="text-primary fas fa-thumbs-up"></i>
                    </div>
				  	<div class="post-container" data-post-id="${i.articleID}">
						<p class="m-0 text-muted fs-7 likeCount" data-post-id="${i.articleID}" style="font-size: 15px">${i.likes}</p>
					</div>
                  </div>
                  <!-- comments start-->
                  <div class="accordion" id="accordionExample">
                    <div class="accordion-item border-0">
                      <!-- comment collapse -->
                      <h2 class="accordion-header" id="headingTwo">
							<div
                          class="
                            accordion-button
                            collapsed
                            pointer
                            d-flex
                            justify-content-end
                          ">
                          <p class="m-0" style="color: white;">.</p>
                       </div>
                      </h2>
                      <hr />
                      <!-- comment & like bar -->
                      <div class="d-flex justify-content-around">
                        <div class="dropdown-item rounded d-flex justify-content-center align-items-center pointer text-muted p-1 post-container1"
                        data-post-id="${i.articleID}">
   	                    	<c:if test="${i.usersWhoLiked.contains(userOwn)}">
								<p onclick="likePost(${i.articleID}, true)"
									data-post-id="${i.articleID}" class="m-0 btn123">
									<i class="fas fa-thumbs-up me-3"></i> Unlike
								</p>
							</c:if>
							<c:if test="${!i.usersWhoLiked.contains(userOwn)}">
								<p onclick="likePost(${i.articleID}, false)"
									data-post-id="${i.articleID}" class="m-0 btn123">
									<i class="fas fa-thumbs-up me-3"></i> Like
								</p>
							</c:if>  
                        </div>
                        <a
                          class="dropdown-item rounded d-flex justify-content-center align-items-center pointer text-muted p-1"
                          href="/article/Comment/${i.articleID}">
                          <i class="fas fa-comment-alt me-3"></i>
                          Comment
                        </a>
                      </div>
                    </div>
                  </div>
                </div>
						
<%-- 					<div class="btn-group">
						<div class="post-container" data-post-id="${i.articleID}">
							<div class="likeCount" data-post-id="${i.articleID}">${i.likes}</div>
							<c:if test="${i.usersWhoLiked.contains(userOwn)}">
								<button onclick="likePost(${i.articleID}, true)"
									data-post-id="${i.articleID}" class="btn btn-white btn-xs">
									<i class="fa fa-thumbs-up like-icon"></i> Unlike this!
								</button>
							</c:if>
							<c:if test="${!i.usersWhoLiked.contains(userOwn)}">
								<button onclick="likePost(${i.articleID}, false)"
									data-post-id="${i.articleID}" class="btn btn-white btn-xs">
									<i class="fa fa-thumbs-up like-icon"></i> Like this!
								</button>
							</c:if>
						</div>
						<a href="/article/Comment/${i.articleID}"><button
								class="btn btn-white btn-xs">
								<i class="fa fa-comments "></i> Comment
							</button></a>
					</div>  --%>
				</div>
			</div>
		</c:forEach>
              
            </div>
          </div>
        </div>
      </div>
    </div>
</body>
</html>