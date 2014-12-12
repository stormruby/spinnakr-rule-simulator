require 'optparse'
require 'ostruct'
require 'pp'

class Options

  def parse(args)

    options = OpenStruct.new
    options.verbose = false

    ### Rule Type can be comparator or observer
    options.t = "comparator"

    ### 1 = URL, 2 = File, 3 = Queue

    options.x = "1"

    ### One can post to a URL, File, or Queue

    options.e = "test.spnee.rules"
    options.f = "mydata.json"

    ### Components of the URL
    options.g = "localhost"
    options.p = "4567"

    ### Endpoint Part1 and Part2

    options.ep1 = "api/1.0/rule/"
    options.ep2 = options.t

    options.m = "job-skills"
    options.n = 2

    opt_parser = OptionParser.new do |opts|
      opts.banner = "Usage: sim.rb [options]"

      opts.on("-e Exchange", "Exchange name") do |q|
        options.e = q
      end

      opts.on("-f File", "File name") do |f|
        options.f = f
      end

      opts.on("-n Host", "Host name") do |q|
        options.g = q
      end

      opts.on("-p Port", "Port number") do |q|
        options.p = q
      end

      opts.on("-ep1 Endpoint1", "Endpoint Part 1") do |q|
        options.ep1 = q
      end

      opts.on("-ep2 Endpoint2", "Endpoint Part 2") do |q|
        options.ep2 = q
      end

      # Boolean switch.
      opts.on("-v", "Run verbosely") do |v|
        options.verbose = v
      end

      # Dimension Options

      opts.on("-m Dimension", "String Dimension name") do |m|
        options.m = m
      end

      # Rule Type

      opts.on("-t Type", "String Rule Type name") do |t|
        options.t = t
      end

      # Integer Options

      opts.on("-n Rules", Integer, "Integer Send in n rules") do |x|
        options.n = x
      end

      # No argument, shows at tail.  This will print an options summary.
      # Try it and see!
      opts.on_tail("-h", "--help", "Show this message") do
        puts opts
        exit
      end
    end
    opt_parser.parse!(args)
    options
  end
end

#myoptions = Options.new
#puts myoptions.parse(ARGV)
