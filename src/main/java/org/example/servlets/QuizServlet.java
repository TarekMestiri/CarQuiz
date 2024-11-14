package org.example.servlets;

import org.example.models.Question;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@WebServlet(name = "QuizServlet", value = "/quiz")
public class QuizServlet extends HttpServlet {

    private List<Question> questions;

    @Override
    public void init() throws ServletException {
        questions = new ArrayList<>();

        List<String> options1 = Arrays.asList("Ferrari", "Honda", "BMW", "Toyota");
        questions.add(new Question("Which brand is known for making the 'Civic' model?", options1, 1)); // Correct answer: Honda

        List<String> options2 = Arrays.asList("Indy 500", "Le Mans", "Monaco GP", "Nürburgring");
        questions.add(new Question("Which race is held at the Monte Carlo circuit?", options2, 2)); // Correct answer: Monaco GP

        List<String> options3 = Arrays.asList("V8", "V12", "Inline-4", "Electric");
        questions.add(new Question("Which engine type is commonly used in the Tesla Model S?", options3, 3)); // Correct answer: Electric

        List<String> options4 = Arrays.asList("Honda", "Chevrolet", "Ford", "Nissan");
        questions.add(new Question("Which company makes the Mustang?", options4, 2)); // Correct answer: Ford

        List<String> options5 = Arrays.asList("Ferrari", "Maserati", "Lamborghini", "Porsche");
        questions.add(new Question("Which brand produces the 'Aventador'?", options5, 2)); // Correct answer: Lamborghini

        List<String> options6 = Arrays.asList("Chevrolet", "Ford", "Dodge", "Chrysler");
        questions.add(new Question("Which company produces the 'Corvette'?", options6, 0)); // Correct answer: Chevrolet

        List<String> options7 = Arrays.asList("BMW", "Audi", "Mercedes-Benz", "Porsche");
        questions.add(new Question("Which brand's logo has a four-ring design?", options7, 1)); // Correct answer: Audi

        List<String> options8 = Arrays.asList("V8", "V10", "V12", "Electric");
        questions.add(new Question("Which engine type is commonly used in a Lamborghini Huracán?", options8, 0)); // Correct answer: V10

        List<String> options9 = Arrays.asList("BMW", "Porsche", "Audi", "Mercedes-Benz");
        questions.add(new Question("Which car brand produces the '911'?", options9, 1)); // Correct answer: Porsche

        List<String> options10 = Arrays.asList("Tesla", "BMW", "Audi", "Ford");
        questions.add(new Question("Which car company is known for the Model S?", options10, 0)); // Correct answer: Tesla

        List<String> options11 = Arrays.asList("Ford", "Chevrolet", "Dodge", "Toyota");
        questions.add(new Question("Which brand produces the 'Ram 1500'?", options11, 2)); // Correct answer: Dodge

        List<String> options12 = Arrays.asList("Ferrari", "Porsche", "Bugatti", "Koenigsegg");
        questions.add(new Question("Which brand produces the 'Chiron'?", options12, 2)); // Correct answer: Bugatti

        List<String> options13 = Arrays.asList("Toyota", "Honda", "Mazda", "Subaru");
        questions.add(new Question("Which car company produces the 'Impreza'?", options13, 3)); // Correct answer: Subaru

        List<String> options14 = Arrays.asList("Chevrolet", "Ford", "Chrysler", "Toyota");
        questions.add(new Question("Which company makes the 'Camaro'?", options14, 0)); // Correct answer: Chevrolet

        List<String> options15 = Arrays.asList("Audi", "BMW", "Lexus", "Mercedes-Benz");
        questions.add(new Question("Which brand produces the 'A7'?", options15, 0)); // Correct answer: Audi

        List<String> options16 = Arrays.asList("Lamborghini", "Ferrari", "McLaren", "Aston Martin");
        questions.add(new Question("Which brand produces the 'P1' supercar?", options16, 2)); // Correct answer: McLaren

        List<String> options17 = Arrays.asList("Ferrari", "Mercedes-Benz", "Porsche", "Aston Martin");
        questions.add(new Question("Which brand's logo features a prancing horse?", options17, 0)); // Correct answer: Ferrari

        List<String> options18 = Arrays.asList("Cadillac", "Lincoln", "Chevrolet", "Ford");
        questions.add(new Question("Which company makes the 'Escalade'?", options18, 0)); // Correct answer: Cadillac

        List<String> options19 = Arrays.asList("Porsche", "Audi", "Volkswagen", "BMW");
        questions.add(new Question("Which brand produces the 'Macan' SUV?", options19, 0)); // Correct answer: Porsche

        List<String> options20 = Arrays.asList("Honda", "Toyota", "Nissan", "Mazda");
        questions.add(new Question("Which car company produces the 'Civic Type R'?", options20, 0)); // Correct answer: Honda

        getServletContext().setAttribute("questions", questions);
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        Integer currentQuestionIndex = (Integer) session.getAttribute("currentQuestionIndex");
        if (currentQuestionIndex == null) {
            currentQuestionIndex = 0;
            session.setAttribute("currentQuestionIndex", currentQuestionIndex);
        }

        if (currentQuestionIndex < questions.size()) {
            Question question = questions.get(currentQuestionIndex);
            request.setAttribute("question", question);
            request.setAttribute("questionNumber", currentQuestionIndex + 1); // Add question number to request
            request.getRequestDispatcher("question.jsp").forward(request, response);
        } else {
            response.sendRedirect("result");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer currentQuestionIndex = (Integer) session.getAttribute("currentQuestionIndex");

        String answer = request.getParameter("answer");

        if (answer == null || answer.isEmpty()) {
            response.sendRedirect("quiz"); // Redirect if no option is selected
            return;
        }

        System.out.println("Answer parameter: " + answer); // For debugging

        @SuppressWarnings("unchecked")
        List<Integer> userAnswers = (List<Integer>) session.getAttribute("userAnswers");
        if (userAnswers == null) {
            userAnswers = new ArrayList<>();
            session.setAttribute("userAnswers", userAnswers);
        }

        userAnswers.add(Integer.parseInt(answer));

        currentQuestionIndex++;
        session.setAttribute("currentQuestionIndex", currentQuestionIndex);

        if (currentQuestionIndex < questions.size()) {
            response.sendRedirect("quiz");
        } else {
            response.sendRedirect("result");
        }
    }
}
