# https://picsum.photos からサンプルイメージを参照
for i in `seq 1 40`
do
    curl -OL https://picsum.photos/350/350/?random
    mv ?random image_$i.jpg
done
