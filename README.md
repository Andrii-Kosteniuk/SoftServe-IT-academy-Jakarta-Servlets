# To-Do List Web Application

## Introduction
This project is a simple Web Application built using Servlet API, JSP, HTML, and CSS for managing a To-Do List. The application allows users to create, view, edit, delete, and list tasks with associated priorities. All operations are performed via a user-friendly web interface without the use of JavaScript or JavaScript libraries.

## Table of Contents
- [Features](#features)
- [Technologies Used](#technologies-used)
- [Screenshots](#screenshots)

---

## Features
- **Create Task**: Add tasks with a name and priority (Low, Medium, High).
- **List Tasks**: View all tasks in a tabular format with links for task-specific operations.
- **View Task**: Display details of a specific task.
- **Error Handling**: Handles invalid operations with proper error pages and status codes.
- **Edit Task**: Update details of an existing task.
- **Delete Task**: Remove tasks from the To-Do List.

---

## Technologies Used
- **Backend**: Java Servlet API
- **Frontend**: JSP, H

## Screenshots

1.The page for creating a new task and saving its in the To-Do List
>Route http://<host-name:port>/create-task
 
![Form for creating a new task](/resources/images/Form-Create-New-Task.jpg?raw=true)

The Priority is an enum with values **'Low'**, **'Medium'**, **'High'**.

2.If a task with a given name already exists in the To-Do List, then make redirect to the same page and display info about error.

![Info about error](/resources/images/Task-Already-Exists.jpg?raw=true)


3.Page with all tasks from To-Do List organized in a table and hyperlinks buttons for reading, editing and deleting tasks.
> Route http://<host-name:port>/tasks-list

![Tasks list](/resources/images/All-Tasks.jpg?raw=true)

4.The page for viewing info about task that correspond to ID specified through the request parameters.
>Route http://<host-name:port>/read-task?id=<_task ID_>

![Info about task](/resources/images/View-Task-Info.jpg?raw=true)

5.If the task with the given ID is not found in the To-Do List, then make redirect to the error page and return the status code 404.
![Error 404](/resources/images/404.jpg?raw=true)

6.The page for edit an existing task that correspond to ID specified through the request parameters.
>Route http://<host-name:port>/edit-task?id=<_task ID_>

![Edit task](/resources/images/Edit-Task.jpg?raw=true)

7.The 'Delete' button deletes the task that correspond to ID specified through the request parameters from To-Do List and the table.
>Route http://<host-name:port>/delete-task?id=<_task ID_>

![Delete task](/resources/images/Delete-Task.jpg?raw=true)
