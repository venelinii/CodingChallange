class Encoder

  attr_accessor :codeWord
  attr_accessor :base
  def initialize
    @codeWord = ['v','o','y','a','g','e','r','V','O','Y','A','G','E','R']
    @base = codeWord.length
  end

  def encode(integer)
    answer = ""
    based = integer.to_s(base)

    based.split("").each do |i|
      answer = answer + codeWord[i.to_i(base)]
    end
      return answer.reverse!
  end

  def decode(word)
    answer = ""
    
    word.split("").each do |i|
      answer = answer + codeWord.index(i).to_s(base)
    end    
    return answer.reverse!.to_i(base)
  end
    

  def isSizeOdd?(word)
    return word.length % 2 != 0
  end
end


if __FILE__ == $0
  encoder = Encoder.new
  File.open(ARGV[0]) do |f|
    counter = 0
    while (line = f.gets)
        line = line.split(" ")
        if line[0] == "encode"
          puts "#{counter}: #{encoder.encode(line[1].to_i)}"
        else
          puts "#{counter}: #{encoder.decode(line[1])}"
        end
        counter = counter + 1
    end
  end
end