package org.example.servlets;

import org.example.models.Question;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/result")
public class ResultServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        // Check if userAnswers is null or not yet initialized
        List<Integer> userAnswers = (List<Integer>) session.getAttribute("userAnswers");
        if (userAnswers == null) {
            response.sendRedirect("quiz"); // Redirect to quiz if answers are not found
            return;
        }

        // Get questions from servlet context
        List<Question> questions = (List<Question>) getServletContext().getAttribute("questions");

        // If no questions are found, redirect to quiz as well
        if (questions == null || questions.isEmpty()) {
            response.sendRedirect("quiz");
            return;
        }

        int score = 0;
        for (int i = 0; i < questions.size(); i++) {
            if (userAnswers.get(i) == questions.get(i).getCorrectAnswerIndex()) {
                score++;
            }
        }

        // Set score and total questions to be forwarded to the result page
        request.setAttribute("score", score);
        request.setAttribute("totalQuestions", questions.size());
        request.getRequestDispatcher("result.jsp").forward(request, response);
    }
}
