<%--
В этом jsp мы используем JSTL для соединения между jsp и сервлетом.
Мы должны воздерживаться от использования scriplet внутри jsp,
потому что это затруднит поддержание jsp. Не говоря уже о том,
что jsp выглядит ужасно.
--%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
    <title>Show All Users</title>
</head>
<body>
<table border=1>
    <thead>
    <tr>
        <th>User Id</th>
        <th>First Name</th>
        <th>Last Name</th>
        <th>DOB</th>
        <th>Email</th>
        <th colspan=2>Action</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${users}" var="user">
        <tr>
            <td><c:out value="${user.getUserid()}" /></td>
            <td><c:out value="${user.getFirstName()}" /></td>
            <td><c:out value="${user.getLastName()}" /></td>
            <td><fmt:formatDate pattern="yyyy-MMM-dd" value="${user.getDob()}" /></td>
            <td><c:out value="${user.getEmail()}" /></td>
            <td><a href="UserController?action=edit&userId=<c:out value="${user.getUserid()}"/>">Update</a></td>
            <td><a href="UserController?action=delete&userId=<c:out value="${user.getUserid()}"/>">Delete</a></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<p><a href="UserController?action=insert">Add User</a></p>
</body>
</html>
