function from_log_path(tag, timestamp, record)
    local path = record["filepath"] or record["path"] or ""
    -- /etc/docker/logs/81f96ffa78df.log → 81f96ffa78df
    local name = path:match("([^/]+)%.log$")
    if type(name) ~= "string" or name == "" then
        name = "unknown"
    else
        name = name:lower()
    end

    record["container_name"] = name
    record["container_id"] = name
    return 1, timestamp, record
end
