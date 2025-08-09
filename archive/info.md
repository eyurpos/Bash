# Archive

## tar

- create
> tar -cf [archive] [files / folders]

> -v - verbose

- list content
> tar -tf [archive]

- extract
> tar -xf [archive] [files (optional)]

> tar -xf [archive] -C [directory] [files (optional)] - to specific dir

## compression
- compress
> gzip -k [file] (produces file.gz)
- decompress
> gzip -d [file.gz] 

or

> gunzip [file.gz] 

## archive & compression
- create
> tar -cxf [archive.tar.gz] [files / folders]

- extract
> tar -xzf [archive] [files (optional)]