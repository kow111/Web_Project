<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<% String username = Long.toString((Long) request.getSession().getAttribute("id")); %>
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
                            <li>
                                <a href="/user/Inbox/${user.userID}" class="btn btn-success text-center btn-block">Message</a>
                            </li>
                            <li><br></li>
                            <c:if test="${userOwn==user}">
                                <li>
                                    <div class="btn-group-vertical btn-block">
                                        <a href="/user/update" class="btn btn-default"><i class="fa fa-cog pull-right"></i>Edit Account</a>
                                        <a href="/logout" class="btn btn-default"><i class="fa fa-sign-out pull-right"></i>Logout</a>
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
                        <img src="https://www.bootdey.com/image/600x150/FF69B4/000000" class="img-responsive full-width" alt="cover">
                    </div>
                </div>
            </div>
            <div class="panel cover rounded shadow no-overflow">
                <div class="panel-body">
                    <div class="container">
                        <div class="col-md-7">
                            <div class="panel">
                                <div class="panel-body">
                                    <form:form method="POST"
                                               action = "/user/update/${user.userID}"
                                               modelAttribute="user"
                                               enctype="multipart/form-data">
                                        <label>Name: </label>
                                        <form:input type="text" path="name" class="form-control" placeholder="Name" value="${user.name}" style="font-size: 17px"/><br>
                                        <label>Phone Number: </label>
                                        <form:input value="${user.phoneNumber}" type="text" path="phoneNumber" class="form-control" placeholder="Phone Number" style="font-size: 17px"/><br>
                                        <label>Password: </label>
                                        <form:input value="${user.password}" type="password" path="password" class="form-control" placeholder="Password" style="font-size: 17px"/><br>
                                        <label>Image: </label>
                                        <div class="mar-top clearfix">
                                            <input name = "images" type="file"/>
                                            <button class="btn btn-sm btn-primary pull-right" type="submit" style="font-size: 17px"><i class="fa fa-pencil fa-fw"></i> Submit</button>
                                        </div>
                                        <p class="error">${error}</p>
                                    </form:form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
<script src="https://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
</body>
</html>