fs   = require 'fs'
path = require 'path'

jade = require 'jade'

regex = ///
  include\s+  # @import followed by one or more whitespace chars
  (.+)       # capture any except single or double quote
///gi

exports.findImports = findImports = (imports, file, callback) ->
  await fs.readFile file, 'utf8', defer err, contents
  return callback err if err

  while match = regex.exec contents
    item = match[1]
    item += '.jade' if path.extname(item) is ''
    item = path.resolve path.dirname(file), item
    unless item in imports
      imports.push item
      await findImports imports, item, defer err
      return callback err if err

  callback()


exports.compile = (file, flags, callback) ->
  await fs.readFile file, 'utf8', defer err, contents
  return callback err if err

  try
    contents = jade.compile contents,
      filename:     file
      client:       yes
      compileDebug: no
  catch err
    return callback err

  templateName = path.basename file, '.jade'
  callback null, "JST['#{templateName}'] = #{contents};\n"
