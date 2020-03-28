# The `CREATE KEYSPACE` Command 

A Cassandra keyspace is sort of like a relational database. It defines one or more tables. When you start `cqlsh` without specifying a keyspace, the prompt will look like this: `cqlsh>`, with no keyspace specified.

Now you'll create your own keyspace so you have something to write data to. In creating your keyspace, there are some required options. To walk through these options, you could use the command `HELP CREATE_KEYSPACE`, but instead you can use the helpful command-completion features of `cqlsh`. Type the following and then press the Tab key:

`CREATE KEYSPACE my_keyspace WITH`{{execute}}

When you press the Tab key, `cqlsh` begins completing the syntax of your command so that it reads:

`cqlsh> CREATE KEYSPACE my_keyspace WITH replication = {'class': '`

This is informing you that in order to specify a keyspace, you also need to specify a replication strategy. Tab again to see what options you have:

`cqlsh> CREATE KEYSPACE my_keyspace WITH replication = {'class': '
NetworkTopologyStrategy    OldNetworkTopologyStrategy SimpleStrategy`

Now `cqlsh` is giving you three strategies to choose from. For now, choose the `SimpleStrategy` by typing the name, and indicate you're done with a closing quote and Tab again:

`cqlsh> CREATE KEYSPACE my_keyspace WITH replication = {'class': 'SimpleStrategy', 'replication_factor':`

The next option you're presented with is a replication factor. For the simple strategy, this indicates how many nodes the data in this keyspace will be written to. For a production deployment, you'll want copies of your data stored on multiple nodes, but because you're just running a single node at the moment, you'll ask for a single copy. Specify a value of &ldquo;1&rdquo; and a space and Tab again:

`cqlsh> CREATE KEYSPACE my_keyspace WITH replication = {'class': 'SimpleStrategy', 'replication_factor': 1};`

You see that `cqlsh` has now added a closing bracket, indicating you've completed all of the required options. Complete the command with a semicolon and return, and your keyspace will be created.

---
**Keyspace Creation Options**

For a production keyspace, you would probably never want to use a value of 1 for the replication factor. There are additional options on creating a keyspace depending on the replication strategy that is chosen. The command completion feature will walk through the different options.

---

Have a look at your keyspace using the `DESCRIBE KEYSPACE` command:

`DESCRIBE KEYSPACE my_keyspace;`{{execute}}

You see that the table has been created with the `SimpleStrategy`, a `replication_factor` of one, and durable writes. Notice that your keyspace is described in much the same syntax that you used to create it, with one additional option that you did not specify: `durable_writes = true`.

After you have created your own keyspace, you can switch to it in the shell by typing:

`USE my_keyspace;`{{execute}}

Notice that the prompt has changed to indicate that we're using the keyspace.

---
**Using Snake Case**

You may have wondered why we directed you to to name your keyspace in &ldquo;snake case&rdquo; (`my_keyspace`) as opposed to &ldquo;camel case&rdquo; (`MyKeyspace`), which is familiar to developers using Java and other languages.

As it turns out, Cassandra naturally handles keyspace, table, and column names as lowercase. When you enter names in mixed case, Cassandra stores them as all lowercase.

This behavior can be overridden by enclosing your names in double quotes (e.g., `CREATE KEYSPACE "MyKeyspace"`). However, it tends to be a lot simpler to use snake case than to go against the grain.

---