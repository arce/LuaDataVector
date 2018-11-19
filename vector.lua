function vector(oid)
    local table = {}
    local _table = table
    table = {}
    local metatable={
        __newindex = function(table,k,v)
            _table[k]=v
        end,
        __index = function(table,k)
            return _table[k]
        end,
        __oid = oid
    }
    table.size = function()
        return #_table
    end
    table.oid = function()
        return metatable.__oid
    end
    setmetatable(table,metatable)
    return table
end
