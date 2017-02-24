import gulp from 'gulp'
import htmlmin from 'gulp-htmlmin'
import uglify from 'gulp-uglify'
import runSequence from 'run-sequence'

gulp.task('minify-html', () => {
  return gulp.src('html/**/*.html')
    .pipe(htmlmin({
      collapseWhitespace: true,
      minifyCSS: true,
      minifyJS: true,
      removeComments: true,
      useShortDoctype: true,
    }))
    .pipe(gulp.dest('./html'))
})

gulp.task('minify-js', () => {
    return gulp.src('./html/**/*.js')
        .pipe(uglify())
        .pipe(gulp.dest('./html'));
});

gulp.task('build', (callback) => {
  runSequence('minify-html','minify-js', callback)
})
