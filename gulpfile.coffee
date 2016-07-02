gulp  = require 'gulp'
concat = require 'gulp-concat'
merge = require 'gulp-merge'
include = require 'gulp-include'
coffee = require 'gulp-coffee'

paths =
  app:  ['./app/js/application.coffee']

gulp.task 'default', ->
  merge(
    gulp.src('./app/js/lib.js')
        .pipe(include())
    , gulp.src(paths.app)
          .pipe(include())
          .pipe(coffee(bare: true)))
          .pipe(concat('application.js'))
  .pipe(gulp.dest('./app/js/'))

gulp.task 'watch', ['default'], ->
  gulp.watch ['./app/js/lib.js', './app/js/*.coffee'], ['default']
