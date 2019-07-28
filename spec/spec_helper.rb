require_relative '../variable.rb'

RSpec.configure do |config|
  config.order = 'default'
end

def get_variable_from_file(file, variable)
  file_scope = binding
  file_scope.eval(File.read(file))

  begin
    return file_scope.local_variable_get(variable)
  rescue NameError
    raise NameError, "local variable `#{variable}` not defined in #{file}."
  end
end

def burd_made_this_to_reverse_engineer_rspec_tests(file, variable, secretkey)
  file_scope = binding
  # burd doesn't know what binding does

  file_scope.eval(File.read(file))
  # burd thinks this reads the files like "burdtest.rb" and "variable.rb"

  begin
    return file_scope.local_variable_get(variable)
  rescue NameError
    raise NameError, "local variable `#{variable}` not defined in #{file}."
  end
end
