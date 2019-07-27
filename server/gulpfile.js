const gulp = require("gulp");
const child_process = require("child_process");
let dockerode = require("dockerode");
const path = require("path");
const fs = require("fs");

const ps = {};
// test

gulp.task("go_build", done => {
  console.log('building');
  child_process.execSync(`go build .`, { stdio: "inherit" });

  return done();
});
//
// gulp.task("go_install_deps", (done) => {
//   fs.readFileSync(path.join(__dirname, 'godeps.txt'))
//     .toString()
//     .split('\n')
//     .forEach((dep => (
//         child_process.execSync(
//           `go get -v ${dep.trim()}`,
//           { stdio: "inherit", shell: true }
//         )
//       )
//     ));
//   done()
// });
//
// gulp.task("go_run", done => {
//   try {
//     ps.go_run = child_process.exec(path.join(__dirname, 'out'), { stdio: "inherit" });
//   } catch (err) {
//     console.error(err);
//     process.exit(1)
//   }
//   done();
// });
//
// gulp.task("_go_kill", done => {
//   const p = ps.go_run;
//   if (p) {
//     p.kill();
//     ps.go_run = undefined;
//   }
//   return done();
// });

gulp.task("dev", () =>
  gulp.watch(
    "./**/*.go",
    {
      ignoreInitial: false,
      queue: false
    },
    // gulp.series("_go_kill", "go_build", "go_run")
    (done) => { console.log('hello'); done(); }
  )
);

