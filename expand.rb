
def expand(filename)
  lines = File.readlines(filename)
  old_dir = Dir.getwd

  Dir.chdir File.dirname(filename)
  lines = lines.flat_map do |line|
    if line =~ /(include|use)\s*<(.*)>/
      # File.readlines("./#{$2}")
      expand("./#{$2}")
    # in lieu of actually implementing `use`, we can just cull this final line from key.scad
    elsif line =~ /example\_key\(\);/
      ""
    else
      line
    end
  end

  Dir.chdir old_dir

  lines
end

lines = expand(ARGV[1] || 'customizer_base.scad')

f = File.open('customizer.scad', 'w')
f.write lines.join
