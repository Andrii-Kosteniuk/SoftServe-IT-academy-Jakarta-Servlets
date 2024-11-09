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
import java.io.PrintWriter;

@WebServlet("/edit-task")
public class UpdateTaskServlet extends HttpServlet {

    private TaskRepository taskRepository;
    private String id;
    Task task;

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
        request.getRequestDispatcher("/WEB-INF/pages/edit-task.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Task task = taskRepository.read(Integer.parseInt(id));
        String title = request.getParameter("title");
        String priority = request.getParameter("priority");


        request.setAttribute("task", task);

        task.setTitle(title);
        task.setPriority(Priority.valueOf(priority));

        boolean isUpdated = taskRepository.update(task);

        if (isUpdated) {
            request.getSession().setAttribute("successOnUpdated", "Task has been successfully updated");
            response.sendRedirect("/edit-task");
        }

    }
}
