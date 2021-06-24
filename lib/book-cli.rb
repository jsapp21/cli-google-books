def create_book_list(parsed_search)
    choices = []
    i = 0

    5.times do
    book = {}
    search = parsed_search['items'][i]['volumeInfo']
    
    book[:title] = search['title'] || 'N/A'

    if !search['authors']
        book[:author] = 'N/A'
    elsif 
        search['authors'].count <= 1
        book[:author] = search['authors'][0] || 'N/A'
    else
        book[:author] = search['authors'].join(" & ")
    end
    
    book[:publisher] = search['publisher'] || 'N/A'

    eachBook = 'Book: ' + book[:title] + ', Author: ' + book[:author] + ', Publishing Company: ' + book[:publisher]
    
    choices.push({key: i, name: eachBook, value: book})
    i += 1
    end

    view_books_prompt(choices)
end

def view_books_prompt(choices)
    prompt = TTY::Prompt.new
    selectedBooksArr = prompt.multi_select("Select books to add to your Reading List:", choices)
    clear_terminal
    
    insert_books(selectedBooksArr)
    clear_terminal
end

def insert_books(selectedBooksArr)
    selectedBooksArr.each do |book|
        bookExists = Book.insert_or_find_book(book)
        list = List.check_list_for_book(bookExists, @user.id)
        if list
            puts '❗️ This book is already on your Reading List ❗️'
            sleep 1
        else
            List.add_book_to_list(bookExists, @user.id)
            puts '✅  This book was added book to Reading List ✅ '
            sleep 1
        end
    end
    menu_prompt
end