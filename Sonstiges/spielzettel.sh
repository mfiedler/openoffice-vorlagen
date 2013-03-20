#!/bin/sh
set -o errexit

FILE=spielzettel.pdf

# 2 auf 1
pdfjoin --outfile spielzettel-joined.pdf "$FILE" "$FILE"
pdfnup --nup 2x1 --outfile spielzettel_2auf1.pdf spielzettel-joined.pdf

# 2 auf 1, beidseitig
pdfjoin --outfile spielzettel-joined.pdf "$FILE" "$FILE" "$FILE" "$FILE"
pdfnup --nup 2x1 --outfile spielzettel_2auf1_duplex.pdf spielzettel-joined.pdf

# 4 auf 1
pdfjoin --outfile spielzettel-joined.pdf "$FILE" "$FILE" "$FILE" "$FILE"
pdfnup --nup 2x1 --outfile spielzettel-joined-nup.pdf spielzettel-joined.pdf
pdfnup --nup 1x2 --no-landscape --outfile spielzettel_4auf1.pdf spielzettel-joined-nup.pdf

# 4 auf 1, beidseitig
pdfjoin --outfile spielzettel-joined.pdf "$FILE" "$FILE" "$FILE" "$FILE" "$FILE" "$FILE" "$FILE" "$FILE"
pdfnup --nup 2x1 --outfile spielzettel-joined-nup.pdf spielzettel-joined.pdf
pdfnup --nup 1x2 --no-landscape --outfile spielzettel_4auf1_duplex.pdf spielzettel-joined-nup.pdf

# temporaere Dateien entfernen
rm spielzettel-joined.pdf spielzettel-joined-nup.pdf
