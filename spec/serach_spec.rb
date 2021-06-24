require "spec_helper"
require_relative '../lib/cli'
require_relative '../lib/search'

# describe CLI do
#     it "user search input" do 
#         cli = CLI.new
#         cli.search_for_books

#         user_input = gets.chomp

#         expect { user_input == '' }.to output('❌ You must enter text for search result ❌ ').to_stdout
#     end

#     it "menu promp" do
#         cli = CLI.new
#         cli.menu_prompt

#         expect { display_menu = ["Search Google Books?", "View Reading List", "Log Off"] }.to output('this works')
#     end

# end

