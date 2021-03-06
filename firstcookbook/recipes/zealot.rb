# Add this to your layer as firstcookbook::zealot

include_recipe 'slack' #This can also be included as slack::default

node[:deploy].each do |application, deploy|
  
  ruby_block "zealot_random_quotes" do 
    block do 
       #This is Chef's way to pass data between resources
       node.set[:runtime][:zealot][:message] = [
          "My life for Aiur!",
          "What battle calls?",
          "I long for combat!",
          "Issah'tu!",
          "Gau'gurah!",
          "Khas I serve!",
          "Honor guide me!",
          "For Adun!"
       ].sample
       Chef::Log.info("Protoss: #{node[:runtime][:zealot][:message]}")
    end
  end
  
  
  slack_say "say_something_clever" do
    message lazy {node[:runtime][:zealot][:message]}
    username "Protoss Zealot"
    icon_url "http://upload.wikimedia.org/wikipedia/en/8/8f/Zealot_(StarCraft).png"
  end
  
end
