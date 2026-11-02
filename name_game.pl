:- dynamic letters/1.

letters([a,b,c]).

start :-
    writeln('Hi. This is the Name Game.'),
    writeln('You will be given a set of English letters'),
    writeln('to add, delete or move to create your name.'),
    menu.

menu :-
    nl,
    writeln('Choose from the following:'),
    writeln('1- Display the current set of letters'),
    writeln('2- Add a letter'),
    writeln('3- Add a letter at the top'),
    writeln('4- Add a letter at the bottom'),
    writeln('5- Delete a letter'),
    writeln('6- Delete all letters'),
    writeln('7- Exit'),
    write('Enter your choice: '),
    read(Choice),
    action(Choice).

action(1) :-
    letters(L),
    write('Current letters: '),
    writeln(L),
    menu.

action(2) :-
    write('Enter a letter: '),
    read(X),
    letters(L),
    append(L, [X], NewL),
    retractall(letters(_)),
    assertz(letters(NewL)),
    writeln('Letter added successfully.'),
    menu.

action(3) :-
    write('Enter a letter: '),
    read(X),
    letters(L),
    NewL = [X|L],
    retractall(letters(_)),
    assertz(letters(NewL)),
    writeln('Letter added at the top.'),
    menu.

action(4) :-
    write('Enter a letter: '),
    read(X),
    letters(L),
    append(L, [X], NewL),
    retractall(letters(_)),
    assertz(letters(NewL)),
    writeln('Letter added at the bottom.'),
    menu.

action(5) :-
    write('Enter a letter to delete: '),
    read(X),
    letters(L),
    ( select(X, L, NewL) ->
        retractall(letters(_)),
        assertz(letters(NewL)),
        writeln('Letter deleted successfully.')
    ;
        writeln('Letter not found.')
    ),
    menu.

action(6) :-
    retractall(letters(_)),
    assertz(letters([])),
    writeln('All letters deleted.'),
    menu.

action(7) :-
    writeln('Thank you for playing!').

action(_) :-
    writeln('Invalid choice. Try again.'),
    menu.
