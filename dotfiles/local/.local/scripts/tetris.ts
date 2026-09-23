#!/usr/bin/env bun

const config = {
  good: "\x1b[32mO\x1b[0m",
  bad: "\x1b[31mO\x1b[0m",
  up: "w",
  down: "s",
  left: "a",
  right: "d",
};

const { bad, down, good, left, right, up } = config;

process.stdin.setRawMode(true);
process.stdin.resume();
process.stdin.on("data", (key) => {
  const char = key.toString();

  if (char === left) {
    moveX("left");
    logGame();
  }
  if (char === down) {
    moveX("down");
    logGame();
  }
  if (char === up) {
    moveX("up");
    logGame();
  }
  if (char === right) {
    moveX("right");
    logGame();
  }
  //   if (char === ' ') console.log('space')

  if (char === "\u0003") {
    process.exit();
  }
});

const genJumper = (length: number) => {
  if (length < 4)
    throw new Error("cols must be at least 3 and rows must be at least 4");
  const initJumper: string[][] = [];
  for (let i = 0; i < length; i++) {
    if (i === 0) {
      const arr = [];
      arr.push(bad);
      Array.from({ length: length - 2 }).forEach((_j) => arr.push(bad));
      arr.push(bad);
      initJumper.push(arr);
    } else if (i === length - 1) {
      const arr = [];
      arr.push(bad);
      Array.from({ length: length - 2 }).forEach((_j) => arr.push(bad));
      arr.push(bad);
      initJumper.push(arr);
    } else if (i === 1) {
      const arr = [];
      arr.push(bad);
      Array.from({ length: length - 2 }).forEach((_j, j) => {
        if (j + 2 === Math.round(length / 2)) arr.push("X");
        else arr.push(good);
      });
      arr.push(bad);
      initJumper.push(arr);
    } else {
      const arr = [];
      arr.push(bad);
      Array.from({ length: length - 2 }).forEach((_j, j) => {
        arr.push(good);
      });
      arr.push(bad);
      initJumper.push(arr);
    }
  }
  return initJumper;
};

const jumper = genJumper(10);

function getXCords() {
  let xCol = 0;
  let xRow = 0;
  jumper.map((c, cID) => {
    c.forEach((r, rID) => {
      if (r === "X") {
        xRow = rID;
        xCol = cID;
      }
    });
  });
  return {
    xCol,
    xRow,
  };
}

function moveX(dir: "left" | "right" | "down" | "up") {
  const { xCol, xRow } = getXCords();

  if (dir === "down" && xCol !== jumper.length - 2) {
    jumper[xCol]![xRow] = "\x1b[32mO\x1b[0m";
    jumper[xCol + 1]![xRow] = "X";
  } else if (dir === "up" && xCol !== 1) {
    jumper[xCol]![xRow] = "\x1b[32mO\x1b[0m";
    jumper[xCol - 1]![xRow] = "X";
  } else if (dir === "left" && xRow !== 1) {
    jumper[xCol]![xRow] = "\x1b[32mO\x1b[0m";
    jumper[xCol]![xRow - 1] = "X";
  } else if (dir === "right" && xRow !== jumper[0]!.length - 2) {
    jumper[xCol]![xRow] = "\x1b[32mO\x1b[0m";
    jumper[xCol]![xRow + 1] = "X";
  } else lose();
}

let interval: ReturnType<typeof setInterval>;

function lose() {
  clearInterval(interval);
  console.error("U LOOSSEEE");
  setTimeout(() => process.exit(), 1500);
}

function logGame() {
  console.clear();
  jumper.forEach((c) => console.log(c.join(" ")));
}

logGame();

moveX("down");

interval = setInterval(() => {
  logGame();
  moveX("down");
}, 500);
