<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
          crossorigin="anonymous">
    <title>Create Task</title>
</head>

<body>
<%@include file="header.html" %>

<div class="container d-flex justify-content-center" style="margin-top: 2rem;">
    <div class="col-6">

        <div class="card border-success mb-6 shadow p-3 mb-5 bg-body-tertiary rounded">
            <div class="card-header text-center">
                <h2>Create New Task</h2>
            </div>
            <div class="card-body">
                <%
                    String error = (String) session.getAttribute("errorMessage");
                    if (error != null) {
                %>
                <div class="alert alert-danger d-flex align-items-center " style="justify-content: center"
                     role="alert"><%= error %>
                </div>
                <%session.removeAttribute("errorMessage");}%>
                <%
                    String success = (String) session.getAttribute("successOnCreated");
                    if (success != null) {
                %>
                <div class="alert alert-success d-flex align-items-center " style="justify-content: center"
                     role="alert"><%= success %>
                </div>
                <%
                        session.removeAttribute("successOnCreated");
                    }
                %>
                <form action="create-task" method="post">
                    <div class="mb-3 row">
                        <label for="title" class="col-sm-3 col-form-label">Name:</label>
                        <div class="col-sm-9">
                            <input type="text" id="title" name="title"
                                   class="form-control"
                                   placeholder="Please provide name for a new task"
                                   required aria-label="title">
                        </div>
                    </div>

                    <div class="mb-3 row">
                        <label for="priority" class="col-sm-3 col-form-label">Priority:</label>
                        <div class="col-sm-9">
                            <select class="form-select" id="priority" name="priority" aria-label="selectPriority">
                                <option value="LOW">LOW</option>
                                <option value="MEDIUM">MEDIUM</option>
                                <option value="HIGH">HIGH</option>
                            </select>
                        </div>
                    </div>

                    <div class="text-center">
                        <button type="submit" class="btn btn-success">Create</button>
                        <a href="/delete-task" class="btn btn-outline-danger">Clear</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

</body>
</html>