<%@ page import="com.softserve.itacademy.model.Task" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
          crossorigin="anonymous">
    <title>Create Task</title>

</head>
<style>

</style>
<body>
<div class="navbar navbar-expand-lg bg-body-tertiary">
    <%@include file="header.html" %>
</div>

<div class="container d-flex justify-content-center" style="margin-top: 3rem;">
    <div class="col-6">
        <div class="card border-success mb-3">
            <div class="card-header text-center">
                <h3>Edit existing task</h3>
            </div>
            <div class="card-body">
                <%
                    String success = (String) session.getAttribute("successOnUpdated");
                    if (success != null) {
                %>
                <div class="alert alert-success d-flex align-items-center " style="justify-content: center"role="alert"><%= success %>
                </div>
                <%
                        session.removeAttribute("successOnUpdated");
                    }
                %>

                <% Task task = (Task) request.getAttribute("task"); %>

                <form action="edit-task" method="post">
                    <div class="mb-2 row">
                        <label class="col-sm-3 col-form-label">Id:</label>
                        <div class="col-sm-3">
                            <input class="form-control" id="id" name="id" type="text" value="<%= task.getId() %>"
                                   disabled>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="title" class="col-sm-3 col-form-label">Name:</label>
                        <div class="col-sm-9">
                            <input type="text" id="title" name="title"
                                   class="form-control"
                                   value="<%= task.getTitle() %>"
                                   required aria-label="title">
                        </div>
                    </div>

                    <div class="mb-3 row">
                        <label for="priority" class="col-sm-3 col-form-label">Priority:</label>
                        <div class="col-sm-6">
                            <select class="form-select" id="priority" name="priority" aria-label="selectPriority">
                                <option value="LOW" <%= "LOW".equals(task.getPriority().toString()) ? "selected" : "" %>>LOW</option>
                                <option value="MEDIUM" <%= "MEDIUM".equals(task.getPriority().toString()) ? "selected" : "" %>>MEDIUM</option>
                                <option value="HIGH" <%= "HIGH".equals(task.getPriority().toString()) ? "selected" : "" %>>HIGH</option>
                            </select>
                        </div>
                    </div>

                    <div class="text-center">
                        <button type="submit" class="btn btn-success">Update task</button>
                        <a href="/clear-content" class="btn btn-outline-danger">Clear</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

</body>
</html>