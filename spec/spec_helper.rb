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

def burd_made_this_to_reverse_engineer_rspec_tests(some_file, some_variable, another_variable)
  file_scope = binding
  # burd doesn't know what binding does yet

  file_scope.eval(File.read(file))
  # burd thinks this reads the files like "burdtest.rb" and "variable.rb"

  begin
    return file_scope.local_variable_get(some_variable)
  rescue NameError
  # this must stop everything when the test fails
    raise NameError, "A mysterious variable `#{some_variable}` created by Burd is not defined in the #{file} file."
  end
end
