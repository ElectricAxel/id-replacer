mkdir -p workflows/id_replacer_benchmark/src

for i in {1..100};
do
  cat << EOF > workflows/id_replacer_benchmark/src/$i.ts
a.b({
    id: '46b81a2c-bba4-46fc-9d44-26dc5ba2bd11',
});

a.c({
    id: '46b81a2c-bba4-46fc-9d44-26dc5ba2bd11',
});
EOF
done

time ./script1.sh
rm -f workflows/id_replacer_benchmark/src/*

for i in {1..100};
do
  cat << EOF > workflows/id_replacer_benchmark/src/$i.ts
a.b({
    id: '46b81a2c-bba4-46fc-9d44-26dc5ba2bd11',
});

a.c({
    id: '46b81a2c-bba4-46fc-9d44-26dc5ba2bd11',
});
EOF
done
time ./script2.sh

rm -rf workflows/id_replacer_benchmark