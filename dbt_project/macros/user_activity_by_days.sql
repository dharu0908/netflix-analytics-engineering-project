{% macro user_activity_by_days(column_name) %}

case
    when {{ column_name }} between 4000 and 9000 then 'Active'
    when {{ column_name }} between 9000 and 10500 then 'At Risk'
    else 'Inactive'
end

{% endmacro %}