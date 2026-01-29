-- landscape filter --
-- Date: Jan 28 2026
-- Date modified: Jan 28 2026
-- author: MJ

function Div(el)
  if el.classes:includes('landscape') then
    if FORMAT:match 'latex' then
      local start = pandoc.RawBlock('latex', 
        '\\clearpage\\storeareas\\portraitarea\\KOMAoptions{paper=landscape, pagesize}\\recalctypearea\n')
      local end  = pandoc.RawBlock('latex', 
        '\\clearpage\\portraitarea\n')
      
      table.insert(el.content, 1, start)
      table.insert(el.content, end)
      
      return el.content
    end
  end
  return el
end
