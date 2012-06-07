
[1mFrom:[0m /home/manuva/.rvm/gems/ruby-1.9.2-p320/gems/activerecord-3.2.3/lib/active_record/querying.rb @ line 4:
[1mNumber of lines:[0m 54
[1mOwner:[0m ActiveRecord::Querying
[1mVisibility:[0m public

[1;31mmodule[0m [1;35mQuerying[0m
  delegate [1;32m:find[0m, [1;32m:first[0m, [1;32m:first![0m, [1;32m:last[0m, [1;32m:last![0m, [1;32m:all[0m, [1;32m:exists?[0m, [1;32m:any?[0m, [1;32m:many?[0m, [1;32m:to[0m => [1;32m:scoped[0m
  delegate [1;32m:first_or_create[0m, [1;32m:first_or_create![0m, [1;32m:first_or_initialize[0m, [1;32m:to[0m => [1;32m:scoped[0m
  delegate [1;32m:destroy[0m, [1;32m:destroy_all[0m, [1;32m:delete[0m, [1;32m:delete_all[0m, [1;32m:update[0m, [1;32m:update_all[0m, [1;32m:to[0m => [1;32m:scoped[0m
  delegate [1;32m:find_each[0m, [1;32m:find_in_batches[0m, [1;32m:to[0m => [1;32m:scoped[0m
  delegate [1;32m:select[0m, [1;32m:group[0m, [1;32m:order[0m, [1;32m:except[0m, [1;32m:reorder[0m, [1;32m:limit[0m, [1;32m:offset[0m, [1;32m:joins[0m,
           [1;32m:where[0m, [1;32m:preload[0m, [1;32m:eager_load[0m, [1;32m:includes[0m, [1;32m:from[0m, [1;32m:lock[0m, [1;32m:readonly[0m,
           [1;32m:having[0m, [1;32m:create_with[0m, [1;32m:uniq[0m, [1;32m:to[0m => [1;32m:scoped[0m
  delegate [1;32m:count[0m, [1;32m:average[0m, [1;32m:minimum[0m, [1;32m:maximum[0m, [1;32m:sum[0m, [1;32m:calculate[0m, [1;32m:pluck[0m, [1;32m:to[0m => [1;32m:scoped[0m

  [0;34m# Executes a custom SQL query against your database and returns all the results. The results will[0m
  [0;34m# be returned as an array with columns requested encapsulated as attributes of the model you call[0m
  [0;34m# this method from. If you call <tt>Product.find_by_sql</tt> then the results will be returned in[0m
  [0;34m# a Product object with the attributes you specified in the SQL query.[0m
  [0;34m#[0m
  [0;34m# If you call a complicated SQL query which spans multiple tables the columns specified by the[0m
  [0;34m# SELECT will be attributes of the model, whether or not they are columns of the corresponding[0m
  [0;34m# table.[0m
  [0;34m#[0m
  [0;34m# The +sql+ parameter is a full SQL query as a string. It will be called as is, there will be[0m
  [0;34m# no database agnostic conversions performed. This should be a last resort because using, for example,[0m
  [0;34m# MySQL specific terms will lock you to using that particular database engine or require you to[0m
  [0;34m# change your call if you switch engines.[0m
  [0;34m#[0m
  [0;34m# ==== Examples[0m
  [0;34m#   # A simple SQL query spanning multiple tables[0m
  [0;34m#   Post.find_by_sql "SELECT p.title, c.author FROM posts p, comments c WHERE p.id = c.post_id"[0m
  [0;34m#   > [#<Post:0x36bff9c @attributes={"title"=>"Ruby Meetup", "first_name"=>"Quentin"}>, ...][0m
  [0;34m#[0m
  [0;34m#   # You can use the same string replacement techniques as you can with ActiveRecord#find[0m
  [0;34m#   Post.find_by_sql ["SELECT title FROM posts WHERE author = ? AND created > ?", author_id, start_date][0m
  [0;34m#   > [#<Post:0x36bff9c @attributes={"title"=>"The Cheap Man Buys Twice"}>, ...][0m
  [1;31mdef[0m [1;34mfind_by_sql[0m(sql, binds = [])
    logging_query_plan [1;31mdo[0m
      connection.select_all(sanitize_sql(sql), [32m[1;32m"[0m[32m#{name}[0m[32m Load[1;32m"[0m[32m[0m, binds).collect! { |record| instantiate(record) }
    [1;31mend[0m
  [1;31mend[0m

  [0;34m# Returns the result of an SQL statement that should only include a COUNT(*) in the SELECT part.[0m
  [0;34m# The use of this method should be restricted to complicated SQL queries that can't be executed[0m
  [0;34m# using the ActiveRecord::Calculations class methods. Look into those before using this.[0m
  [0;34m#[0m
  [0;34m# ==== Parameters[0m
  [0;34m#[0m
  [0;34m# * +sql+ - An SQL statement which should return a count query from the database, see the example below.[0m
  [0;34m#[0m
  [0;34m# ==== Examples[0m
  [0;34m#[0m
  [0;34m#   Product.count_by_sql "SELECT COUNT(*) FROM sales s, customers c WHERE s.customer_id = c.id"[0m
  [1;31mdef[0m [1;34mcount_by_sql[0m(sql)
    sql = sanitize_conditions(sql)
    connection.select_value(sql, [32m[1;32m"[0m[32m#{name}[0m[32m Count[1;32m"[0m[32m[0m).to_i
  [1;31mend[0m
[1;31mend[0m
