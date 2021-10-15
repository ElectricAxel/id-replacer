// use readline to read from input
const readline = require('readline');
const fs = require('fs');
const crypto = require('crypto');
const { exit } = require('process');

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout,
    terminal: false
});

let result = 0;

rl.on('line', (line) => {

    const [id, file] = line.split(', ');

    let content = fs.readFileSync(file).toString();
    
    content = content.replace(id, () => `'${crypto.randomUUID()}'`);

    fs.writeFileSync(file, content);

    result = 1;

});

rl.on('close', () => {
    
    exit(result);
    
});