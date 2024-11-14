package org.example.models;

import java.util.List;

public class Question {
    private final String questionText;
    private final List<String> options;
    private final int correctAnswerIndex; // index of the correct option in options list

    public Question(String questionText, List<String> options, int correctAnswerIndex) {
        this.questionText = questionText;
        this.options = options;

        // Validate the correctAnswerIndex
        if (correctAnswerIndex < 0 || correctAnswerIndex >= options.size()) {
            throw new IllegalArgumentException("Invalid correctAnswerIndex");
        }

        this.correctAnswerIndex = correctAnswerIndex;
    }

    public String getQuestionText() {
        return questionText;
    }

    public List<String> getOptions() {
        return options;
    }

    public int getCorrectAnswerIndex() {
        return correctAnswerIndex;
    }
}