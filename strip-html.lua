function Div (elem)
  return elem.content
end

function LineBreak(elem)
  return {}
end

function Image(elem)
  elem.attributes = {}
  return elem
end
