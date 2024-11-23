-module(basic_SUITE).

-include_lib("common_test/include/ct.hrl").
-include_lib("stdlib/include/assert.hrl").

-export([all/0]).
-export([sum_bigint_tests/1, triangle_tests/1]).

all() ->
    [sum_bigint_tests, triangle_tests].

sum_bigint_tests(_) ->
    sum_bigint_test_cases(5537376230).

triangle_tests(_) ->
    triangle_test_cases(1074).

triangle_test_cases(Expected) ->
    ?assertEqual(Expected, triangle:main()).

sum_bigint_test_cases(Expected) ->
    ?assertEqual(Expected, first:main()),
    ?assertEqual(Expected, sum_monolith_recursion:main()),
    ?assertEqual(Expected, sum_monolith_tail_recursion:main()),
    ?assertEqual(Expected, sum_module:main()),
    ?assertEqual(Expected, sum_stream:main()).
