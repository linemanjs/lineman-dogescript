
module.exports = (lineman) ->
  app = lineman.config.application

  files:
    doge:
      app: "app/js/**/*.doge"
      generated: "generated/js/app.coffee.js"

  config:
    loadNpmTasks: lineman.config.application.loadNpmTasks.concat("grunt-dogescript")

    prependTasks:
      common: ["dogescript"].concat(lineman.config.application.prependTasks.common)

    concat_sourcemap:
      js:
        src: app.concat_sourcemap.js.src.concat("<%= files.doge.generated %>")

    dogescript:
      compile:
        files:
            "<%= files.doge.generated %>": "<%= files.doge.app %>"

    watch:
      dogescript:
        files: "<%= files.doge.app %>"
        tasks: ["dogescript", "concat_sourcemap:js"]
