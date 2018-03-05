# Doctoral dissertation

## Accessing Multiversion Data in Database Transactions

Many important database applications need to access previous versions of the
data set, thus requiring that the data are stored in a multiversion database
and indexed with a multiversion index, such as the multiversion
B-tree (MVBT) of Becker et al.
The MVBT is optimal, so that any version of the database can be accessed
as efficiently as with a single-version B-tree that is used to index
only the data items of that version, but it cannot be used in a full-fledged
database system because it follows a single-update model, and the update
cannot be rolled back.

We have redesigned the MVBT index so that a single multi-action updating
transaction can operate on the index structure concurrently with multiple
concurrent read-only transactions.
Data items created by the transaction become part of the same
version, and the transaction can roll back.
We call this structure the _transactional MVBT_ (TMVBT).
The TMVBT index remains optimal even in the presence of logical key
deletions.
Even though deletions in a multiversion index must not physically
delete the history of the data items, queries and range scans
can become more efficient, if the leaf pages of the
index structure are merged to retain optimality.

For the general transactional setting with multiple updating transactions, we
propose a multiversion database structure called the _concurrent MVBT_
(CMVBT), which stores the updates of active transactions in a separate
main-memory-resident _versioned B-tree_ index.
A system maintenance transaction is periodically run to apply the updates of
committed transactions into the TMVBT index.
We show how multiple updating transactions can operate on the CMVBT
index concurrently, and our recovery algorithm is based on the standard
ARIES recovery algorithm.

We prove that the TMVBT index is asymptotically optimal, and show that the
performance of the CMVBT index in general transaction processing is
on par with the performance of the time-split B-tree (TSB-tree)
of Lomet and Salzberg.
The TSB-tree does not merge leaf pages and is therefore not optimal if
logical data-item deletions are allowed.
Our experiments show that the CMVBT outperforms the TSB-tree with
range queries in the presence of deletions.

## Compiling

You can compile the dissertation with `pdflatex` (plain `LaTeX` is not enough),
you need to run the command a couple of times.

Use the parameter `--min-crossrefs=999` with Bibtex so that the references
are created correctly.

Requires a relatively recent `LaTeX` environment. The dissertation
was compiled with `MikTex 2.8` on Windows.

This information was last checked on 30.9.2010.
