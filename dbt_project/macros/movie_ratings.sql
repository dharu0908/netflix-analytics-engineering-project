{% macro movie_ratings(column_name) %}

case
    when {{ column_name }} >= 4.5 then 'Top_Rated'
    when {{ column_name }} >= 4.0 then 'Highly_Rated'
    when {{ column_name }} >= 3.0 then 'Medium_Rated'
    else 'Low_Rated'
end

{% endmacro %}