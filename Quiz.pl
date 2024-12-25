% Define the questions and their correct answers ('A', 'B', 'C', or 'D').
question(1, 'Which programming language is known as the backbone of web development?', ['A: Python', 'B: JavaScript', 'C: C++', 'D: Java'], 'B').
question(2, 'What does SQL stand for?', ['A: Structured Query Language', 'B: Simple Query Language', 'C: Standard Query Logic', 'D: Sequential Query Language'], 'A').
question(3, 'Which programming language is primarily used for iOS app development?', ['A: Swift', 'B: Kotlin', 'C: Java', 'D: C#'], 'A').
question(4, 'What is the purpose of a loop in programming?', ['A: To store data', 'B: To execute a block of code repeatedly', 'C: To define variables', 'D: To terminate a program'], 'B').
question(5, 'Which of the following is not a programming paradigm?', ['A: Object-Oriented', 'B: Functional', 'C: Procedural', 'D: Architectural'], 'D').

% True/False questions
tf_question(1, 'Is Python a compiled language?', 'F').
tf_question(2, 'Does C++ support object-oriented programming?', 'T').
tf_question(3, 'Is JavaScript the same as Java?', 'F').
tf_question(4, 'Can SQL be used for data manipulation?', 'T').
tf_question(5, 'Does HTML stand for HyperText Markup Language?', 'T').

% Wrapper to start the combined quiz and collect user information
start_combined_quiz :- 
    write('Welcome to the Combined Quiz!'), nl,
    write('Please enter your name: '),
    read_line_to_string(user_input, Name),
    write('Please enter your student code: '),
    read_line_to_string(user_input, Code),
    nl,
    format('Hello, ~s! Your student code is ~s.~n', [Name, Code]),
    nl,
    start_mcq_quiz(Name, Code). % Start with MCQ quiz.

% Start the MCQ Quiz
start_mcq_quiz(Name, Code) :-
    write('Starting the MCQ Quiz...'), nl,
    write('Answer each question with a, b, c, or d.'), nl,
    quiz_loop(1, 0, Name, Code).

% Main quiz loop for MCQs
quiz_loop(6, Score, Name, Code) :- 
    format('Your total score in the MCQ quiz is ~w/5.~n', [Score]),
    nl,
    start_tf_quiz(Name, Code). % Move to True/False quiz.

quiz_loop(Number, Score, Name, Code) :-
    question(Number, Text, Options, CorrectAnswer),
    format('Question ~w: ~s ~n', [Number, Text]),
    display_options(Options),
    write('Your answer (a, b, c, or d): '),
    repeat,
    read(UserAnswer),
    (   validate_mcq_answer(UserAnswer)
    ->  (   validate_answer(UserAnswer, CorrectAnswer)
        ->  write('Correct!'), nl,
            NewScore is Score + 1
        ;   write('Wrong!'), nl,
            NewScore is Score
        ),
        NextNumber is Number + 1,
        quiz_loop(NextNumber, NewScore, Name, Code)
    ;   write('Invalid answer, try again.'), nl,
        fail
    ).

% Display multiple-choice options
display_options([]).
display_options([Option | Rest]) :-
    write(Option), nl,
    display_options(Rest).

% Validate multiple-choice input
validate_mcq_answer(UserAnswer) :-
    member(UserAnswer, [a, b, c, d]).

% Validate multiple-choice answer
validate_answer(UserAnswer, CorrectAnswer) :-
    upcase_atom(UserAnswer, UpperCase),
    UpperCase = CorrectAnswer.

% Start the True/False Quiz
start_tf_quiz(Name, Code) :-
    write('Starting the True/False Quiz...'), nl,
    write('Answer each question with t or f.'), nl,
    tf_quiz_loop(1, 0, Name, Code).

% Main quiz loop for True/False questions
tf_quiz_loop(6, Score, Name, Code) :-
    format('Your total score in the True/False quiz is ~w/5.~n', [Score]),
    nl,
    format('Thank you for participating, ~s! Your student code was ~s. Goodbye!~n', [Name, Code]).

tf_quiz_loop(Number, Score, Name, Code) :-
    tf_question(Number, Text, CorrectAnswer),
    format('Question ~w: ~s ~n', [Number, Text]),
    write('Your answer (t or f): '),
    repeat,
    read(UserAnswer),
    (   validate_tf_answer_input(UserAnswer)
    ->  (   validate_tf_answer(UserAnswer, CorrectAnswer)
        ->  write('Correct!'), nl,
            NewScore is Score + 1
        ;   write('Wrong!'), nl,
            NewScore is Score
        ),
        NextNumber is Number + 1,
        tf_quiz_loop(NextNumber, NewScore, Name, Code)
    ;   write('Invalid answer, try again.'), nl,
        fail
    ).

% Validate True/False input
validate_tf_answer_input(UserAnswer) :-
    member(UserAnswer, [t, f]).

% Validate True/False answer
validate_tf_answer(UserAnswer, CorrectAnswer) :-
    upcase_atom(UserAnswer, UpperCase),
    UpperCase = CorrectAnswer.
