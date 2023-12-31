create table user_data(
      user_id serial unique not null,
      login text not null,
      password text not null);

create table file_data(
      file_id serial unique not null,
      file_name text not null,
      file_data bytea not null,
      user_id int references user_data (user_id) not null);