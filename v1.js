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

    const [id, fileAndLine] = line.split(', ');
    const [file, lineNumber] = fileAndLine.split(':');

    if (file in found) {
        found[file].push(id);
    } else {
        found[file] = [id];
    }

});

rl.on('close', () => {
    console.log(JSON.stringify(found));

    for (const file of Object.keys(found)) {
        let content = fs.readFileSync(file).toString();

        for (const id of found[file]) {
            content = content.replace(id, () => `'${crypto.randomUUID()}'`);
        }

        fs.writeFileSync(file, content);
    }

});