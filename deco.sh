#!/bin/bash
source cmedia.sh
if [ $media -lt 400 ]
then
echo "La ciudad $1 es ECO."
else
echo "La ciudad $1 no es ECO."
fi