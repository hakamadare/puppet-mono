# mono_installed.rb

Facter.add("mono_installed") do
  confine :kernel => "Darwin"
  setcode do
    File.directory?("/Library/Frameworks/Mono.framework") ? 'true' : 'false'
  end
end
