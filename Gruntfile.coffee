module.exports = (grunt) ->
  grunt.loadNpmTasks 'grunt-bower-concat'
  grunt.loadNpmTasks 'grunt-browserify'
  grunt.loadNpmTasks 'grunt-contrib-connect'
  grunt.loadNpmTasks 'grunt-este-watch'
  grunt.loadNpmTasks 'grunt-contrib-compass'
  grunt.loadNpmTasks 'grunt-karma'
  grunt.initConfig
    bower_concat:
      all:
        dest: "public/vendor.js"
        bowerOptions:
          relative: false

    browserify:
      app:
        files:
          "public/all.js": [
            "app/**/*.coffee"
          ]
        options:
          transform: ["coffeeify", "brfs", "uglifyify"]

      spec:
        files:
          "spec/build/test.js": [
            "spec/src/**/*.spec.coffee"
          ]
        options:
          transform: ["coffeeify"]

    karma:
      unit:
        options:
          frameworks: [
            'mocha',
            'sinon-chai'
          ]
          files: ["spec/build/test.js"]
          browsers: ['PhantomJS']
          reporters: "spec"
          singleRun: true

    compass:
      dist:
        options:
          sassDir: "app/styles"
          specify: "app/styles/all.scss"
          cssDir: "public"
          require: ["animation"]
          outputStyle: "compressed"

    connect:
      app:
        options:
          port: 3001
          base: 'public'

    esteWatch:
      options:
        dirs: [
          "app/**/"
          "spec/**/"
        ]
      coffee: (filepath) ->
        ["test"]
      html: (filepath) ->
        ["test"]
      scss: (filepath) ->
        ["compass"]

  grunt.registerTask "build", ["bower_concat", "browserify", "compass"]
  grunt.registerTask "default", ["build"]
  grunt.registerTask "server", ["connect", "esteWatch"]
  grunt.registerTask "test", ["build", "karma"]
