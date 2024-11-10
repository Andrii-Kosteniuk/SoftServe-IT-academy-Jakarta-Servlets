package com.softserve.itacademy.controller;

import com.softserve.itacademy.model.Task;
import com.softserve.itacademy.repository.TaskRepository;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/read-task")
public class ReadTaskServlet extends HttpServlet {
    Task task;
    private String id;
    private TaskRepository taskRepository;

    @Override
    public void init() {
        taskRepository = TaskRepository.getTaskRepository();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        id = request.getParameter("id");
        int taskId;
        if (id != null) {
            taskId = Integer.parseInt(id);
            task = taskRepository.read(taskId);
        }
        request.setAttribute("id", id);
        request.setAttribute("task", task);

        if (task == null) {
            request.getRequestDispatcher("/WEB-INF/pages/error.jsp").forward(request, response);
        }

        request.getRequestDispatcher("/WEB-INF/pages/read-task.jsp").forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        // Optional: Logic for handling POST requests if needed
    }
}
