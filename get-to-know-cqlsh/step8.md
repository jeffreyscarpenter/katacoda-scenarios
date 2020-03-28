# The `TRUNCATE` and `DROP` Commands
If you really want to clean things up, you can remove all data from the table using the `TRUNCATE` command:

`TRUNCATE user;`{{execute}}

Alternatively, you can delete the table schema entirely using the `DROP TABLE` command:

`DROP TABLE user;`{{execute}}

---
**`.cqlsh` Command History**

Now that you've been using `cqlsh` for a while, you may have noticed that you can navigate through commands you've executed previously with the up and down arrow keys. This history is stored in a file called _cqlsh_history_, which is located in a hidden directory called _.cassandra_ within your home directory. This acts like your bash shell history, listing the commands in a plain-text file in the order Cassandra executed them. Nice!

---