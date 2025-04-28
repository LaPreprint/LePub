-- keywords-filter-complete.lua
-- Extract keywords and remove the keywords paragraph from the document

local keywords = {}
local found_keywords_para = false

function Para(elem)
  -- Check if this is the keywords paragraph
  local text = pandoc.utils.stringify(elem)
  
  if text:match("^Keywords?:%s*") then
    -- Extract keywords
    local keyword_text = text:gsub("^Keywords?:%s*", "")
    for keyword in keyword_text:gmatch("[^,]+") do
      keyword = keyword:match("^%s*(.-)%s*$")
      if keyword ~= "" then
        table.insert(keywords, keyword)
      end
    end
    
    -- Remove this paragraph from the document
    found_keywords_para = true
    return {} -- Empty list removes the element
  end
  
  return elem
end

function Meta(meta)
  if #keywords > 0 then
    local keyword_list = pandoc.MetaList({})
    for _, keyword in ipairs(keywords) do
      keyword_list:insert(pandoc.MetaString(keyword))
    end
    
    meta.keywords = keyword_list
    meta.keywords_string = pandoc.MetaString(table.concat(keywords, ", "))
    
    print("Extracted keywords: " .. table.concat(keywords, ", "))
  end
  
  return meta
end

-- Return filter functions
return {{Para = Para}, {Meta = Meta}}