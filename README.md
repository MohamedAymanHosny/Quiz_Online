<h1 align="center">Combined Quiz in Prolog</h1>

This Prolog program implements a **Combined Quiz System** that includes two types of quizzes:
1. **Multiple-Choice Questions (MCQs)**
2. **True/False Questions**

The program collects the user's name and student code, then evaluates their answers for each quiz type, displaying scores for each section and a final thank-you message. Below is a summary of its features:

---

## Features

1. **User Details Collection**
   - Prompts the user to input their name and student code.  

2. **MCQ Quiz**
   - Presents a series of questions with four options (A, B, C, D).  
   - Validates the user's answers and keeps track of the score.  
   - Displays the total score after completing all MCQs.  

3. **True/False Quiz**
   - Presents statements for the user to validate as True (T) or False (F).  
   - Validates the input and calculates the score.  

4. **Input Validation**
   - Ensures user input is limited to valid options (e.g., a, b, c, d for MCQs; t, f for True/False).  
   - Prints an error message and prompts the user again if the input is invalid.  

5. **Dynamic Flow**
   - The program transitions seamlessly between MCQ and True/False quizzes.  

6. **Friendly Feedback**
   - Provides immediate feedback on whether the user’s answer is correct or wrong.  
   - Summarizes scores for both quiz sections upon completion.  

7. **Reusable Structure**
   - The program is modular, allowing for easy modification or addition of questions.  

---

## Code Structure

- **MCQ Implementation**:  
  - `question/4`: Stores question text, options, and the correct answer.  
  - `quiz_loop/5`: Handles presenting questions and scoring.

- **True/False Quiz Implementation**:  
  - `tf_question/3`: Stores True/False questions and answers.  
  - `tf_quiz_loop/5`: Handles True/False question flow.  

- **Input Validation**:  
  - Prevents invalid inputs like special characters (`#, $, %`) by rejecting them and prompting the user again.

---

## How to Use

1. Clone the repository containing the Prolog code.  
2. Load the file in a Prolog interpreter (e.g., SWI-Prolog).  
3. Run the `start_combined_quiz.` predicate to begin the quiz.  

---

## Repository Details

**Repository Name**: `combined-quiz-prolog`  
**Files Included**:  
- `combined_quiz.pl` (Prolog implementation of the quiz)  
- `README.md` (Documentation for the project)  

---

This project demonstrates an interactive, user-friendly system for quizzes, showcasing Prolog's capability for logical flows and validation.
