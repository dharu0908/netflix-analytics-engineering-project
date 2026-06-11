{% macro rating_segment(column_name) %}

case
    when {{ column_name }} >= 50 then 'Highly_Active'
    when {{ column_name }} >= 20 then 'Active'
    when {{ column_name }} >= 5 then 'Low_Active'
    else 'Inactive'
end

{% endmacro %}
