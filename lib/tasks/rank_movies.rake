task :rank_movies do
  
  class Movie

    def initialize(title)
      @title = title     
      @popularity = 0
    end
    
    def increment_popularity(inc)
      @popularity = @popularity + inc
    end
    
    attr_accessor :title, :popularity
  
  end

  ranked_movies = Array.new
  
  counter = 0.0
  file = File.new("gistfile1.txt","r")

  while(line = file.gets)
    
    ranks = line.split(",")
    innercounter = 0
    
    ranks.each do |s|

      c = s.scan(/\d+:(.+)/)[0][0]
      
      if(counter < 1)  
        ranked_movies[innercounter] = Movie.new(c)
      end
      
      ranked_movies[innercounter].increment_popularity(s.match(/\d+/)[0].to_i)
      
      innercounter = innercounter + 1
    
    end
    
    counter = counter + 1
  
  end

  ranked_movies.sort! { |a,b| a.popularity <=> b.popularity }
  
  counter = 1
  ranked_movies.each do |movie|
    puts "#{counter}. #{movie.title}"
    counter = counter + 1
  end

end
