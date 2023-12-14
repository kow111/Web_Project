<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<%--<% String username = Long.toString((Long) request.getSession().getAttribute("id")); %>--%>
<%--<%@taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator"%>--%>
<head>
    <meta charset="UTF-8">
    <title>ALOHCMUTE</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link href='<c:url value="/templates/user/css/inbox.css"/>' rel="stylesheet" type="text/css">
    <link href='<c:url value="/templates/user/css/userpage.css"/>' rel="stylesheet" type="text/css">
    <link href='<c:url value="/templates/user/css/post.css"/>' rel="stylesheet" type="text/css">
    <link href='<c:url value="/templates/user/css/header.css"/>' rel="stylesheet" type="text/css">
<%--    <link href='<c:url value="/templates/user/css/notif.css"/>'rel="stylesheet" type="text/css">--%>
    <link rel="stylesheet" href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<%--    <link href="https://netdna.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" rel="stylesheet">--%>
    <link href="https://netdna.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
    <link href='<c:url value="/templates/user/css/style.css"/>' rel="stylesheet" type="text/css">
   
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
<link rel="stylesheet" href="/templates/user/css/main.css" />

	<script
		src="https://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
	<script type="text/javascript"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
		crossorigin="anonymous"></script>
	<script src="/templates/user/js/main.js"></script>
	
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script>
        function likePost(postId, isLiked) {
            $.ajax({
                type: "POST",
                url: "/article/LikeArticle/" + postId,
                success: function(newLikeCount) {
                    // Cập nhật số lượt thích trên UI
                    $(".post-container[data-post-id='" + postId + "'] .likeCount").text(newLikeCount);

                    var likeButton = $(".post-container1[data-post-id='" + postId + "']");

                    // Xóa nút cũ nếu tồn tại
                    likeButton.empty();

                    // Tạo và thêm nút mới
                    var buttonText = isLiked ? "Like":"Unlike";
                    var newButton = '<p onclick="likePost(' + postId + ', ' + !isLiked + ')" data-post-id="' + postId + '" class="m-0"><i class="fas fa-thumbs-up me-3"></i> ' + buttonText + ' </p>';
                    likeButton.append(newButton);
                }
            });
        }
    </script>
    <style>
        .error{
            color: red;
        }
    </style>
</head>
<body>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<%@include file="/common/user/header.jsp"%>
<sitemesh:write property='body'></sitemesh:write>
<script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
<script src="https://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<script type="text/javascript">
    $(function () {
        if ($('#ms-menu-trigger')[0]) {
            $('body').on('click', '#ms-menu-trigger', function () {
                $('.ms-menu').toggleClass('toggled');
            });
        }
    });
    // Gọi hàm scrollToBottom sau khi thêm tin nhắn mới
    function scrollToBottom() {
        var container = $("#message-container");
        container.scrollTop(container.prop("scrollHeight"));
    }

    // Gọi hàm scrollToBottom khi trang được tải
    $(document).ready(function() {
        scrollToBottom();
    });
    function toggleNotifications() {
        var notificationPopup = document.getElementById('notificationPopup');
        notificationPopup.style.display = (notificationPopup.style.display === 'block') ? 'none' : 'block';
    }
    function submitForm(postId) {
        var form = document.createElement('form');
        form.method = 'POST';
        form.action = '/article/deleteArticle/'+postId;  // Thay đổi thành địa chỉ endpoint của bạn
        document.body.appendChild(form);
        form.submit();
    }
    function addFriend(userId) {
        var form = document.createElement('form');
        form.method = 'POST';
        form.action = '/user/addFriend/'+userId;  // Thay đổi thành địa chỉ endpoint của bạn
        document.body.appendChild(form);
        form.submit();
    }
    function acceptFriend(userId) {
        var form = document.createElement('form');
        form.method = 'POST';
        form.action = '/user/accept/'+userId;  // Thay đổi thành địa chỉ endpoint của bạn
        document.body.appendChild(form);
        form.submit();
    }
    function deleteFriend(userId) {
        var form = document.createElement('form');
        form.method = 'POST';
        form.action = '/user/delete/'+userId;  // Thay đổi thành địa chỉ endpoint của bạn
        document.body.appendChild(form);
        form.submit();
    }
    function deleteComment(CommentId) {
        var form = document.createElement('form');
        form.method = 'POST';
        form.action = '/article/deleteComment/'+CommentId;  // Thay đổi thành địa chỉ endpoint của bạn
        document.body.appendChild(form);
        form.submit();
    }
</script>
</body>
</html>