local function file_exists(filename)
  local file = io.open(filename, "r")
  if file then
    file:close()
    return true
  else
    return false
  end
end

function Go_to_test()
  full_path = tostring(vim.fn.expand("%"))
  current_file = tostring(vim.fn.expand("%:t"))
  current_file_without_extension = string.gsub(current_file, ".rb", "")
  if string.find(current_file, "_spec") then
    class_path = string.gsub(full_path, "spec/", "app/")
    class_path = string.gsub(class_path, "_spec", "")

    if file_exists(class_path) == true then
      vim.cmd.edit(class_path)
    end
  else
    spec_path = string.gsub(full_path, "app/", "spec/")
    spec_path = string.gsub(spec_path, ".rb", "_spec.rb")

    if file_exists(spec_path) == true then
      vim.cmd.edit(spec_path)
    end
  end
end
