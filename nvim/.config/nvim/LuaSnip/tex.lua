---@diagnostic disable: undefined-global
return {
  s(
    { trig = '!', desc = 'LaTeX boilerplate' },
    fmta(
      [[
        \documentclass[a4paper,12pt]{article}
        \input{/home/emil/Documents/latex/preamble.tex}
        \title{<>}
        \begin{document}
        \maketitle
            <>
        \end{document}
      ]],
      { i(1), i(2) }
    )
  ),

  s(
    { trig = 'fig', desc = 'Figure environment' },
    fmta(
      [[
        \begin{figure}[<>]
            \centering
            \includegraphics[width=0.8\textwidth]{<>}
            \caption{<>}
            \label{fig:<>}
        \end{figure}
      ]],
      { i(1, 'htpb'), i(2), i(3), i(4) }
    )
  ),
}
