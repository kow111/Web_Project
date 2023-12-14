<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>profile cards widget - Bootdey.com</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://netdna.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<div class="container" >
    <div class="row bootstrap snippets bootdeys">
        <c:forEach var ="i" items = "${users}">
        <div class="col-md-3">
            <div class="panel widget">
                <div class="widget-header bg-primary"></div>
                <div class="widget-body text-center">
                    <img alt="Profile Picture" class="widget-img img-circle img-border-light" src="https://firebasestorage.googleapis.com/v0/b/web-springboot-1a3ab.appspot.com/o/Web_project%2Fusers%2F${i.image}?alt=media">
                    <h4 class="mar-no" style="font-size: 20px">${i.name}</h4>
                    <div class="pad-ver">
                        <a href="/user/Inbox/${i.userID}" class="btn btn-primary" style="font-size: 15px">Message</a>
                        <a href="/article/user/${i.userID}" class="btn btn-success" style="font-size: 15px">Page</a>
                        <br>
<%--                        <c:forEach var ="j" items = "${friends}">--%>
<%--                        <c:if test="${j.sender == i or j.receiver== i}">--%>
<%--                            <p style="font-size: 15px">Friend!</p>--%>
<%--                        </c:if>--%>
<%--                        </c:forEach>--%>
                        <c:set var="isFriend" value="false" />

                        <c:forEach var="j" items="${friends}">
                            <c:if test="${(j.sender == i or j.receiver == i) and i != userOwn}">
                                <c:set var="isFriend" value="true" />
                            </c:if>
                        </c:forEach>

                        <c:if test="${isFriend}">
                            <p style="font-size: 15px">Friend!</p>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
        </c:forEach>
    </div>
</div>
<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
<script src="https://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<script type="text/javascript">

</script>
</body>
</html>