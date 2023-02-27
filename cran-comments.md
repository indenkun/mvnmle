This mvnmle package was ORPHANED because the original package maintainer did not respond from CRAN.

It was then removed from the CRAN repository because it did not pass the R CMD check.

In this document (https://cran.r-project.org/src/contrib/Orphaned/README) on CRAN: 

> Everybody is more than welcome to take over as maintainer of an orphaned
> package.  Simply download the package sources, make changes if necessary
> (respecting original author and license!) and resubmit the package to
> CRAN with your name as maintainer in the DESCRIPTION file of the
> package.

I am not the original package maintainer, but I am going to resubmit a minor modification to pass the R CMD check and maintain the package.

Kevin Gross, the previous package maintainer and author, has given me permission to change the maintainer.

## RESUBMISSION

I received the following comment from CRAN in my previous submission:.

> Please rather use the Authors@R field and declare Maintainer, Authors and Contributors with their appropriate roles with person() calls.

Fix it.

> Please always explain all acronyms in the description text.

Fix it.

> If there are references describing the methods in your package, please
> add these in the description field of your DESCRIPTION file in the form
> authors (year) <doi:...>
> authors (year) <arXiv:...>
> authors (year, ISBN:...)
> or if those are not available: <https:...>
> with no space after 'doi:', 'arXiv:', 'https:' and angle brackets for
> auto-linking. (If you want to add a title as well please put it in
> quotes: "Title")

Fix it.

## R CMD check results

* There is one NOTE that is found on all platform:

```
* checking CRAN incoming feasibility ... NOTE
Maintainer: 'Mao Kobayashi <kobamao.jp@gmail.com>'

New submission

Package was archived on CRAN

CRAN repository db overrides:
  X-CRAN-Comment: Archived on 2020-05-14 as long orphaned and those
    depending on it have been given notice.
  Maintainer: ORPHANED
CRAN repository db conflicts: 'Maintainer'
```

This is an unavoidable message because it is a message associated with a change of maintainer.

* There is one NOTE that is only found on Windows (Server 2022, R-devel 64-bit): 

```
* checking for detritus in the temp directory ... NOTE
Found the following files/directories:
  'lastMiKTeXException'
```

This could be due to a bug/crash in MiKTeX and can likely be ignored.

* There is one NOTE that is found on Fedora Linux (R-devel, clang, gfortran) and Windows (Server 2022, R-devel 64-bit):

```
* checking HTML version of manual ... NOTE
Skipping checking HTML validation: no command 'tidy' found
Skipping checking math rendering: package 'V8' unavailable
```

This issue does not seem to be caused by the package itself.
