CREATE OR REPLACE FUNCTION trigger_set_timestamp()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

create table TEST (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(50),
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TRIGGER set_timestamp
BEFORE UPDATE ON TEST
FOR EACH ROW
EXECUTE PROCEDURE trigger_set_timestamp();

insert into TEST (name, email) values ('Test1', 'test1@gmail.com');
insert into TEST (name, email) values ('Test2', 'test2@gmail.com');
insert into TEST (name, email) values ('Test3', 'test3@gmail.com');
insert into TEST (name, email) values ('Test4', 'test4@gmail.com');
insert into TEST (name, email) values ('Test5', 'test5@gmail.com');
insert into TEST (name, email) values ('Test6', 'test6@gmail.com');
insert into TEST (name, email) values ('Test7', 'test7@gmail.com');
insert into TEST (name, email) values ('Test8', 'test8@gmail.com');
insert into TEST (name, email) values ('Test9', 'test9@gmail.com');
insert into TEST (name, email) values ( 'Test10', 'test10@gmail.com');