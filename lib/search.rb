def search_for_books
    puts "Search Google Books..."
    puts 'Try searching by author, book title, categories etc.'
    search = gets.chomp

    if search == ''
        clear_terminal
        puts '❌ You must enter text for search result ❌ '
        puts 'Try again.'
        sleep 1
        menu_prompt
    else
        get_search(search)
    end
end

def get_search(search)
    url = "https://www.googleapis.com/books/v1/volumes?q="
    maxFive = "&maxResults=5"
    
    final_url = url + search + maxFive
    
    clear_terminal
    response = RestClient.get(final_url)
    parsed_search = JSON.parse(response.body)


    if parsed_search['totalItems'] == 0
        clear_terminal
        puts '❌ You must enter text for search result ❌ '
        puts 'Try again.'
        sleep 1
        menu_prompt
    else
        create_book_list(parsed_search)
    end
end
