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

let canPlay = true;
let time = 0;

process.stdin.setRawMode(true);
process.stdin.resume();
process.stdin.on("data", (key) => {
  if (!canPlay) return;
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
    quit();
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

const jumper = genJumper(11);

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
  if (!canPlay) return;

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
  if (!canPlay) return;
  canPlay = false;
  clearInterval(interval);
  logGame("\x1b[31mU LOOSSEEE\x1b[0m");
  setTimeout(() => process.exit(), 1500);
}

function quit() {
  if (!canPlay) return;
  canPlay = false;
  clearInterval(interval);
  logGame("\x1b[33mFINEEEEE , come again LOOSSEEER\x1b[0m");
  setTimeout(() => process.exit(), 1500);
}

// function logGame(message?: string) {
//   if (!canPlay && message === undefined) return;
//   console.clear();
//   jumper.forEach((c, i) =>
//     console.log(c.join(" "), i === Math.floor(jumper.length / 2) ? i : ""),
//   );
//   if (message !== undefined) {
//     console.error(message);
//   }
// }

function logGame(message?: string) {
  if (!canPlay && message === undefined) return;

  // Move cursor to top-left
  process.stdout.write("\x1b[H");

  // Draw game
  jumper.forEach((c, i) => {
    process.stdout.write(
      `${c.join(" ")}${i === Math.floor(jumper.length / 2) ? ` ${time}` : ""}\x1b[K\n`,
    );
  });

  // Draw message on the line after the game
  if (message !== undefined) {
    process.stdout.write(`${message}\x1b[K`);
  }

  // Clear anything below the game/message
  process.stdout.write("\x1b[J");
}

logGame();

interval = setInterval(() => {
  if (!canPlay) return;

  moveX("down");
  logGame();
}, 500);

setInterval(() => {
  time++;
}, 1000);
