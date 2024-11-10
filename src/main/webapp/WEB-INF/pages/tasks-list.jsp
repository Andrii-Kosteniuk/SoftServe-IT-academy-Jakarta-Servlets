<%@ page import="com.softserve.itacademy.model.Task" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
          crossorigin="anonymous">
    <title>List of Tasks</title>

</head>
<body>
<%@include file="header.html" %>

<%
    String successOnDelete = (String) session.getAttribute("successOnDelete");
    if (successOnDelete != null) {
%>
<div class="alert alert-warning d-flex align-items-center " style="justify-content: center"
     role="alert"><%= successOnDelete %>
</div>
<%
        session.removeAttribute("successOnDelete");
    }
%>
<div class="container d-flex justify-content-center">
    <table class="table table-striped w-75 p-3 shadow p-3 mb-5 bg-body-tertiary rounded">
        <thead>
        <tr class="table-primary">
            <th>No</th>
            <th>Name</th>
            <th>Priority</th>
            <th>Operation</th>
            <th></th>
            <th></th>
        </tr>
        </thead>
        <tbody>
            <% List<Task> tasks = (List<Task>) request.getAttribute("tasks"); %>
            <% for (Task task : tasks) { %>
        <tr>
            <td><%= task.getId() %>
            </td>
            <td><%= task.getTitle() %>
            </td>
            <td><%= task.getPriority() %>
            </td>
            <td>
                <a href="read-task?id=<%= task.getId() %>" class="btn btn-primary btn-sm">View</a>
            </td>
            <td>
                <a href="edit-task?id=<%= task.getId() %>" class="btn btn-warning btn-sm">Edit</a>
            </td>
            <td>
                <a href="delete-task?id=<%= task.getId() %>" class="btn btn-danger btn-sm">Delete</a>
            </td>
        </tr>
            <% } %>
    </table>
</div>
</body>
</html>
