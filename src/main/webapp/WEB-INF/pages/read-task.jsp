<%@ page import="com.softserve.itacademy.model.Task" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
          crossorigin="anonymous">
    <title>Read existing Task</title>

</head>
<body>
    <%@include file="header.html" %>

    <div class="container d-flex justify-content-center" style="margin-top: 1rem">

            <% Task task = (Task) request.getAttribute("task"); %>

        <div class="card border-success mb-3 card w-50 shadow p-3 mb-5 bg-body-tertiary rounded">
            <div class="card-header bg-transparent border-success" style="color: brown; align-items: center;"><h2>Read existing task</h2></div>
            <div class="card-body text-success">
                <span><b>Id: </b> </span><span><%= task.getId() %></span><br>
                <span><b>Name:</b> </span><span><%= task.getTitle() %></span><br>
                <span><b>Priority: </b></span><span><%= task.getPriority() %></span><br>
            </div>
        </div>

</body>
</html>
