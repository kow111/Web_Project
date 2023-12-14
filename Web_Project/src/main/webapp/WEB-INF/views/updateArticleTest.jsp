<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String username = Long.toString((Long) request.getSession().getAttribute("id")); %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<body>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<div class="container" >
    <%--    <div class="col-md-7">--%>
    <div class="bg-white p-3 mt-3 rounded border shadow">
        <div class="social-avatar">
            <a href class="pull-left">
                <img class="rounded-circle" alt="image" src="https://firebasestorage.googleapis.com/v0/b/web-springboot-1a3ab.appspot.com/o/Web_project%2Fusers%2F${article.user.image}?alt=media">
            </a>
            <div class="media-body">
                <a class="m-0" href="#" style="font-size: 17px; text-decoration: none; color: #000;">${article.user.name}</a>
                <p class="text-muted" style="font-size: 12px">${article.time}</p>
            </div>
        </div>
        <form:form method="POST"
                   action = "/article/updateArticle/${article.articleID}"
                   modelAttribute="article"
                   enctype="multipart/form-data">
        <div class="social-body">
            <form:textarea path="description" class="form-control" rows="5" style="font-size: 15px" value="${article.description}"/>
            <input type = "file" name = "images" style="font-size: 15px; margin-top:15px"/><br>
            <c:if test="${article.image!=null}">
                <img src = 'https://firebasestorage.googleapis.com/v0/b/web-springboot-1a3ab.appspot.com/o/Web_project%2Farticles%2F${article.image}?alt=media' class="img-responsive" alt="image1">
            </c:if>
            <input type="submit" class="btn btn-primary w-100" style="font-size: 15px" value="Update">
        </div>
        </form:form>
    </div>
</div>
<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
<script src="https://netdna.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script type="text/javascript"></script>
</body>