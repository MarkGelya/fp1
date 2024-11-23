-module(triangle).

-export([main/0]).

sum_two_lines(Head1, [], [Head2 | _], Res) ->
    lists:reverse([Head1 + Head2 | Res]);
sum_two_lines(Head11, [Head12 | Tail1],
              [Head21 | Tail2], Res) ->
    case Head11 > Head12 of
        true ->
            sum_two_lines(Head12,
                          Tail1,
                          Tail2,
                          [Head11 + Head21 | Res]);
        false ->
            sum_two_lines(Head12,
                          Tail1,
                          Tail2,
                          [Head12 + Head21 | Res])
    end.

sum_two_lines([Head1 | Tail1], [Head2 | Tail2]) ->
    sum_two_lines(Head1, Tail1, Tail2, [Head1 + Head2]).

sum_triangle(List, []) -> List;
sum_triangle(Head1, [Head2 | Tail]) ->
    sum_triangle(sum_two_lines(Head1, Head2), Tail).

sum_triangle([Head | Tail]) -> sum_triangle(Head, Tail).

max_el_of_list([Head | Tail], Max) when Head > Max ->
    max_el_of_list(Tail, Head);
max_el_of_list([_ | Tail], Max) ->
    max_el_of_list(Tail, Max);
max_el_of_list([], Max) -> Max.

max_el_of_list([Head | Tail]) ->
    max_el_of_list(Tail, Head).

main() ->
    Triangle = [[75],
                [95, 64],
                [17, 47, 82],
                [18, 35, 87, 10],
                [20, 04, 82, 47, 65],
                [19, 01, 23, 75, 03, 34],
                [88, 02, 77, 73, 07, 63, 67],
                [99, 65, 04, 28, 06, 16, 70, 92],
                [41, 41, 26, 56, 83, 40, 80, 70, 33],
                [41, 48, 72, 33, 47, 32, 37, 16, 94, 29],
                [53, 71, 44, 65, 25, 43, 91, 52, 97, 51, 14],
                [70, 11, 33, 28, 77, 73, 17, 78, 39, 68, 17, 57],
                [91, 71, 52, 38, 17, 14, 91, 43, 58, 50, 27, 29, 48],
                [63,
                 66,
                 04,
                 68,
                 89,
                 53,
                 67,
                 30,
                 73,
                 16,
                 69,
                 87,
                 40,
                 31],
                [04,
                 62,
                 98,
                 27,
                 23,
                 09,
                 70,
                 98,
                 73,
                 93,
                 38,
                 53,
                 60,
                 04,
                 23]],
    io:format("~w~n",
              [max_el_of_list(sum_triangle(Triangle))]).
