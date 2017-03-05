class UsersImporter

  def initialize(filename=File.absolute_path('db/data/users.csv'))
    @filename = filename
  end

  def import
    field_names = ['first_name', 'last_name', 'email', 'password', 'latitude', 'longitude']
    puts "Importing users from '#{@filename}'"
    failure_count = 0
    fails = []
    User.transaction do
      File.open(@filename).each do |line|
        data = line.chomp.split(',')
        attribute_hash = Hash[field_names.zip(data)]
        begin
          User.create!(attribute_hash)
          print '.'
        rescue ActiveRecord::UnknownAttributeError
          failure_count += 1
          print '!'
          fails.push(data)
        ensure
          STDOUT.flush
        end
      end
    end
    #failures = failure_count > 0 ? "(failed to create #{failure_count} user records)" : ''
    #puts "\nDONE #{failures}\n\n"
    if failure_count > 0
      error_file = "#{@filename}_errors.csv"
      File.open(error_file, 'w') do |errors|
        errors.puts field_names
        errors.puts "\n"
        fails.each do |fail|
          errors.puts fail.join(',')
          errror.puts "\n"
        end
      end
      puts "#{failue_count} records were not created.  There were expored to #{error_file} for review"
    else
      puts "\nDONE\n importing #{@filename}"
    end
  end

end