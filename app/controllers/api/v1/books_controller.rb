module Api
  module V1
    class BooksController < ApplicationController
      MAX_PAGINATION_LIMIT = 100

      def index
        books = Book::limit(limit).offset(params[:offset])

        render json: BooksRepresenter.new(books).as_json
      end
    
      def create
        # binding.irb # just like dd in php or console.log in js
        author = Author.create!(author_params)
        book = Book.new(book_params.merge(author_id: author.id))

        if book.save
          render json: BookRepresenter.new(book).as_json, status: :created
        else
          render json: book.errors, status: :unprocessable_entity
        end
      end
    
      def destroy
        Book.find(params[:id]).destroy! # note that the exclamation mark here helps to handle exception
    
        head :no_content
      end
      
    
      private
      #this method checks whether the limit passed by the user exceeds 100 and returns 100 because that the max number of books we want returned at 1ce
      def limit 
        [
          params.fetch(:limit, MAX_PAGINATION_LIMIT).to_i, # fetch check here so that if user don't specify a limit we default to 100
          MAX_PAGINATION_LIMIT,
        ].min #returns the min of the array
      end
      

      def author_params
        params.require(:author).
            permit(:first_name, :last_name, :age)
      end
      
        
      def book_params
          params.require(:book).
            permit(:title)
      end
    
      def not_destroyed
        render json: {}, status: :unprocessable_entity
      end
      
    end
  end
end
