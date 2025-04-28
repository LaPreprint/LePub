-- docx-custom-properties.lua
-- A Pandoc Lua filter to extract custom properties from DOCX files

local function file_exists(name)
    local f = io.open(name, "r")
    if f ~= nil then io.close(f) return true else return false end
 end
 
 -- Check if running on Windows
 local function is_windows()
   return package.config:sub(1,1) == '\\'
 end
 
 -- Function to extract custom properties from DOCX
 local function extract_custom_properties()
   -- Get the input file path
   local input_files = PANDOC_STATE.input_files
   if #input_files == 0 then
     print("No input files found")
     return {}
   end
   
   local docx_path = input_files[1]
   print("Processing file: " .. docx_path)
   
   -- Check if the file is a DOCX
   if not docx_path:match("%.docx$") then
     print("Not a DOCX file")
     return {}
   end
   
   -- Create a temporary directory
   local temp_dir
   if is_windows() then
     temp_dir = os.getenv("TEMP") .. "\\" .. os.tmpname():gsub("/", "")
     os.execute("mkdir " .. temp_dir)
   else
     temp_dir = os.tmpname()
     os.remove(temp_dir)
     os.execute("mkdir -p " .. temp_dir)
   end
   print("Temp directory: " .. temp_dir)
   
   -- Unzip the DOCX file
   local unzip_cmd
   if is_windows() then
     -- Windows using PowerShell
     unzip_cmd = 'powershell -command "Expand-Archive -Path ' .. "'" .. docx_path .. "'" .. 
                 ' -DestinationPath ' .. "'" .. temp_dir .. "'" .. ' -Force"'
   else
     -- Unix-like systems
     unzip_cmd = string.format("unzip -q '%s' -d '%s'", docx_path, temp_dir)
   end
   print("Unzip command: " .. unzip_cmd)
   os.execute(unzip_cmd)
   
   -- Path to custom properties
   local custom_xml_path
   if is_windows() then
     custom_xml_path = temp_dir .. "\\docProps\\custom.xml"
   else
     custom_xml_path = temp_dir .. "/docProps/custom.xml"
   end
   print("Looking for custom.xml at: " .. custom_xml_path)
   
   local properties = {}
   
   -- Check if custom properties file exists
   if file_exists(custom_xml_path) then
     print("custom.xml found!")
     -- Read the custom properties XML
     local file = io.open(custom_xml_path, "r")
     if file then
       local content = file:read("*all")
       file:close()
       print("custom.xml content length: " .. #content)
       print("First 200 chars: " .. content:sub(1, 200))
       
       -- Parse XML content
       -- Match the entire property tag including attributes
       for property in content:gmatch("<property[^>]*>.-</property>") do
         -- Extract name from attributes
         local name = property:match('name="([^"]+)"')
         local value
         
         -- Extract value from the content between tags
         value = property:match('<vt:lpwstr>(.-)</vt:lpwstr>') or
                 property:match('<vt:i4>(.-)</vt:i4>') or
                 property:match('<vt:bool>(.-)</vt:bool>') or
                 property:match('<vt:filetime>(.-)</vt:filetime>')
         
         if name and value then
           -- Trim whitespace
           value = value:match("^%s*(.-)%s*$")
           print(string.format("Found property: %s = %s", name, value))
           properties[name] = value
         else
           print(string.format("Failed to parse property: name=%s, full property=%s", tostring(name), property))
         end
       end
     else
       print("Could not open custom.xml file")
     end
   else
     print("custom.xml not found")
   end
   
   -- Clean up temporary directory
   if is_windows() then
     os.execute("rmdir /s /q " .. temp_dir)
   else
     os.execute("rm -rf " .. temp_dir)
   end
   
   return properties
 end
 
 -- Main filter function
 function Meta(meta)
   print("Filter running...")
   local custom_props = extract_custom_properties()
   
   -- Debug: Print found properties
   if next(custom_props) then
     print("Custom properties found:")
     for k, v in pairs(custom_props) do
       print(string.format("  %s: %s", k, v))
     end
   else
     print("No custom properties found")
   end
   
   -- Add custom properties to metadata
   for key, value in pairs(custom_props) do
     -- Convert boolean strings to actual booleans
     if value == "true" then
       meta[key] = true
     elseif value == "false" then
       meta[key] = false
     else
       meta[key] = pandoc.MetaString(value)
     end
   end
   
   -- Debug: Print final metadata
   print("Current metadata keys:")
   for k, v in pairs(meta) do
     print(string.format("  %s", k))
   end
   
   return meta
 end