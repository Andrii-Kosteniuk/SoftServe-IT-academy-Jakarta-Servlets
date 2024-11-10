package com.softserve.itacademy.controller;

import com.softserve.itacademy.model.Priority;
import com.softserve.itacademy.model.Task;
import com.softserve.itacademy.repository.TaskRepository;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/create-task")
public class CreateTaskServlet extends HttpServlet {

    private TaskRepository taskRepository;

    @Override
    public void init() {
        taskRepository = TaskRepository.getTaskRepository();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.getRequestDispatcher("/WEB-INF/pages/create-task.jsp").forward(request, response);
        response.setStatus(HttpServletResponse.SC_OK);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");
        String title = request.getParameter("title");
        String priority = request.getParameter("priority");
        Task task = new Task(title, Priority.valueOf(priority.toUpperCase()));

        boolean taskExists = taskRepository.all().stream()
                .anyMatch(taskInRepo -> taskInRepo.getTitle().equalsIgnoreCase(task.getTitle()));

        if (taskExists) {
            request.getSession().setAttribute("errorMessage", "Task with a given name already exists!");
            response.sendRedirect("/create-task");
            return;
        }

        boolean isCreated = taskRepository.create(task);
        if (isCreated) {
            request.getSession().setAttribute("successOnCreated", "Task has been successfully created");
            response.sendRedirect("/create-task");
        }
    }
}
