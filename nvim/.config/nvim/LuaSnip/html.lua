---@diagnostic disable: undefined-global
return {
  s(
    { trig = '!', desc = 'HTML Boilerplate' },
    fmta(
      [[
        <!DOCTYPE html>
        <html lang="en">
        <head>
            <meta charset="UTF-8" />
            <title>Document</title>
        </head>
        <body>
            {}
        </body>
        </html>
      ]],
      { i(1) },
      { delimiters = '{}' }
    )
  ),
}
