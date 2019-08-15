CPT=events.cpt

cat << EOF > $CPT
0 red 70 red
70 green 150 green
150 blue 700 blue
EOF

gmt begin small_region pdf
    gmt set FONT_ANNOT_PRIMARY 6p FORMAT_GEO_MAP ddd:mm
    gmt set MAP_FRAME_WIDTH 2p MAP_GRID_PEN_PRIMARY 0.25p,gray,2_2:1

    gmt set FONT_LABEL 6p,20 MAP_LABEL_OFFSET 4p
    gmt coast -JD134.5/36.5/24/49/7.0i -R110/155/15/55 -G244/243/239 -S167/194/223 -Bxafg -Byafg
    # gmt meca  -Sd0.2c/0.05c -Z$CPT -M ../data/psmeca_gcmts.log

    # gmt colorbar -C$CPT -DjBR+w3c/0.3c+ml+o3.0c/0.0c -Bx+lDepth -By+lkm -L -S
    gmt psxy -Sa0.5c <<EOF
130.9800 43.61
EOF

    gmt plot -W1p,red << EOF
>
121.171098870338 23.5639471537689
147.828901129662 23.5639471537689
>
147.828901129662 23.5639471537689
152.758174996739 47.7205278935976
>
152.758174996739 47.7205278935976
116.241825003261 47.7205278935976
>
116.241825003261 47.7205278935976
121.171098870338 23.5639471537689
EOF

    gmt plot -W1p,black << EOF
>
125 45
135 35
EOF

gmt end