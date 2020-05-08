select
    *
from
    test
where
    updated_at >= :sql_last_value
order by
    updated_at asc