<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <style>
        .error{
            color: red;
        }
    </style>
</head>
<body>
<form:form method="POST"
           action = "/article/updateArticle/${article.getArticleID()}"
           modelAttribute="article"
           enctype="multipart/form-data">
    <label>Tieu de bai dang:</label>
    <form:input type = "text" path = "description" value = "${article.getDescription()}" placeholder = "Nhap tieu de"/><br>
    <label>Hinh anh: </label>
    <input type = "file" name = "images"/><br>
    <input type="submit" value="Change">
</form:form>
<form:form method="post"
           action="/article/deleteArticle/${article.getArticleID()}"
           onsubmit="return confirm('Sure?')? true:false">
    <input type="submit" value="Delete">
</form:form>
</body>
</html>