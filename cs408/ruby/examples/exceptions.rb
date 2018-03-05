def ex
    raise StandardError 
end

begin
    ex
    puts "This line won't print"
rescue Exception
    puts "Exception rescued!"
ensure
    puts "This line prints no matter what"
end
