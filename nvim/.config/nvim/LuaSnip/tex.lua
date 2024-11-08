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
            \caption{<><>}
            \label{fig:<>}
        \end{figure}
      ]],
      { i(1, 'htpb'), i(2), rep(2), i(3), i(4) }
    )
  ),

  s(
    { trig = 'item', desc = 'Un-ordered list' },
    fmta(
      [[
        \begin{itemize}
            \item <>
        \end{itemize}
      ]],
      { i(1) }
    )
  ),

  s(
    { trig = 'enum', desc = 'Ordered list' },
    fmta(
      [[
        \begin{enumerate}
            \item <>
        \end{enumerate}
      ]],
      { i(1) }
    )
  ),

  s(
    { trig = 'sec', desc = 'Section' },
    fmta(
      [[
        \section{<>}
            <>
      ]],
      { i(1), i(0) }
    )
  ),

  s(
    { trig = 'ssec', desc = 'Sub section' },
    fmta(
      [[
        \subsection{<>}
            <>
      ]],
      { i(1), i(0) }
    )
  ),

  s(
    { trig = 'sssec', desc = 'Sub sub section' },
    fmta(
      [[
        \subsubsection{<>}
            <>
      ]],
      { i(1), i(0) }
    )
  ),

  s(
    { trig = 'cblock', desc = 'Code block' },
    fmta(
      [[
        \begin{minted}
        [
        frame=lines,
        framesep=2mm,
        linenos,
        breaklines,
        xleftmargin=0.7cm,
        autogobble=true,
        escapeinside=||
        ]{<>}
        <>
        \end{minted}
      ]],
      { i(1), i(2) }
    )
  ),

  s(
    { trig = 'cinline', desc = 'Inline code' },
    fmta(
      [[
        \mintinline{<>}{<>}
      ]],
      { i(1, 'language'), i(2, 'code') }
    )
  ),

  s(
    { trig = 'bf', desc = 'Bold' },
    fmta(
      [[
        \textbf{<>} <>
      ]],
      { i(1), i(0) }
    )
  ),

  s(
    { trig = 'it', desc = 'Italics' },
    fmta(
      [[
        \textit{<>} <>
      ]],
      { i(1), i(0) }
    )
  ),

  s(
    { trig = 'beg', desc = 'Begin Environment' },
    fmta(
      [[
        \begin{<>}
            <>
        \end{<>}
      ]],
      { i(1), i(0), rep(1) }
    )
  ),

  s({ trig = 'mk', desc = 'Inline math', snippetType = 'autosnippet' }, fmta([[$<>$]], { i(1) })),

  s(
    { trig = 'dm', desc = 'Math block', snippetType = 'autosnippet' },
    fmta(
      [[
      \[
          <>
      \]
      ]],
      { i(1) }
    )
  ),
}
