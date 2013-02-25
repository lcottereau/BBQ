# Better Boursorama QIF

Takes a file from the [Boursorama website](https://www.boursorama.com/) account export and change it to make it more explicit, 
by exploiting more of the possibilities offered by the 
[Quicken Interchange Format](https://en.wikipedia.org/wiki/Quicken_Interchange_Format). 

The raw file usually has all the
information (transaction type, payee, date, location, ...) in the Payee line. This utility creates a new file which has
only the payee on the payee line. Interesting information such as date and location are saved as a description line.

## Usage

    filter-qif.sh <raw_file> <qualifier>
  
The <code>&lt;raw_file&gt;</code> from Boursorama site will be archived to <code>$BACKUP/YYYYMMDD-&lt;qualifier&gt;.qif</code>
and the new/better file will be put in <code>$COMPTES/YYYYMMDD-&lt;qualifier&gt;.qif</code>.

## Note on formats

There doesn't seem to be any difference between Money and Quicken2000 (as chosen from the Boursorama download site). 

It seems more secure to stay off Quicken format as the dates are weirdly formatted.
