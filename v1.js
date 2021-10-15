// use readline to read from input
const readline = require('readline');
const fs = require('fs');
const crypto = require('crypto');

const found = {};

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout,
    terminal: false
});

rl.on('line', (line) => {

    const [id, file] = line.split(', ');

    if (id in found) {
        found[id].push(file);
    } else {
        found[id] = [file];
    }

    // process each line, which will be each id
    // console.log(`${line} = ${id} | ${file}`);
});

rl.on('close', () => {
    console.log(JSON.stringify(found));

    for (const id of Object.keys(found)) {
        for (const file of found[id]) {
            let content = fs.readFileSync(file).toString();
            
            content = content.replace(id, () => `'${crypto.randomUUID()}'`);

            fs.writeFileSync(file, content);
        }
    }

});