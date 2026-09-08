function from_log_path(tag, timestamp, record)
    local path = record["filepath"] or record["path"] or ""
    -- /etc/docker/logs/81f96ffa78df.log → 81f96ffa78df
    local name = path:match("([^/]+)%.log$")
    if type(name) == "string" and name ~= "" then
        record["container_name"] = name:lower()
        record["container_id"] = name:lower()
    else
        record["container_name"] = "unknown"
    end
    return 1, timestamp, record
end
