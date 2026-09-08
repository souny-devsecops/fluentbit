function strip_container_slash(tag, timestamp, record)
    local name = record["container_name"]
    if type(name) == "string" then
        -- ตัด / นำหน้า + บังคับ lowercase (ES index ต้องเป็นตัวเล็ก)
        name = name:gsub("^/", ""):lower()
        record["container_name"] = name
    end
    return 1, timestamp, record
end
