package com.softserve.itacademy.controller;

import com.softserve.itacademy.model.Task;
import com.softserve.itacademy.repository.TaskRepository;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;


@WebServlet("/delete-task")
public class DeleteTaskServlet extends HttpServlet {

    Task task;
    private TaskRepository taskRepository;

    @Override
    public void init() {
        taskRepository = TaskRepository.getTaskRepository();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String taskId = request.getParameter("id");
        int id = Integer.parseInt(taskId);

        boolean isDeleted = taskRepository.delete(id);

        task = taskRepository.read(id);

        if (isDeleted) {
            request.getSession().setAttribute("successOnDelete", "Task with id " + id + " was deleted");
            response.sendRedirect("/tasks-list");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)  {
    }
}
