<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String username = Long.toString((Long) request.getSession().getAttribute("id")); %>
<% String username1 = (String)request.getSession().getAttribute("USERNAME"); %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">


    <title>messages like material design - Bootdey.com</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://netdna.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<div class="container bootstrap snippets bootdey" style="font-size: 17px">
    <div class="tile tile-alt" id="messages-main">
        <div class="ms-menu">
            <div class="ms-user clearfix">
                    <img src="https://firebasestorage.googleapis.com/v0/b/web-springboot-1a3ab.appspot.com/o/Web_project%2Fusers%2F${userOwn.image}?alt=media" alt class="img-avatar pull-left">

                ${userOwn.name}
            </div>
            <div class="list-group lg-alt" id="message-container1">
                <c:forEach var ="i" items = "${users}">
                <c:if test="${i != userOwn}">
                <a class="list-group-item media" href="/user/Inbox/${i.userID}">
                    <div class="pull-left">
                            <img src="https://firebasestorage.googleapis.com/v0/b/web-springboot-1a3ab.appspot.com/o/Web_project%2Fusers%2F${i.image}?alt=media" alt class="img-avatar">
                    </div>
                    <div class="media-body">
                        <small class="list-group-item-heading">${i.name}</small>
                    </div>
                </a>
                </c:if>
                </c:forEach>
            </div>
        </div>
        <div class="ms-body" id="message-container">
            <div class="action-header clearfix" id="header">
                <div class="visible-xs" id="ms-menu-trigger">
                    <i class="fa fa-bars"></i>
                </div>
                <div class="pull-left hidden-xs">

                        <img src="https://firebasestorage.googleapis.com/v0/b/web-springboot-1a3ab.appspot.com/o/Web_project%2Fusers%2F${user.image}?alt=media" alt class="img-avatar m-r-10">
                    <div class="lv-avatar pull-left">
                    </div>
                    <span>${user.name}</span>
                </div>
            </div>
            <c:forEach var ="i" items = "${messages}">
            <c:if test="${i.sender != user}">
            <div class="message-feed media">
                <div class="pull-left">
                        <img src="https://firebasestorage.googleapis.com/v0/b/web-springboot-1a3ab.appspot.com/o/Web_project%2Fusers%2F${userOwn.image}?alt=media" alt class="img-avatar">
                </div>
                <div class="media-body">
                    <div class="mf-content">
                        ${i.content}
                    </div>
                    <small class="mf-date"><i class="fa fa-clock-o"></i> ${i.time}</small>
                </div>
            </div>
            </c:if>
            <c:if test="${i.sender == user}">
            <div class="message-feed right">
                <div class="pull-right">
                    <c:if test="${i.sender.image == null}">
                        <img src="https://bootdey.com/img/Content/avatar/avatar1.png" alt class="img-avatar">
                    </c:if>
                    <c:if test="${i.sender.image != null}">
                    <img src="https://firebasestorage.googleapis.com/v0/b/web-springboot-1a3ab.appspot.com/o/Web_project%2Fusers%2F${i.sender.image}?alt=media" alt class="img-avatar">
                    </c:if>
                </div>
                <div class="media-body">
                    <div class="mf-content">
                            ${i.content}
                    </div>
                    <small class="mf-date"><i class="fa fa-clock-o"></i> ${i.time}</small>
                </div>
            </div>
            </c:if>
            </c:forEach>
            <div class="msb-reply" id="send-box">
                <form:form modelAttribute="message" action="/user/Inbox/${userID}" method="post">
                <form:textarea path="content" placeholder="What's on your mind..."/>
                <input type="submit"><i class="fa fa-paper-plane-o"></i>
                </form:form>
            </div>
        </div>
    </div>
</div>
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
</script>
</body>
</html>